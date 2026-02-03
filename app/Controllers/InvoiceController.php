<?php

namespace App\Controllers;
use CodeIgniter\RESTful\ResourceController;
use GuzzleHttp\Client;
use App\Models\InvoiceModel;
use CodeIgniter\HTTP\ResponseInterface; // 👈 AGREGA ESTO ARRIBA

class InvoiceController extends ResourceController
{
    protected $format = 'json';

    public function create()
    {
        $data = $this->request->getJSON(true);
        $ventaId = $data['venta_id'];
        $total = $data['total'];
        $items = $data['items'];
        $regimen = $data['regimen'];
        $cfdi = $data['cfdi'];
        $cp = $data['cp'];
        $razon = $data['razon'];
        $rfc = $data['rfc'];

        $factura = [
            'Serie' => 'A',
            'Folio' => uniqid(),
            'CfdiType' => 'I',
            'PaymentForm' => '01', // Efectivo
            'PaymentMethod' => 'PUE',  //revisar
            'Currency' => 'MXN',
            'ExpeditionPlace' => '03020',
            'Receiver' => [
                'Rfc' => $rfc,
                'Name' => $razon,
                'CfdiUse' => $cfdi,
                "TaxZipCode" => $cp,
                'FiscalRegime' => $regimen
            ],
            'Items' => []
        ];


        foreach ($items as $i => $item) {

            $ivaRate = 0.16;
            $precio = floatval($item['price']);
            $subtotal = $precio / (1 + $ivaRate);
            $iva = $precio - $subtotal;
            $iva = round($iva, 2);
            $subtotal = round($subtotal, 2);

            $factura['Items'][] = [
                'ProductCode' => '10101504',
                'IdentificationNumber' => $item['idProduct'] ?? '001',
                'Description' => $item['description'],
                'Unit' => 'Servicio',
                'UnitCode' => 'E48',
                'UnitPrice' => $subtotal,
                'Quantity' => 1,
                'Subtotal' => $subtotal,
                'Total' => $subtotal + $iva,
                'TaxObject' => '02',
                'Taxes' => [
                    [
                        'Total' => $iva,
                        'Name' => 'IVA',
                        'Base' => $subtotal,
                        'Rate' => 0.16,
                        'IsRetention' => false
                    ]
                ]
            ];
        }
    

        try {
            $client = new Client([
                'base_uri' => 'https://apisandbox.facturama.mx/',
                'auth' => ['globaltrade', 'PgM57rNK5mtb7T7'],
                'verify' => false, // 👈 DESACTIVA SSL
                'headers' => [
                    'Accept' => 'application/json',
                    'Content-Type' => 'application/json'
                ]
            ]);

            // Crear la factura
            $response = $client->post('3/cfdis', [
                'json' => $factura
            ]);

            $result = json_decode($response->getBody()->getContents(), true);
            $cfdiId = $result['Id'];

            // Obtener el PDF en base64
            $pdfResponse = $client->get("api/Cfdi/pdf/issued/{$cfdiId}");
            $pdfData = json_decode($pdfResponse->getBody(), true);

            if (isset($pdfData['ContentEncoding']) && $pdfData['ContentEncoding'] === 'base64') {
                $pdfContent = base64_decode($pdfData['Content']);

                $facturaModel = new InvoiceModel();
                $facturaModel->insert([
                    'idOrder' => $ventaId,
                    'base64' => $pdfData['Content'],
                    'status' => 1, // o lo que necesites
                ]);
                // Descargar como archivo PDF
                return $this->response->setJSON([
                    'filename' => 'factura.pdf',
                    'base64' => $pdfData['Content']
                ]);
            } else {
                return $this->response->setJSON([
                    'error' => 'No se recibió contenido en base64',
                    'data' => $pdfData
                ]);
            }

        } catch (\GuzzleHttp\Exception\ClientException $e) {
            return $this->fail(json_decode($e->getResponse()->getBody()->getContents(), true));
        } catch (\Exception $e) {
            return $this->failServerError($e->getMessage());
        }
    }

    public function getTypes()
{
    try {
        $client = new Client([
            'base_uri' => 'https://apisandbox.facturama.mx/',
            'auth' => ['globaltrade', 'PgM57rNK5mtb7T7'],
            'verify' => false, // 👈 DESACTIVA SSL
            'headers' => [
                'Accept' => 'application/json'
            ]
        ]);

        $response = $client->get('Catalogs/CfdiTypes');

        $data = json_decode($response->getBody()->getContents(), true);

        return $this->response->setJSON($data);

    } catch (\GuzzleHttp\Exception\ClientException $e) {
        return $this->response
            ->setStatusCode(ResponseInterface::HTTP_BAD_REQUEST)
            ->setJSON([
                'error' => 'Error en la petición a Facturama',
                'detalle' => json_decode($e->getResponse()->getBody()->getContents(), true)
            ]);

    } catch (\Exception $e) {
        return $this->response
            ->setStatusCode(ResponseInterface::HTTP_INTERNAL_SERVER_ERROR)
            ->setJSON([
                'error' => 'Error del servidor',
                'detalle' => $e->getMessage()
            ]);
    }
}
}
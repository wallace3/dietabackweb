<?php

namespace App\Controllers;


use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\Database\BaseBuilder;
use App\Models\StripeModel;
use App\Models\StripeDetailsModel;
use App\Models\ProductsModel;
use App\Models\CartModel;
use Stripe\Stripe;
use Stripe\Checkout\Session;
use Stripe\Customer;
use Stripe\Product;
use Stripe\Price;


class StripeController extends ResourceController
{   

    public function createCheckoutSession()
    {
       
        Stripe::setApiKey('sk_test_51RRhZsEEk2wvGozKcyinkkIIAYUe58FQdqCbfWqCEOlMrV776OQlZU6tTNmU7UYC0c1DKM4RiSzClMyQCI6EGMRM00dDOYzCDf');

        $items = $this->request->getJSON(true); 
        
        $orderModel = new StripeModel();

        $orderId = $orderModel->insert([
            'orderDate' => date('Y-m-d H:i:s'),
            'idUser' => $items[0]['user_id'],
            'status' => 'pending',
            'total' => 0,
            'stripeId' => '',
            'paymentStatus' => ''
        ]);

        
        if (!$orderId) {
            $errors = $orderModel->errors(); 
            return $this->response->setJSON(['error' => 'Error al insertar orden', 'details' => $errors]);
        }

        $orderDetailsModel = new StripeDetailsModel();
        $lineItems = [];

    
        foreach ($items as $item) {
            $orderDetailsModel->insert([
                'idOrder' => $orderId,
                'idProduct' => $item['id'],
                'price' => $item['price']
            ]);

            $lineItems[] = [
                'price_data' => [
                    'currency' => 'mxn',
                    'product_data' => [
                        'name' => $item['name'],
                        'description' => $item['description'] ?? ''
                    ],
                    'unit_amount' => intval($item['price'] * 100), 
                ],
                'quantity' => $item['quantity']
            ];
        }

       
        $session = Session::create([
            'payment_method_types' => ['card'],
            'line_items' => $lineItems,
            'mode' => 'payment',
            'success_url' => 'http://localhost:8081/pagos/exito?session_id={CHECKOUT_SESSION_ID}',
            'cancel_url' => 'http://localhost:8081/pagos/error?session_id={CHECKOUT_SESSION_ID}',
            'metadata' => [
                'order_id' => $orderId,
                'user_id'=>$items[0]['user_id']
            ]
        ]);
    
        return $this->response->setJSON(['id' => $session->id]);

    }

    public function sessionInfo($id = null)
    {
        $sessionId = $id;
    
        Stripe::setApiKey('sk_test_51RRhZsEEk2wvGozKcyinkkIIAYUe58FQdqCbfWqCEOlMrV776OQlZU6tTNmU7UYC0c1DKM4RiSzClMyQCI6EGMRM00dDOYzCDf');

        try {
            $session = Session::retrieve($sessionId);
            $orderModel = new StripeModel();
            $orderDetailsModel = new StripeDetailsModel();
            $orderId = $session->metadata->order_id ?? null;
            $userId = $session->metadata->user_id ?? null;

            if (!$orderId) {
                return redirect()->to('/error');
            }

            $orderModel = new StripeModel();
            $orderModel->update($orderId, [
                'status' => $session->payment_intent,
                'paymentStatus' => $session->payment_status,
                'stripeId' => $session->id,
                'total' => $session->amount_total / 100
            ]);

            if($session->payment_status == 'paid'){
                $productModel = new ProductsModel();
                $productIds = $orderDetailsModel
                ->where('idOrder', $orderId)
                ->findAll();

                foreach ($productIds as $detail) {
                    $productModel->update($detail['idProduct'], [
                        'status' => 0
                    ]);
                }

                if ($userId) {
                    $cartModel = new CartModel();
                    $cartModel->where('idUser', $userId)->delete();
                }
            }

            return $this->respondCreated(['session' => $session, 'status' => 'ok', 'order_id' => $orderId, 'cliente' => $customer?->name ?? 'Cliente']);

        } catch (\Exception $e) {
            return $this->response->setJSON([
                'error' => 'Error al procesar la sesión',
                'message' => $e->getMessage()
            ]);
        }
    }

    public function paidOrders()
    {
        $db = \Config\Database::connect();
        $builder = $db->table('orders o');
        $builder->select('o.*, u.name, u.lastName, u.email, u.phone');
        $builder->join('users u', 'u.idUser = o.idUser');
        $builder->where('o.paymentStatus','paid');
        $result =  $builder->get()->getResultArray(); 
        return $this->respond($result);
    }

}

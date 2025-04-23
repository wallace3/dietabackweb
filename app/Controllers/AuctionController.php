<?php

namespace App\Controllers;

use App\Models\AuctionModel;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\Database\BaseBuilder;

class AuctionController extends ResourceController
{

    protected $auctionModel;

    public function __construct()
    {
        $this->auctionModel = new AuctionModel();
    }

    public function index()
    {
        $data = $this->auctionModel->findAll();
        if ($data) {
            return $this->respond($data);
        }
        return $this->failNotFound('No se encontraron productos para subasta');
    }

    public function create()
    {
        $data = $this->request->getJSON(true);
        if(!$data){
            return $this->failValidationErrors('No se recibieron datos válidos.');
        }

        if($this->auctionModel->insert($data)){
            return $this->respondCreated(['message' => 'Se agrego producto para subasta' , 'status' => 200]);
        }
    }

    public function getActives()
    {
        $db      = \Config\Database::connect();
        $builder = $db->table('auction');
        $query = $builder->where('status', 1)->get();
        $result = $query->getResultArray();
        return $this->respond($result);
    }

    public function endAuction($id = null)
    {
        $data = $this->request->getJSON(true);
        if ($this->auctionModel->update($id, $data)) {
            return $this->respond(['message' => 'Subasta finalizada correctamente', 'status'=>200]);
        } else {
            return $this->failValidationErrors($this->addressModel->errors());
        }
    }

    public function delete($id = null)
    {
        if ($this->auctionModel->delete($id)) {
            return $this->respondDeleted(['message' => 'Producto eliminado correctamente de la subasta', 'status'=>200]);
        }
        return $this->failNotFound('Producto no encontrad0');
    }
}

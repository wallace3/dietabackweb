<?php

namespace App\Controllers;

use App\Models\BidsModel;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\Database\BaseBuilder;

class BidsController extends ResourceController{
    protected $bidsModel;

    public function __construct()
    {
        $this->bidsModel = new BidsModel();
    }

    public function index()
    {
        $data = $this->bidsModel->findAll();
        if($data){
            return $this->respond($data);
        }
        return $this->failNotFound('No se encontraró ninguna oferta');
    }

    public function create()
    {
        $data = $this->request->getJSON(true);
        if(!$data){
            return $this->failValidationErrors('No se recibieron datos válidos.');
        }
        if($this->bidsModel->insert($data)){
            return $this->respondCreated(['message' => 'Se agregó oferta' , 'status' => 200]);
        }
    }

    public function productBids($id = null)
    {
        $db      = \Config\Database::connect();
        $builder = $db->table('bids');
        $query = $builder->where('idProduct', $id)->get();
        $result = $query->getResultArray();
        return $this->respond($result);
    }

    public function getBids()
    {
        $db      = \Config\Database::connect();
        $builder = $db->table('bids b');
        $builder->select('b.amount, b.created_at, b.idAuction, b.idBid, a.name as auction, p.name, u.name as firstName, u.lastName, MIN(i.url) as image_url');
        $builder->join('products p', 'b.idProduct = p.idProduct', 'left');
        $builder->join('users u', 'b.idUser = u.idUser', 'left');
        $builder->join('auction a', 'b.idAuction = a.idAuction', 'left');
        $builder->join('images i', 'b.idProduct = i.idProduct', 'left');
        $builder->groupBy('p.name, u.lastName, u.name, b.amount, b.idBid, b.idAuction, a.name, b.created_at');
        $query = $builder->get();
        $result = $query->getResult();
        return $this->respond($result);

    }

}
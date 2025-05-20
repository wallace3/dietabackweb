<?php

namespace App\Controllers;

use App\Models\AuctionDetailsModel;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\Database\BaseBuilder;

class AuctionDetailsController extends ResourceController
{

    protected $auctiondetailsModel;

    public function __construct()
    {
        $this->auctiondetailsModel = new AuctionDetailsModel();
    }

    public function index()
    {
        $data = $this->auctiondetailsModel->findAll();
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
        $db  = \Config\Database::connect();
        $builder = $db->table('auction_details');
        $builder->where('idAuction', $data['idAuction']);
        $builder->where('idProduct', $data['idProduct']);
        $query = $builder->get();
        $result = $query->getResult();
        if(!$result){
            if($this->auctiondetailsModel->insert($data)){
                return $this->respondCreated(['message' => 'Se agrego producto para subasta' , 'status' => 200]);
            }
        }else{
            return $this->respondCreated(['message' => 'Ya existe producto en la subasta' , 'status' => 405]);
        }
    }

    public function getAuctionProducts($id = null)
    {
        $db  = \Config\Database::connect();
        $builder = $db->table('auction_details ad');
        $builder->select('ad.idAuctionDetail, ad.idAuction, p.price, p.idProduct, p.name, p.description, MIN(i.url) AS image_url, MAX(b.amount) as bid');
        $builder->join('products p', 'ad.idProduct = p.idProduct', 'left');
        $builder->join('images i', 'ad.idProduct = i.idProduct', 'left');
        $builder->join('bids b', 'ad.idProduct = b.idProduct AND ad.idAuction = b.idAuction', 'left');
        $builder->where('ad.idAuction', $id);
        $builder->groupBy('ad.idAuctionDetail, ad.idAuction, p.price, p.idProduct, p.name, p.description');
        $query = $builder->get();
        $result = $query->getResult();
        return $this->respond($result);
    }

    public function delete($id = null)
    {
        if ($this->auctiondetailsModel->delete($id)) {
            return $this->respondDeleted(['message' => 'Producto eliminado correctamente de la subasta', 'status'=>200]);
        }
        return $this->failNotFound('Producto no encontrad0');
    }

}

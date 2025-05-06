<?php

namespace App\Controllers;

use App\Models\WishListModel;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\Database\BaseBuilder;

class WishListController extends ResourceController{
    protected $wishlistModel;

    public function __construct()
    {
        $this->wishlistModel = new WishListModel();
    }

    public function index()
    {
        $data = $this->wishlistModel->findAll();
        if($data){
            return $this->respond($data);
        }
        return $this->failNotFound('No se encontró ningún carrito');
    }

    public function create()
    {
        $data = $this->request->getJSON(true);
        if(!$data){
            return $this->failValidationErrors('No se recibieron datos válidos.');
        }
        if($this->wishlistModel->insert($data)){
            return $this->respondCreated(['message' => 'Se agregó producto a wishlist' , 'status' => 200]);
        }
    }

    public function getWishList($id = null)
    {
        $db = \Config\Database::connect();
        $builder = $db->table('wishlist c');
        $builder->select('p.idProduct, p.description, p.price , c.idWishList, MIN(i.url) AS image_url');
        $builder->join('products p', 'c.idProduct = p.idProduct', 'left');
        $builder->join('users u', 'c.idUser = u.idUser', 'left');
        $builder->join('images i', 'c.idProduct = i.idProduct', 'left');
        $builder->where('c.idUser', $id);
        $builder->groupBy('p.idProduct, p.description, p.price , c.idWishList, image_url');
        $result =  $builder->get()->getResultArray(); // o getResultArray()
        return $this->respond($result);
    }

    public function delete($id = null){
        $cart = $this->wishlistModel->find($id);
        if($cart){
            if ($this->wishlistModel->delete($id)) {
                return $this->respondDeleted(['message' => 'producto eliminado de carrito correctamente', 'status'=>200]);
            }
        }else{
            return $this->failNotFound('Carrito no encontrado');
        }
    }

}
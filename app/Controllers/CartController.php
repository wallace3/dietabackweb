<?php

namespace App\Controllers;

use App\Models\CartModel;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\Database\BaseBuilder;

class CartController extends ResourceController{
    protected $cartModel;

    public function __construct()
    {
        $this->cartModel = new CartModel();
    }

    public function index()
    {
        $data = $this->cartModel->findAll();
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
        if($this->cartModel->insert($data)){
            return $this->respondCreated(['message' => 'Se producto a carrito' , 'status' => 200]);
        }
    }

    public function getCart($id = null)
    {
        $db = \Config\Database::connect();
        $builder = $db->table('cart c');
        $builder->select('p.idProduct, p.description, p.price , c.idCart, MIN(i.url) AS image_url');
        $builder->join('products p', 'c.idProduct = p.idProduct', 'left');
        $builder->join('users u', 'c.idUser = u.idUser', 'left');
        $builder->join('images i', 'c.idProduct = i.idProduct', 'left');
        $builder->where('c.idUser', $id);
        $builder->groupBy('p.idProduct, p.description, p.price , c.idCart');
        $result =  $builder->get()->getResultArray(); // o getResultArray()
        return $this->respond($result);
    }

    public function delete($id = null){
        $cart = $this->cartModel->find($id);
        if($cart){
            if ($this->cartModel->delete($id)) {
                return $this->respondDeleted(['message' => 'producto eliminado de carrito correctamente', 'status'=>200]);
            }
        }else{
            return $this->failNotFound('Carrito no encontrado');
        }
    }

}
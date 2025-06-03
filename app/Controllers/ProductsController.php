<?php

namespace App\Controllers;

use App\Models\ProductsModel;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\Database\BaseBuilder;

class ProductsController extends ResourceController
{
    protected $productsModel;

    public function __construct()
    {
        $this->productsModel = new ProductsModel();
    }

    public function index(){
        $products = $this->productsModel->where('status', 1)->findAll();
        if ($products) {
            return $this->respond($products);
        }
        return $this->failNotFound('No se encontraron productos');
    }

    public function create(){
        $data = $this->request->getJSON(true);
        if (!$data) {
            return $this->failValidationErrors('No se recibieron datos válidos.');
        }
        if ($this->productsModel->insert($data)) {
            return $this->respondCreated(['message' => 'Se agrego producto' , 'status' => 200]);
        } 
    }

    public function update($id = null){
        $data = $this->request->getJSON(true);
        if ($this->productsModel->update($id, $data)) {
            return $this->respond(['message' => 'Se ha actualizado correctamente', 'status'=>200]);
        } else {
            return $this->failValidationErrors($this->productsModel->errors());
        }
    }

    public function deactivateProduct($id = null){
        $data = $this->request->getJSON(true);
        $prod = $this->productsModel->find($id);
        if($prod){
            if($this->productsModel->update($id,$data)){
                return $this->respond(['message' => 'Se desactivo producto correctamente', 'status'=>200]);
            }
        }else{
            return $this->failNotFound('Producto no encontrado');
        }
    }

    public function show($id = null){
        $prod = $this->productsModel->find($id);
        if ($prod) {
            return $this->respond($prod);
        }
        return $this->failNotFound('Producto no encontrado');
    }

    public function getProductsImage(){
        $db = \Config\Database::connect();
        $builder = $db->table('products p');
        $builder->select(' p.idProduct,p.name,p.price,MIN(i.url) AS image_url, p.description');
        $builder->join('images i', 'p.idProduct = i.idProduct', 'left');
        $builder->where('p.status', 1);
        $builder->groupBy('p.idProduct, p.name, p.price, p.description');
        $result =  $builder->get()->getResultArray(); // o getResultArray()
        return $this->respond($result);
    }

    public function getProductsByCategory($name = null){
        header('Content-Type: text/html; charset=UTF-8');
        $db = \Config\Database::connect();
        $category = $this->request->getGet('category');
        $name = urldecode($category);
        $builder = $db->table('products p');
        $builder->select(' p.idProduct,p.name,p.price,MIN(i.url) AS image_url, p.description');
        $builder->join('images i', 'p.idProduct = i.idProduct', 'left');
        $builder->join('categories c', 'c.idCategory = p.idCategory', 'left');
        $builder->where('p.status', 1);
        $builder->like('c.name', $name);
        $builder->groupBy('p.idProduct, p.name, p.price, p.description');
        $result =  $builder->get()->getResultArray(); // o getResultArray()
        return $this->respond($result);
    }

}
<?php

namespace App\Controllers;

use App\Models\CategoriesModel;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\Database\BaseBuilder;

class CategoriesController extends ResourceController
{
    protected $categoriesModel;

    public function __construct()
    {
        $this->categoriesModel = new CategoriesModel();
    }

    public function index(){
        $categories = $this->categoriesModel->findAll();
        if ($categories) {
            return $this->respond($categories);
        }
        return $this->failNotFound('No se encontraron categorias');
    }

    public function create(){
        $name = $this->request->getPost('name');
        $status = $this->request->getPost('status');
        $file = $this->request->getFile('image');
       
        $uploadPath = FCPATH . 'uploads/images/categories/';
        if (!is_dir($uploadPath)) {
            mkdir($uploadPath, 0777, true);
        }

        if ($file && $file->isValid() && !$file->hasMoved()) {
            $fileName = $file->getRandomName();
            $file->move($uploadPath, $fileName);
        }

        $this->categoriesModel->insert([
            'name' => $name,
            'image'=> $fileName,
            'url' => 'uploads/images/categories/' . $fileName,
            'status' => $status
        ]);

        return $this->respond([
            'message' => 'Imágenes subidas con éxito',
            'files' => $fileName,
            'status' => 200

        ], 200);

    }

    public function update($id = null){
        $data = $this->request->getJSON(true);
        if ($this->categoriesModel->update($id, $data)) {
            return $this->respond(['message' => 'Se ha actualizado correctamente', 'status'=>200]);
        } else {
            return $this->failValidationErrors($this->categoriesModel->errors());
        }
    }

    public function deactivateCategory($id = null){
        $data = $this->request->getJSON(true);
        $cat = $this->categoriesModel->find($id);
        if($cat){
            if($this->categoriesModel->update($id,$data)){
                return $this->respond(['message' => 'Se desactivo categoría correctamente', 'status'=>200]);
            }
        }else{
            return $this->failNotFound('categoría no encontrada');
        }
    }

    public function delete($id = null){
        $cat = $this->categoriesModel->find($id);
        if($cat){
            if ($this->categoriesModel->delete($id)) {
                return $this->respondDeleted(['message' => 'categoria eliminada correctamente', 'status'=>200]);
            }
        }else{
            return $this->failNotFound('Categoría no encontrada');
        }
    }

}
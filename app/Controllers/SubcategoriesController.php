<?php

namespace App\Controllers;

use App\Models\SubcategoriesModel;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\Database\BaseBuilder;

class SubcategoriesController extends ResourceController
{
    protected $subcategoriesModel;

    public function __construct()
    {
        $this->subcategoriesModel = new SubcategoriesModel();
    }

    public function index(){
        $subcategories = $this->subcategoriesModel->findAll();
        if ($subcategories) {
            return $this->respond($subcategories);
        }
        return $this->failNotFound('No se encontraron subcategorias');
    }

    public function create(){
        $data = $this->request->getJSON(true);
        if (!$data) {
            return $this->failValidationErrors('No se recibieron datos válidos.');
        }
        if ($this->subcategoriesModel->insert($data)) {
            return $this->respond(['message' => 'Se agrego categoría correctamente' , 'status' => 200]);
        }else{
            return $this->respond(['message' => 'Ocurrió un error al agregar subcategoría' , 'status' => 400]);
        }
    }

    public function update($id = null){
        $data = $this->request->getJSON(true);
        if ($this->subcategoriesModel->update($id, $data)) {
            return $this->respond(['message' => 'Se ha actualizado correctamente', 'status'=>200]);
        } else {
            return $this->failValidationErrors($this->subcategoriesModel->errors());
        }
    }

    public function deactivateSubCategory($id = null){
        $data = $this->request->getJSON(true);
        $cat = $this->subcategoriesModel->find($id);
        if($cat){
            if($this->subcategoriesModel->update($id,$data)){
                return $this->respond(['message' => 'Se desactivo subcategoría correctamente', 'status'=>200]);
            }
        }else{
            return $this->failNotFound('subcategoría no encontrada');
        }
    }

    public function delete($id = null){
        $cat = $this->subcategoriesModel->find($id);
        if($cat){
            if ($this->subcategoriesModel->delete($id)) {
                return $this->respondDeleted(['message' => 'subcategoria eliminada correctamente', 'status'=>200]);
            }
        }else{
            return $this->failNotFound('SubCategoría no encontrada');
        }
    }

}
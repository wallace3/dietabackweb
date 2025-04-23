<?php

namespace App\Controllers;

use App\Models\TypesModel;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\Database\BaseBuilder;

class TypesController extends ResourceController
{
    protected $typesModel;

    public function __construct()
    {
        $this->typesModel = new TypesModel();
    }

    public function index(){
        $types = $this->typesModel->findAll();
        if ($types) {
            return $this->respond($types);
        }
        return $this->failNotFound('No se encontraron tipos de usuario');
    }

    public function create(){
        $data = $this->request->getJSON(true);
        if (!$data) {
            return $this->failValidationErrors('No se recibieron datos válidos.');
        }
        if ($this->typesModel->insert($data)) {
            return $this->respondCreated(['message' => 'Se agrego tipo de usuario correctamente' , 'status' => 200]);
        } 
    }

}
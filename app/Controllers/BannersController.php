<?php

namespace App\Controllers;

use App\Models\BannersModel;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\Database\BaseBuilder;

class BannersController extends ResourceController
{
    protected $bannersModel;

    public function __construct()
    {
        $this->bannersModel = new BannersModel();
    }

    public function index()
    {
        $data = $this->bannersModel->findAll();
        if($data){
            return $this->respond($data);
        }
        return $this->failNotFound('No se encontro ningun banner');
    }

    public function create()
    {
        $data = $this->request->getJSON(true);
        if (!$data) {
            return $this->failValidationErrors('No se recibieron datos válidos.');
        }
        if ($this->bannersModel->insert($data)) {
            return $this->respondCreated(['message' => 'Se agregó imagen correctamente' , 'status' => 200]);
        } 
    }

    public function delete($id = null)
    {
        $img = $this->bannersModel->find($id);
        if($img){
            if ($this->bannersModel->delete($id)) {
                return $this->respondDeleted(['message' => 'Imagen eliminada correctamente', 'status'=>200]);
            }
        }else{
            return $this->failNotFound('Imagen no encontrada');
        }
    }

    public function upload(){
        $files = $this->request->getFiles(); // Obtener todos los archivos
        $uploadedFiles = [];

        if (!isset($files['images'])) {
            return $this->fail('No se enviaron imágenes.');
        }

        $uploadPath = FCPATH . 'uploads/images/banners/';
        if (!is_dir($uploadPath)) {
            mkdir($uploadPath, 0777, true);
        }

      
        foreach ($files['images'] as $file) {
            if (!$file->isValid()) {
                return $this->fail($file->getErrorString());
            }

            $newName = $file->getRandomName();
            $file->move($uploadPath, $newName);

            // Guardar en la base de datos
            $this->bannersModel->insert([
                'name' => $newName,
                'url' => 'uploads/images/banners/' . $newName,
                'status' => 1
            ]);

            $uploadedFiles[] = [
                'file_name' => $newName,
                'file_path' => base_url('uploads/images/banners/' . $newName)
            ];
        }

        return $this->respond([
            'message' => 'Imágenes subidas con éxito',
            'files' => $uploadedFiles,
            'status' => 200

        ], 200);

    }

}
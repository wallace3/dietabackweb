<?php

namespace App\Controllers;

use App\Models\ImagesModel;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\Database\BaseBuilder;

class ImagesController extends ResourceController
{
    protected $imagesModel;

    public function __construct()
    {
        $this->imagesModel = new ImagesModel();
    }

    public function index($id = null)
    {
        $db      = \Config\Database::connect();
        $builder = $db->table('images');
        $query = $builder->where('idProduct', $id)->get();
        $result = $query->getResultArray();
        return $this->respond(['message' => 'listado imagenes' , 'status' => 200, 'data' => $result]);
    }

    public function create()
    {
        $data = $this->request->getJSON(true);
        if (!$data) {
            return $this->failValidationErrors('No se recibieron datos válidos.');
        }
        if ($this->imagesModel->insert($data)) {
            return $this->respondCreated(['message' => 'Se agregó imagen correctamente' , 'status' => 200]);
        } 
    }

    public function delete($id = null)
    {
        $img = $this->imagesModel->find($id);
        if($img){
            if ($this->imagesModel->delete($id)) {
                return $this->respondDeleted(['message' => 'Imagen eliminada correctamente', 'status'=>200]);
            }
        }else{
            return $this->failNotFound('Imagen no encontrada');
        }
    }

    public function upload($id = null){
        $files = $this->request->getFiles(); // Obtener todos los archivos
        $uploadedFiles = [];

        if (!isset($files['images'])) {
            return $this->fail('No se enviaron imágenes.');
        }

        $uploadPath = FCPATH . 'uploads/images/';
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
            $this->imagesModel->insert([
                'idProduct' => $id,
                'name' => $newName,
                'url' => 'uploads/images/' . $newName,
                'status' => 1
            ]);

            $uploadedFiles[] = [
                'file_name' => $newName,
                'file_path' => base_url('uploads/images/' . $newName)
            ];
        }

        return $this->respond([
            'message' => 'Imágenes subidas con éxito',
            'files' => $uploadedFiles,
            'status' => 200

        ], 200);

    }

}
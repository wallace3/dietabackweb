<?php

namespace App\Controllers;

use App\Models\AuctionModel;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\Database\BaseBuilder;

class AuctionController extends ResourceController
{

    protected $auctionModel;

    public function __construct()
    {
        $this->auctionModel = new AuctionModel();
    }

    public function index()
    {
        $data = $this->auctionModel->findAll();
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

        if($this->auctionModel->insert($data)){
            return $this->respondCreated(['message' => 'Se agrego producto para subasta' , 'status' => 200]);
        }
    }

    public function getActives()
    {
        $db      = \Config\Database::connect();
        $builder = $db->table('auction');
        $query = $builder->where('status', 1)->get();
        $result = $query->getResultArray();
        return $this->respond($result);
    }

    public function endAuction($id = null)
    {
        $data = $this->request->getJSON(true);
        if ($this->auctionModel->update($id, $data)) {
            return $this->respond(['message' => 'Subasta finalizada correctamente', 'status'=>200]);
        } else {
            return $this->failValidationErrors($this->addressModel->errors());
        }
    }

    public function delete($id = null)
    {
        if ($this->auctionModel->delete($id)) {
            return $this->respondDeleted(['message' => 'Producto eliminado correctamente de la subasta', 'status'=>200]);
        }
        return $this->failNotFound('Producto no encontrad0');
    }

    public function createAuction()
    {
        $name = $this->request->getPost('name');
        $status = $this->request->getPost('status');
        $description = $this->request->getPost('description');
        $user = $this->request->getPost('idUser');
        $startDate = $this->request->getPost('startDate');
        $endDate = $this->request->getPost('endDate');
        $file = $this->request->getFile('image_url');

       
        $uploadPath = FCPATH . 'uploads/images/auctions/';
        if (!is_dir($uploadPath)) {
            mkdir($uploadPath, 0777, true);
        }

        if ($file && $file->isValid() && !$file->hasMoved()) {
            $fileName = $file->getRandomName();
            $file->move($uploadPath, $fileName);
        }

        $this->auctionModel->insert([
            'name' => $name,
            'description' => $description,
            'image_url'=> 'uploads/images/auctions/' . $fileName,
            'startTime' => $startDate,
            'endTime' => $endDate,
            'idUser' => $user,
            'status' => $status
        ]);

        return $this->respond([
            'message' => 'Subasta creada con éxito',
            'files' => $fileName,
            'status' => 200

        ], 200);
    }

    public function updateAuction($id = null)
    {
        $auction = $this->request->getPost('auction');
        $description =  $this->request->getPost('description');
        $endDate =  $this->request->getPost('endDate');
        $startDate = $this->request->getPost('startDate');
        $file = $this->request->getFile('image_url');

        $uploadPath = FCPATH . 'uploads/images/auctions/';
        if (!is_dir($uploadPath)) {
            mkdir($uploadPath, 0777, true);
        }

        if ($file && $file->isValid() && !$file->hasMoved()) {
            $fileName = $file->getRandomName();
            $file->move($uploadPath, $fileName);
        }

        $this->auctionModel->update($id,[
            'name' => $auction,
            'description' => $description,
            'image_url'=> 'uploads/images/auctions/' .$fileName,
            'startTime' => $startDate,
            'endTime' => $endDate,
            'idUser' => 1,
            'status' => 1
        ]);

        var_dump($this->auctionModel->update($id,[
            'name' => $auction,
            'description' => $description,
            'image_url'=> 'uploads/images/categories/' .$fileName,
            'startTime' => $startDate,
            'endTime' => $endDate,
            'idUser' => 1,
            'status' => 1
        ]));

        return $this->respond([
            'message' => 'Subasta actualizada correctamente',
            'files' => $fileName,
            'status' => 200

        ], 200);
    }
}

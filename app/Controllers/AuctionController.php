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

    public function getAuctionAmount($id = null)
    {
        $db      = \Config\Database::connect();
        $builder = $db->table('auction');
        $builder->select('amount');
        $query = $builder->where('idAuction', $id)->get();
        $result = $query->getResult();
        return $this->respond($result);
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
        $amount = $this->request->getPost('amount');
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
            'amount' => $amount,
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
        $amount = $this->request->getPost('amount');
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
            'amount' => $amount,
            'idUser' => 1,
            'status' => 1
        ]);

        return $this->respond([
            'message' => 'Subasta actualizada correctamente',
            'files' => $fileName,
            'status' => 200

        ], 200);
    }

    public function getEndedAuctions()
    {
        $db      = \Config\Database::connect();
        $builder = $db->table('auction');
        $query = $builder->where('status', 0)->get();
        $result = $query->getResultArray();
        return $this->respond($result);
    }

    public function getResultAuctions($id=null)
    {
       $db = \Config\Database::connect();

        $sql = "
            SELECT 
                ad.idAuctionDetail, 
                ad.idAuction, 
                p.name as product, 
                p.price, 
                MIN(i.url) as image_url,
                b_max.amount as bid,
                b_max.idUser,
                a.name
            FROM auction_details ad 
            JOIN products p ON ad.idProduct = p.idProduct 
            JOIN auction a ON ad.idAuction = a.idAuction
            LEFT JOIN images i ON ad.idProduct = i.idProduct
            LEFT JOIN (
                SELECT b1.idAuction, b1.idProduct, b1.amount, b1.idUser
                FROM bids b1
                INNER JOIN (
                    SELECT idAuction, idProduct, MAX(amount) as max_amount
                    FROM bids
                    GROUP BY idAuction, idProduct
                ) b2 
                ON b1.idAuction = b2.idAuction 
                AND b1.idProduct = b2.idProduct 
                AND b1.amount = b2.max_amount
            ) b_max ON ad.idAuction = b_max.idAuction AND ad.idProduct = b_max.idProduct
            WHERE ad.idAuction = ?
            GROUP BY ad.idAuctionDetail, ad.idAuction, p.price, p.name, b_max.amount, b_max.idUser, a.name
        ";

        $query = $db->query($sql, [$id]); // 8 es el idAuction, puedes pasarlo dinámicamente

        $result = $query->getResultArray();
        return $this->respond($result);
    }

    function getUnderBidders($id=null)
    {
        $db = \Config\Database::connect();

        $sql = "
            SELECT 
                b.idUser,
                u.name AS user_name,
                u.lastNAme AS apellidos,
                b.idAuction,
                b.idProduct,
                p.name AS product,
                p.price,
                MAX(b.amount) AS lost_bid,
                MIN(i.url) as image_url,
                a.name as auction
            FROM bids b
            JOIN users u ON u.idUser = b.idUser
            JOIN products p ON p.idProduct = b.idProduct
            JOIN images i ON b.idProduct = i.idProduct
            JOIN auction a ON a.idAuction = b.idAuction
            WHERE b.idAuction = ?
            AND (b.idAuction, b.idProduct, b.amount) NOT IN (
                SELECT idAuction, idProduct, MAX(amount)
                FROM bids
                WHERE idAuction = ?
                GROUP BY idAuction, idProduct
            )
            GROUP BY b.idUser, b.idAuction, b.idProduct, u.name, p.name
            ORDER BY b.idUser, b.idProduct;
        ";

        $query = $db->query($sql, [$id,$id]); // 8 es el idAuction, puedes pasarlo dinámicamente

        $result = $query->getResultArray();
        return $this->respond($result);
    }
}

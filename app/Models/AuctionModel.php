<?php

namespace App\Models;

use CodeIgniter\Model;

class AuctionModel extends Model
{
    protected $table = 'auction';
    protected $primaryKey = 'idAuction';
    protected $allowedFields = ['name','description','image_url','idProduct','startTime','endTime','amount','idUser','status','created_at','updated_at'];
    protected $useTimestamps = true;
    protected $createdField = 'created_at';
    protected $updatedField = 'updated_at';
}

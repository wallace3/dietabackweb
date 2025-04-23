<?php

namespace App\Models;

use CodeIgniter\Model;

class AuctionModel extends Model
{
    protected $table = 'auction';
    protected $primaryKey = 'idAuction';
    protected $allowedFields = ['idProduct','startTime','endTime','idUser','status','created_at','updated_at'];
    protected $useTimestamps = true;
    protected $createdField = 'created_at';
    protected $updatedField = 'updated_at';
}

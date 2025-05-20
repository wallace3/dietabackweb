<?php

namespace App\Models;

use CodeIgniter\Model;

class BidsModel extends Model
{
    protected $table = 'bids';
    protected $primaryKey = 'idBid';
    protected $allowedFields = ['idAuction','idProduct','idUser','amount','status','created_at','updated_at'];
    protected $useTimestamps = true;
    protected $createdField = 'created_at';
    protected $updatedField = 'updated_at';
}
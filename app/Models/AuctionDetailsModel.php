<?php

namespace App\Models;

use CodeIgniter\Model;

class AuctionDetailsModel extends Model
{
    protected $table = 'auction_details';
    protected $primaryKey = 'idAuctionDetail';
    protected $allowedFields = ['idAuction','idProduct','idUser','status','updated_at'];
    protected $useTimestamps = true;
    protected $createdField = 'created_at';
    protected $updatedField = 'updated_at';
}

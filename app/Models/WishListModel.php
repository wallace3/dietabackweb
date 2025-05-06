<?php

namespace App\Models;

use CodeIgniter\Model;

class WishListModel extends Model
{
    protected $table = 'wishlist';
    protected $primaryKey = 'idWishList';
    protected $allowedFields = ['idProduct','idUser','created_at','updated_at'];
    protected $useTimestamps = true;
    protected $createdField = 'created_at';
    protected $updatedField = 'updated_at';
}
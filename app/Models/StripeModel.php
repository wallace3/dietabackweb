<?php

namespace App\Models;

use CodeIgniter\Model;

class StripeModel extends Model
{
    protected $table = 'orders';
    protected $primaryKey = 'idOrder';
    protected $allowedFields = ['orderDate','idUser','status','total','stripeId','paymentStatus','created_at','updated_at'];
    protected $useTimestamps = true;
    protected $createdField = 'created_at';
    protected $updatedField = 'updated_at';
}
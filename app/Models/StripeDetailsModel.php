<?php

namespace App\Models;

use CodeIgniter\Model;

class StripeDetailsModel extends Model
{
    protected $table = 'order_details';
    protected $primaryKey = 'idOrderDetail';
    protected $allowedFields = ['idOrder','idProduct','price','id_stripe'];
    protected $useTimestamps = true;
    protected $createdField = 'created_at';
    protected $updatedField = 'updated_at';
}
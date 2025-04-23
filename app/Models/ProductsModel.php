<?php

    namespace App\Models;

    use CodeIgniter\Model;

    class ProductsModel extends Model
    {
        protected $table = 'products';
        protected $primaryKey = 'idProduct';
        protected $allowedFields = ['name','description','idCategory','idSubcategory','idUser','price','status', 'created_at', 'updated_at'];
        protected $useTimestamps = true;
        protected $createdField = 'created_at';
        protected $updatedField = 'updated_at';
    }
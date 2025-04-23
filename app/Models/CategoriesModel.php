<?php

    namespace App\Models;

    use CodeIgniter\Model;

    class CategoriesModel extends Model
    {
        protected $table = 'categories';
        protected $primaryKey = 'idCategory';
        protected $allowedFields = ['name','status','image','url','created_at', 'updated_at'];
        protected $useTimestamps = true;
        protected $createdField = 'created_at';
        protected $updatedField = 'updated_at';
    }
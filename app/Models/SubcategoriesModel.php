<?php

    namespace App\Models;

    use CodeIgniter\Model;

    class SubcategoriesModel extends Model
    {
        protected $table = 'subcategories';
        protected $primaryKey = 'idSubcategory';
        protected $allowedFields = ['idCategory','name','status','created_at', 'updated_at'];
        protected $useTimestamps = true;
        protected $createdField = 'created_at';
        protected $updatedField = 'updated_at';
    }
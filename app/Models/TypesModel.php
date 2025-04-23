<?php

    namespace App\Models;

    use CodeIgniter\Model;

    class TypesModel extends Model
    {
        protected $table = 'user_types';
        protected $primaryKey = 'idType';
        protected $allowedFields = ['name','status','created_at', 'updated_at'];
        protected $useTimestamps = true;
        protected $createdField = 'created_at';
        protected $updatedField = 'updated_at';
    }
<?php

    namespace App\Models;

    use CodeIgniter\Model;

    class BannersModel extends Model
    {
        protected $table = 'banners';
        protected $primaryKey = 'idBanner';
        protected $allowedFields = ['name','url','status','created_at', 'updated_at'];
        protected $useTimestamps = true;
        protected $createdField = 'created_at';
        protected $updatedField = 'updated_at';
    }
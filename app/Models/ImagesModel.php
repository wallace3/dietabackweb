<?php

    namespace App\Models;

    use CodeIgniter\Model;

    class ImagesModel extends Model
    {
        protected $table = 'images';
        protected $primaryKey = 'idImage';
        protected $allowedFields = ['idProduct','name','url','status','created_at', 'updated_at'];
        protected $useTimestamps = true;
        protected $createdField = 'created_at';
        protected $updatedField = 'updated_at';
    }
<?php

    namespace App\Models;

    use CodeIgniter\Model;

    class AddressModel extends Model
    {
        protected $table = 'address';
        protected $primaryKey = 'idAddress';
        protected $allowedFields = ['idUser','name','street','suburb','city','state','cp','country', 'reference', 'defaultAddress','status', 'created_at', 'updated_at'];
        protected $useTimestamps = true;
        protected $createdField = 'created_at';
        protected $updatedField = 'updated_at';
    }
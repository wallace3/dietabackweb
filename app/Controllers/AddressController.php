<?php

namespace App\Controllers;

use App\Models\AddressModel;
use CodeIgniter\RESTful\ResourceController;
use CodeIgniter\Database\BaseBuilder;

class AddressController extends ResourceController
{
    protected $addressModel;

    public function __construct()
    {
        $this->addressModel = new AddressModel();
    }

    // Obtener todos los usuarios
    public function index($id = null)
    {
        $db      = \Config\Database::connect();
        $builder = $db->table('address');
        $query = $builder->where('idUser', $id)->get();
        $result = $query->getResultArray();
        return $this->respond($result);
    }

    // Crear un users
    public function create()
    {
        {
            $data = $this->request->getJSON(true);            
            if (!$data) {
                return $this->failValidationErrors('No se recibieron datos válidos.');
            }

            if ($this->addressModel->insert($data)) {
                return $this->respondCreated(['message' => 'Dirección agregada correctamente' , 'status' => 200]);
            } 
        }
    }

    // Obtener una direccion por ID
    public function show($id = null)
    {
        $address = $this->addressModel->find($id);
        if ($address) {
            return $this->respond($address);
        }
        return $this->failNotFound('Usuario no encontrado');
    }

    // Actualizar direccion
    public function update($id = null)
    {
        $data = $this->request->getJSON(true);
        if ($this->addressModel->update($id, $data)) {
            return $this->respond(['message' => 'Dirección actualizada correctamente', 'status'=>200]);
        } else {
            return $this->failValidationErrors($this->addressModel->errors());
        }
    }

    // Eliminar direccion
    public function delete($id = null)
    {
        if ($this->addressModel->delete($id)) {
            return $this->respondDeleted(['message' => 'Dirección eliminada correctamente', 'status'=>200]);
        }
        return $this->failNotFound('Dirección no encontrada');
    }

    // desactivar direccion
    public function deactivateAddress($id = null){
        $data = $this->request->getJSON(true);
        $address = $this->addressModel->find($id);
        if($address){
            if($this->addressModel->update($id,$data)){
                return $this->respond(['message' => 'Se desactivo dirección correctamente', 'status'=>200]);
            }
        }else{
            return $this->failNotFound('Dirección no encontrada');
        }
    }

     // Obtener una direccion por default value
    public function defaultAddress($id = null)
    {
        $db      = \Config\Database::connect();
        $builder = $db->table('address');
        $builder->where('idUser', $id);
        $builder->where('defaultAddress', 1);
        $query = $builder->get();
        $result = $query->getResult();
        return $this->respond(["message" => "Direccion default", "status"=>200, "data" => $result]);
    }
 

}
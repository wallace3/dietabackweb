<?php

namespace App\Controllers;

use App\Models\UsersModel;
use CodeIgniter\RESTful\ResourceController;

class UsersController extends ResourceController
{
    protected $usersModel;

    public function __construct()
    {
        $this->usersModel = new UsersModel();
    }

    // Obtener todos los usuarios
    public function index()
    {
        $users = $this->usersModel->findAll();
        return $this->respond($users);
    }

    // Crear un users
    public function create()
    {
        {
            $data = $this->request->getJSON(true);
            if (!isset($data['password'])) {
                return $this->failValidationErrors('La contraseña es obligatoria.');
            }

            $data['password'] = password_hash($data['password'], PASSWORD_DEFAULT);
            
            if (!$data) {
                return $this->failValidationErrors('No se recibieron datos válidos.');
            }

            if ($this->usersModel->insert($data)) {
                return $this->respondCreated(['message' => 'Usuario creado correctamente']);
            } 
        }
    }

    // Obtener un users por ID
    public function show($id = null)
    {
        $user = $this->usersModel->find($id);
        if ($user) {
            return $this->respond($user);
        }
        return $this->failNotFound('Usuario no encontrado');
    }

    // Actualizar un users
    public function update($id = null)
    {
        $data = $this->request->getJSON(true);
        if ($this->usersModel->update($id, $data)) {
            return $this->respond(['message' => 'users actualizado correctamente', 'status'=>200]);
        } else {
            return $this->failValidationErrors($this->usersModel->errors());
        }
    }

    // Eliminar un users
    public function delete($id = null)
    {
        if ($this->usersModel->delete($id)) {
            return $this->respondDeleted(['message' => 'users eliminado correctamente', 'status'=>200]);
        }
        return $this->failNotFound('Usuario no encontrado');
    }

    public function changePassword($id = null)
    {
        $data = $this->request->getJSON(true);
        $data['password'] = password_hash($data['password'], PASSWORD_DEFAULT);
        if($this->usersModel->update($id,$data)){
            return $this->respond(['message' => 'Se cambio password correctamente' , 'status'=>200]);
        }
        return $this->failNotFound('Usuario no encontrado');
    }

    public function deactivateUser($id = null){
        $data = $this->request->getJSON(true);
        $user = $this->usersModel->find($id);
        if($user){
            if($this->usersModel->update($id,$data)){
                return $this->respond(['message' => 'Se desactivo usuario correctamente', 'status'=>200]);
            }
        }else{
            return $this->failNotFound('Usuario no encontrado');
        }
    }
}
<?php
namespace App\Controllers;

use CodeIgniter\Controller;

class ContactController extends Controller
{
    public function send()
    {
        // Lee el cuerpo JSON enviado desde Vue
        $data = $this->request->getJSON();

        $name = $data->name ?? null;
        $email = $data->email ?? null;
        $phone = $data->phone ?? null;
        $message = $data->message ?? null;

        // Validar datos básicos

        if (!$name || !$email || !$message) {
            return $this->response->setStatusCode(400)->setJSON(['message' => 'Todos los campos son obligatorios']);
        }

        // Configuración para enviar correo
        $emailService = \Config\Services::email();

        $emailService->setFrom('service@globaltradeandauctions.com', 'Global trade and auctions');
        $emailService->setTo('admin@globaltradeandauctions.com');
        $emailService->setReplyTo($email, $name);
        $emailService->setSubject('Nuevo mensaje de contacto');
        $emailService->setMessage(
            "Nombre: $name\n".
            "Correo: $email\n".
            "Teléfono: $phone\n".
            "Mensaje:\n$message"
        );

        if ($emailService->send()) {
            return $this->response->setJSON(['message' => 'Correo enviado con éxito']);
        } else {
            return $this->response->setStatusCode(404)->setJSON(['message' => 'Error al enviar el correo']);
        }
    }
}
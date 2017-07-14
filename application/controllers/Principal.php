<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');


/**
 * Created by PhpStorm.
 * User: cl
 * Date: 7/13/17
 * Time: 10:03 PM
 */
class Principal extends MY_Controller
{
    public function index()
    {
        $this->load->view('login');
    }



    public function validar(){
        $this->load->database();
        if ($this->input->post()) {
            $correoUsuario = $this->input->post('correoUsuario');
            $this->load->model('Usuario_model'); //load se refiere a cargar en este caso el modelo correspondiente
            $user=$this->Usuario_model->validar($correoUsuario);
            if($user){
                $datos_usuario=array(
                    'UsuarioId' =>$user->UsuarioId,
                    'NombreApellido' =>$user->NombreApellido,
                    'Tipo' => $user->Tipo,
                    'Correo' => $user->Correo,
                    'logueado'=>TRUE
                );
                $this->session->set_userdata($datos_usuario);

                redirect('tecnico'); //redirige al default controller
            }
            else{
                redirect('http://reddit.com');

            }
        }

    }


    public function logout(){
        $this->session->sess_destroy();
        redirect('principal');


    }




}
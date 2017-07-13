<?php

/**
 * Created by PhpStorm.
 * User: cl
 * Date: 7/9/17
 * Time: 4:12 PM
 */
class Tecnico extends MY_Controller
{

    public function index(){
        $this->campanhas();
    }



    public function campanhas($regionID= 1) {

        $this->load->database();

        $this->load->model('Campanha_model');

        $data['datos'] = $this->Campanha_model->get_by_region_id($regionID);

        $this->load->view('templates/header', $data);
        $this->load->view('templates/filtro');
        $this->load->view('campanhas.php', $data);
        $this->load->view('templates/footer', $data);

    }

    public function elegir_perfil($campanhaId = NULL){
        if($campanhaId == NULL){
            redirect('');
        }


        $this->load->database();

        //Obtener info de la campanha
        $this->load->model('Campanha_model');
        $campanha = $this->Campanha_model->get_by_id($campanhaId);

        //Obtener perfiles de la playa
        $this->load->model('Perfil_model');
        $perfiles= $this->Perfil_model->get_by_playaId($campanha->PlayaId);


        $arr = array();
        foreach ($perfiles as $perfil){
            $arr[" $perfil->PerfilId"] = array('vacio', $perfil->FotoReferencia, $perfil->DescMedicion);
        }


        $this->load->model('Bitacora_model');
        $bitacoras = $this->Bitacora_model->get_by_campanha($campanhaId);
        if($bitacoras != FALSE){
            foreach ($bitacoras as $bitacora){
                $arr[" $bitacora->PerfilId"][0] = $bitacora->UsuarioId;
                $arr[" $bitacora->PerfilId"][] = $bitacora->BitacoraId;
            }
        }

        $data['campanhaId'] = $campanhaId;
        $data['perfiles'] = $perfiles;

        $data['arreglo'] = $arr;

        $this->load->view('templates/header', $data);
        $this->load->view('elegir_perfil.php', $data);
        $this->load->view('templates/footer', $data);



    }

    public function ingresar_bitacora($perfilId = NULL, $campanhaId = NULL){
        if($campanhaId == NULL or $perfilId == NULL){
            redirect('');
        }

        //Revisar que bitacora no exista
        $this->load->database();
        $this->load->model('Bitacora_model');
        $existeBitacora = $this->Bitacora_model->exist_Bitacora($perfilId, $campanhaId);

        $data = array();

        if(!$existeBitacora){
            $this->load->view('templates/header');
            $this->load->view('templates/footer');
        }

    }



}
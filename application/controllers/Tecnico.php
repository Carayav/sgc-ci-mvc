<?php

/**
 * Created by PhpStorm.
 * User: cl
 * Date: 7/9/17
 * Time: 4:12 PM
 */
class Tecnico extends MY_Controller
{
    public function campanhas($regionID= 1) {

        $this->load->database();

        $this->load->model('Campanha_model');

        $data['datos'] = $this->Campanha_model->get_by_region_id($regionID);

        $this->load->view('templates/header', $data);
        $this->load->view('templates/filtro');
        $this->load->view('campanhas.php', $data);
        $this->load->view('templates/footer', $data);

    }

    public function elegir_perfil($campanhaId){
        $this->load->database();

        $this->load->model('Campanha_model');
        $campanha = $this->Campanha_model->get_by_id($campanhaId);

        $this->load->model('Perfil_model');
        $perfiles= $this->Perfil_model->get_by_playaId($campanha->PlayaId);

        $arr = array();
        foreach ($perfiles as $perfil){
            $arr[" $perfil->PerfilId"] = 'Vacio';
        }
        $this->load->model('Bitacora_model');
        $bitacoras = $this->Bitacora_model->get_by_campanha($campanhaId);

        foreach ($bitacoras as $bitacora){
            $arr[" $bitacora->PerfilId"] = $bitacora->UsuarioId;
        }

        $data['perfiles'] = $arr;


        $this->load->view('test.php', $data);

    }



}
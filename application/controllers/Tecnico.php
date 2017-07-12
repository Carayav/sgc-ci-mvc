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

        $data['title']=$regionID;

        $this->load->database();

        $this->load->model('Campanha_model');

        $data['datos'] = $this->Campanha_model->get_by_region_id($regionID);

        $this->load->view('templates/header', $data);
        $this->load->view('templates/filtro');
        $this->load->view('campanhas.php', $data);
        $this->load->view('templates/footer', $data);

    }



}
<?php

/**
 * Created by PhpStorm.
 * User: cl
 * Date: 7/12/17
 * Time: 3:06 PM
 */
class Test extends CI_Controller
{
    public function method_test($regionId = 1){

        $this->load->database();

        $this->load->model('Campanha_model');



        $data['datos'] = $this->Campanha_model->get_by_region_id($regionId);


        $this->load->view('test.php', $data);





    }


}
<?php

$this->load->database();
$this->load->model('Medicion_model');



foreach ($datos as $key => $valor){
    print_r($key);
    echo ' ';
    print_r($valor);
    echo '<br>';

    if(is_int($key)){
        echo 'Actualizar medicion ';
        echo $datos['bitacoraId'].'<br>';
        $med = $this->Medicion_model->get_by_id($key);
        if($med != FALSE){
            if($med->BitacoraId == $datos['bitacoraId']){
                echo 'eeeeeeeeeeeeee';

            }
        }
    }


}

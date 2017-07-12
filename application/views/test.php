<?php

/**
 * Created by PhpStorm.
 * User: cl
 * Date: 7/12/17
 * Time: 3:10 PM
 */

foreach ($datos as $ciudad => $playa){
    echo '<br>'.$ciudad.'<br>';
    foreach ($playa as $NombrePlaya => $datosPlaya){
        echo '<br>'.$NombrePlaya.'<br>';
        foreach ($datosPlaya as $key => $valor){
            if($key == 'Foto'){
                echo $valor."<br>";
            }
            else if($key == 'campanhas'){
                foreach ($valor as $campanha){
                    echo $campanha[0]." ";
                    echo $campanha[1]." ";
                    echo $campanha[2]." ";
                    echo $campanha[3]."<br>";
                }
            }
        }

    }

}





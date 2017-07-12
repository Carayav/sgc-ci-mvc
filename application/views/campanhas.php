
<div class="container-fluid">

<?php if($datos != false)
    foreach ($datos as $ciudad => $playa){
        echo '<h1>'.$ciudad.'</h1><hr>';
        foreach ($playa as $NombrePlaya => $datosPlaya){
            $html_playa = '<h2>'.$NombrePlaya.'</h2>';
            $html_playa .= '<div class="row"><div class="col-lg-2">';
            foreach ($datosPlaya as $key => $valor){
                if($key == 'Foto'){
                    $html_playa .='<img class="img-responsive hidden-xs" src=';
                    $html_playa .= base_url().'/assets/images/'.$valor.' alt=""/><br>';
                    $html_playa .= '<a href="ACCION_BOTON" type="button" class="btn btn-primary">Ver Informacion de Playa</a>';
                    $html_playa .= '</div>';
                }
                else if($key == 'campanhas'){
                    $html_playa .= '<div class="col-lg-9 table-responsive">';
                    $html_playa .= '<table class="table table-striped"><tr>';
                    $html_playa .= '<th>Compaña</th><th>Fecha</th><th>Perfiles</th>';
                    $html_playa .= '<th>Estado</th><th></th></tr></thead><tbody><tr>';
                    foreach ($valor as $campanha){
                        $html_playa .= '<td>'.$campanha[0].'</td>';
                        $html_playa .= '<td>'.$campanha[1].'</td>';
                        $html_playa .= '<td>'.$campanha[2].'</td>';
                        $html_playa .= '<td>'.$campanha[3].'</td></tr>';
                    }

                    echo '</tbody>'.$html_playa.'</table></div>';
                }
            }

            echo '</div><hr>';
        }

    }

?>
</div>

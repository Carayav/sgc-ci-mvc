
<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <div class="col-lg-9 table-responsive">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Id-Perfil</th>
                                    <th>Estado</th>
                                    <th>Accion</th>
                                </tr>
                            </thead>
                            <tbody>
                            <?php
                            $usuarioId = 1;


                            foreach ($arreglo as $perfilId => $infoPerfil){
                                $html = '<tr><td>'.$perfilId.'</td>';
                                if($infoPerfil[0] == 'vacio'){
                                    $html .= '<td>Ingresar Bitacora</td><td>';
                                    $accion = 'tecnico/ingresar_bitacora/'.(int)$perfilId.'/'.$campanhaId;
                                    $html .= '<a href="'.base_url()."/index.php/".$accion.'" type="button" class="btn btn-primary btn-xs">';
                                    $html .= 'Ingresar';
                                    $html .= '</a>';
                                }
                                else if($infoPerfil[0] == $usuarioId){
                                    $html .= '<td>Modificar Bitacora</td><td>';
                                    $accion ='tecnico/modificar_bitacora/'.$infoPerfil[3];
                                    $html .= '<a href="'.base_url()."/index.php/".$accion.'" type="button" class="btn btn-success btn-xs">';
                                    $html .= 'Modificar';
                                    $html .= '</a>';
                                }
                                else {
                                    $html .= '<td>Bitacora Ingresada por otro Usuario</td><td>';
                                    $accion = '';

                                }
                                $html .= '</td>';

                                echo $html;
                            }

                            ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
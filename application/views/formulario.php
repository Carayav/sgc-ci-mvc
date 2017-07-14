
<div id="wrapper">
    <div id="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h2>Ingreso Bitacora

                    <?php
                    echo " ".$bitacoraId."</h2>";
                    $hidden = array('bitacoraId' => $bitacoraId);
                    echo form_open('tecnico/actualizar', ['class' => 'form-signin', 'role' => 'form'], $hidden);
                    ?>

                    <table class="table" id="myTable">
                        <thead>
                        <tr>
                            <th>Em</th>
                            <th>E</th>
                            <th>dh</th>
                            <th>dv</th>
                            <th>Observación</th>
                        </tr>
                        </thead>
                        <tbody>

                        <?php
                        if($mediciones != FALSE) {
                        foreach ($mediciones as $medicion) {

                            ?>
                            <tr>
                                <td>
                                    <?php ;
                                    $data = array(
                                        'name'          => "$medicion->MedicionId[]",
                                        'id'            => 'username',
                                        'value'         => $medicion->EstacionMedicion,
                                        'class'         => 'form-control',

                                    );

                                    echo form_input($data); ?>

                                </td>
                                <td>
                                    <?php ;
                                    $data = array(
                                        'name'          => "$medicion->MedicionId[]",
                                        'id'            => 'username',
                                        'value'         => $medicion->Estacion,
                                        'class'         => 'form-control',

                                    );

                                    echo form_input($data); ?>
                                </td>
                                <td>
                                    <?php ;
                                    $data = array(
                                        'name'          => "$medicion->MedicionId[]",
                                        'id'            => 'username',
                                        'value'         => $medicion->DistHorizontal,
                                        'class'         => 'form-control',

                                    );

                                    echo form_input($data); ?>
                                </td>
                                <td>
                                    <?php ;
                                    $data = array(
                                        'name'          => "$medicion->MedicionId[]",
                                        'id'            => 'username',
                                        'value'         => $medicion->DistVertical,
                                        'class'         => 'form-control',

                                    );

                                    echo form_input($data); ?>
                                </td>
                                <td>
                                    <?php ;
                                    $data = array(
                                        'name'          => "$medicion->MedicionId[]",
                                        'id'            => 'username',
                                        'value'         => $medicion->Comentario,
                                        'class'         => 'form-control',

                                    );

                                    echo form_input($data); ?>
                                </td>
                            </tr>
                        <?php }} ?>

                        <?php
                        $filas = 10;
                        for ($i=0; $i < $filas; $i++){

                            ?>
                            <tr>
                                <td>
                                    <?php ;
                                    $data = array(
                                        'name'          => "estacionMedicion[]",
                                        'id'            => 'username',

                                        'class'         => 'form-control',

                                    );

                                    echo form_input($data); ?>

                                </td>
                                <td>
                                    <?php ;
                                    $data = array(
                                        'name'          => "estacion[]",
                                        'id'            => 'username',

                                        'class'         => 'form-control',

                                    );

                                    echo form_input($data); ?>
                                </td>
                                <td>
                                    <?php ;
                                    $data = array(
                                        'name'          => "dv[]",
                                        'id'            => 'username',

                                        'class'         => 'form-control',

                                    );

                                    echo form_input($data); ?>
                                </td>
                                <td>
                                    <?php ;
                                    $data = array(
                                        'name'          => "dh[]",
                                        'id'            => 'username',

                                        'class'         => 'form-control',

                                    );

                                    echo form_input($data); ?>
                                </td>
                                <td>
                                    <?php ;
                                    $data = array(
                                        'name'          => "comm[]",
                                        'id'            => 'username',

                                        'class'         => 'form-control',

                                    );

                                    echo form_input($data); ?>

                                </td>
                            </tr>
                        <?php } ?>





                        </tbody>
                    </table>

                    <button class="form-control btn btn-primary" type="submit" value="Guardar">Guardar</button>

                    <?php echo form_close(); ?>
                    <button class="btn btn-primary" onclick="myCreateFunction()">Add row</button>

                </div>
            </div>
        </div>
    </div>
</div>
<script>
    function myCreateFunction() {
        var table = document.getElementById("myTable");
        for (i = 0; i < 10; i++) {
            var row = table.insertRow(-1);
            var cell1 = row.insertCell(0);
            var cell2 = row.insertCell(1);
            var cell3 = row.insertCell(2);
            var cell4 = row.insertCell(3);
            var cell5 = row.insertCell(4);
            cell1.innerHTML = '<input type="text" name="estacion[]" value="" id="username" class="form-control"  />';
            cell2.innerHTML = '<input type="text" name="estacionMedicion[]" value="" id="username" class="form-control"  />';
            cell3.innerHTML = '<input type="text" name="dv[]" value="" id="username" class="form-control"  />';
            cell4.innerHTML = '<input type="text" name="dh[]" value="" id="username" class="form-control"  />';
            cell5.innerHTML = '<input type="text" name="comm[]" value="" id="username" class="form-control"  />';
        }
    }

    function myDeleteFunction() {
        document.getElementById("myTable").deleteRow(0);
    }
</script>












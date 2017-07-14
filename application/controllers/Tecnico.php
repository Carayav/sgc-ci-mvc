<?php

/**
 * Created by PhpStorm.
 * User: cl
 * Date: 7/9/17
 * Time: 4:12 PM
 */
class Tecnico extends MY_Controller
{

    public function index()
    {
        $this->campanhas();
    }


    public function campanhas($regionID = 1)
    {

        $this->load->database();

        $this->load->model('Campanha_model');

        $data['datos'] = $this->Campanha_model->get_by_region_id($regionID);

        $this->load->view('templates/header', $data);
        $this->load->view('templates/filtro');
        $this->load->view('campanhas.php', $data);
        $this->load->view('templates/footer', $data);

    }

    public function elegir_perfil($campanhaId = NULL)
    {
        if ($campanhaId == NULL) {
            redirect('');
        }


        $this->load->database();

        //Obtener info de la campanha
        $this->load->model('Campanha_model');
        $campanha = $this->Campanha_model->get_by_id($campanhaId);

        //Obtener perfiles de la playa
        $this->load->model('Perfil_model');
        $perfiles = $this->Perfil_model->get_by_playaId($campanha->PlayaId);


        $arr = array();
        foreach ($perfiles as $perfil) {
            $arr[" $perfil->PerfilId"] = array('vacio', $perfil->FotoReferencia, $perfil->DescMedicion);
        }


        $this->load->model('Bitacora_model');
        $bitacoras = $this->Bitacora_model->get_by_campanha($campanhaId);
        if ($bitacoras != FALSE) {
            foreach ($bitacoras as $bitacora) {
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

    public function ingresar_bitacora($perfilId = NULL, $campanhaId = NULL)
    {
        if ($campanhaId == NULL or $perfilId == NULL) {
            redirect('');
        }

        //Revisar que bitacora no exista
        $this->load->database();
        $this->load->model('Bitacora_model');
        $existe = $this->Bitacora_model->existe($perfilId, $campanhaId);

        if(!$existe){
            $userId = $this->session->userdata('UsuarioId');
            $newBit = $this->Bitacora_model->crear('2017/07/11',
                $campanhaId,
                $perfilId,
                $userId);

            $data['bitacoraId'] = $newBit->BitacoraId;
            $data['mediciones'] = array();



            $this->load->view('templates/header');
            $this->load->view('formulario', $data);
            $this->load->view('templates/footer');
        }
        else {

        }

        $this->elegir_perfil($campanhaId);


    }

    public function modificar_bitacora($bitacoraId = NULL)
    {
        if ($bitacoraId == NULL) {
            redirect('');
        }
        //validarId usuario
        //OBtener mediciones de bitacora
        $this->load->database();
        $this->load->model('Medicion_model');
        $data['mediciones'] = $this->Medicion_model->get_by_bitacora_id($bitacoraId);
        $data['bitacoraId'] = $bitacoraId;

        $this->load->view('templates/header');

        $this->load->view('formulario', $data);

        //$this->load->view('templates/footer');
    }

    public function actualizar()
    {
        if ($this->input->post()) {
            $data = $this->input->post();

            $this->load->database();
            $this->load->model('Medicion_model');

            foreach ($data as $key => $valor) {
                if (is_int($key)) {
                    $bitId = $data['bitacoraId'];
                    $medId = $key;
                    $userId = $this->session->userdata('UsuarioId');
                    $esValido = $this->Medicion_model->validarMedicion($bitId, $userId, $medId);
                    if ($esValido) {
                        $this->Medicion_model->actualizarMedicion($medId,
                            $valor[1],
                            $valor[0],
                            $valor[3],
                            $valor[2],
                            $valor[4],
                            $bitId);
                    }
                }
            }

            $nuevosPerfiles = count($data['estacion']);
            $bitId = $data['bitacoraId'];
            for ($i = 0; $i < $nuevosPerfiles; $i++) {
                $est = $data['estacion'][$i];
                $estM = $data['estacionMedicion'][$i];
                $dh = $data['dh'][$i];
                $dv = $data['dv'][$i];
                $comm = $data['comm'][$i];

                if($est == NULL){
                    continue;
                }
                if($estM == NULL){
                    continue;
                }
                if($dh == NULL){
                    continue;
                }
                if($dv == NULL){
                    continue;
                }
                $this->Medicion_model->insertarMedicion($est,
                    $estM,
                    $dv,
                    $dh,
                    $comm,
                    $bitId);

            }

            $this->modificar_bitacora($bitId);

       }
    }
}
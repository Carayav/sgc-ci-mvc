<?php

/**
 * Created by PhpStorm.
 * User: cl
 * Date: 7/9/17
 * Time: 5:00 PM
 */
class Medicion_model extends CI_Model
{

    function __construct()
    {
        //Model Constructor
        parent::__construct();
    }

    function get_all(){
        $query = $this->db->get('Medicion');
        if($query->num_rows()>0){
            return $query->result();
        }
        return FALSE;
    }

    function get_by_id($medicionId){
        $this->db->where('MedicionId', $medicionId);
        $query = $this->db->get('Medicion');
        if($query->num_rows()>0){
            return $query->row();
        }
        return FALSE;
    }

    function get_by_bitacora_id($bitacoraId){
        $this->db->where('BitacoraId', $bitacoraId);
        $query = $this->db->get('Medicion');
        if($query->num_rows()>0){
            return $query->result();
        }
        return FALSE;
    }

    function insertarMedicion($est, $estMed, $distVer, $distHor, $comentario, $bitId ){
        $data = array(
            'Estacion' => $est,
            'EstacionMedicion' => $estMed,
            'DistVertical' => $distVer,
            'DistHorizontal' => $distHor,
            'Comentario' => $comentario,
            'BitacoraId' => $bitId

        );
        return $this->db->insert('Medicion', $data);
    }

    function validarMedicion($bitacoraId, $usuarioId, $medicionId){
        $this->db->select('*');
        $this->db->from('Medicion');
        $this->db->join('Bitacora','Bitacora.BitacoraId = Medicion.BitacoraId');
        $this->db->where('Bitacora.BitacoraId', $bitacoraId);
        $this->db->where('UsuarioId', $usuarioId);
        $this->db->where('MedicionId',$medicionId);
        $query = $this->db->get();
        if($query->num_rows()>0){
            return TRUE;
        }
        return FALSE;

    }

    function actualizarMedicion($MedicionId,
                                $Estacion,
                                $EstacionMedicion,
                                $DistVertical,
                                $DistHorizontal,
                                $Comentario,
                                $BitacoraId){
        $data = array(
            'MedicionId' => $MedicionId,
            'Estacion' => $Estacion,
            'EstacionMedicion' => $EstacionMedicion,
            'DistVertical' => $DistVertical,
            'DistHorizontal' => $DistHorizontal,
            'BitacoraId' => $BitacoraId,
            'Comentario' => $Comentario
        );

        $this->db->where('MedicionId', $MedicionId);
        $this->db->update('Medicion', $data);
    }

}
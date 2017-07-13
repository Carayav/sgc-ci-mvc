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
        $this->db->select('*');
        $this->db->from('Medicion');
        $this->db->where('MedicionId', $medicionId);
        $query = $this->db->get();
        if($query->num_rows()>0){
            return $query->result();
        }
        return FALSE;
    }

    function get_by_bitacora_id($bitacoraId){
        $this->db->select('*');
        $this->db->from('Medicion');
        $this->db->where('BitacoraId', $bitacoraId);
        $query = $this->db->get();
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
        $this->db->insert('Medicion', $data);
    }

}
<?php

/**
 * Created by PhpStorm.
 * User: cl
 * Date: 7/9/17
 * Time: 12:32 AM
 */
class Playa_model extends CI_Model
{
    function __construct()
    {
        //Model Constructor
        parent::__construct();
    }

    function get_all(){
        $query = $this->db->get('Playa');
        if($query->num_rows()>0){
            return $query->result();
        }
        return FALSE;
    }

    function get_by_id($id){
        $this->db->where('PlayaId', $id);
        $query = $this->db->get('Playa');
        if($query->num_rows()>0){
            return $query->result();
        }
        return FALSE;
    }

    function get_by_ciudad_id($ciudadId){
        $this->db->where('CiudadId', $ciudadId);
        $query = $this->db->get('Playa');
        if($query->num_rows()>0){
            return $query->result();
        }
        return FALSE;
    }



}
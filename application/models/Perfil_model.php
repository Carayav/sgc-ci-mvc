<?php

/**
 * Created by PhpStorm.
 * User: cl
 * Date: 7/12/17
 * Time: 11:59 PM
 */
class Perfil_model extends CI_Model
{

   function __construct()
    {
        //Model Constructor
        parent::__construct();
    }

    function get_all(){
        $query = $this->db->get('Perfil');
        if($query->num_rows()>0){
            return $query->result();
        }
        return FALSE;
    }

    function get_by_playaId($playaId){
        $this->db->where('PlayaId', $playaId);
        $query = $this->db->get('Perfil');
        if($query->num_rows()>0){

            return $query->result();
        }
        return FALSE;
    }
}
<?php

/**
 * Created by PhpStorm.
 * User: cl
 * Date: 7/12/17
 * Time: 11:51 PM
 */
class Bitacora_model extends CI_Model
{
    function __construct()
    {
        //Model Constructor
        parent::__construct();
    }

    function get_all(){
        $query = $this->db->get('Bitacora');
        if($query->num_rows()>0){
            return $query->result();
        }
        return FALSE;
    }

    function get_by_user_and_campanha($usuarioId, $campanhaId){
        $this->db->where('UsuarioId', $usuarioId);
        $this->db->where('CampanhaId', $campanhaId);
        $query = $this->db->get('Bitacora');
        if($query->num_rows()>0){
            return $query->result();
        }
        return FALSE;
    }

    function get_by_campanha($campanhaId){
        $this->db->where('CampanhaId', $campanhaId);
        $query = $this->db->get('Bitacora');
        if($query->num_rows()>0){
            return $query->result();
        }
        return FALSE;
    }

    function exist_Bitacora($perfilId, $campanhaId){
        $this->db->where('PerfilId', $perfilId);
        $this->db->where('CampanhaId', $campanhaId);
        $query = $this->db->get('Bitacora');
        if($query->num_rows()>0){
            return TRUE;
        }
        return FALSE;
    }


}
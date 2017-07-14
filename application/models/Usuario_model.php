<?php

/**
 * Created by PhpStorm.
 * User: cl
 * Date: 7/13/17
 * Time: 10:58 PM
 */
class Usuario_model extends CI_Model
{
    public function validar($Correo){
        $this->db->where('Correo', $Correo);
        $query=$this->db->get('Usuario');

        return $query->row();
    }

}
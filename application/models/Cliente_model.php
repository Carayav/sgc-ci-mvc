<?php

class Cliente_model extends CI_Model {

	public function validar($nombre,$pass){
		$this->db->where('Nombre',$nombre);
		$this->db->where('contraseña',$pass);
		$query=$this->db->get('cliente');
		
		return $query->row();
	}
}

?>	
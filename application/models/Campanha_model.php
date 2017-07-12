<?php

/**
 * Created by PhpStorm.
 * User: cl
 * Date: 7/9/17
 * Time: 5:00 PM
 */
class Campanha_model extends CI_Model {

    function __construct()
    {
        parent::__construct();
    }

    function get_all(){
        $query = $this->db->get('Campanha');
        if($query->num_rows()>0){
            return $query->result();
        }
        return FALSE;
    }

    function get_by_id($campanhaId){
        $this->db->where('CampanhaId', $campanhaId);
        $query = $this->db->get('Campanha');
        if($query->num_rows()>0){
            return $query->result();
        }
        return FALSE;
    }

    function get_by_playa_id($playaId){
        $this->db->where('PlayaId', $playaId);
        $query = $this->db->get('Campanha');
        if($query->num_rows()>0){
            return $query->result();
        }
        return FALSE;
    }


    function get_by_region_id($regionID){
        $this->db->select('CampanhaId');
        $this->db->select('Playa.Nombre AS PlayaNombre');
        $this->db->select('Ciudad.Nombre AS CiudadNombre');
        $this->db->select('CampanhaId');
        $this->db->select('FechaHora');
        $this->db->select('TamanhoMedicion');
        $this->db->select('Estado');
        $this->db->select('FotoPrincipal');
        $this->db->from('Campanha');
        $this->db->join('Playa','Campanha.PlayaId = Playa.PlayaId');
        $this->db->join('Ciudad', 'Ciudad.CiudadId= Playa.CiudadId');
        $this->db->where('RegionId', $regionID);
        $this->db->order_by('Playa.PlayaId');
        $this->db->order_by('Campanha.FechaHora','DESC');
        $query = $this->db->get();

        if($query->num_rows()>0){
            $campanhas = $query->result();
            $result = array();
            foreach($campanhas as $campanha) {
                $datosCampanha = array($campanha->CampanhaId, $campanha->FechaHora, $campanha->TamanhoMedicion, $campanha->Estado);

                $result[$campanha->CiudadNombre][$campanha->PlayaNombre]['Foto'] = $campanha->FotoPrincipal;
                $result[$campanha->CiudadNombre][$campanha->PlayaNombre]['campanhas'][] = $datosCampanha;
            }
            return $result;
        }
        return FALSE;
    }
}



















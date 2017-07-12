<?php

/**
 * Created by PhpStorm.
 * User: cl
 * Date: 7/9/17
 * Time: 12:17 AM
 */
class MY_Controller extends CI_Controller {

    function __construct()
    {
        parent::__construct();
        $this->load->helper('form');
        $this->load->helper('url');
        $this->load->helper('security');
        $this->load->helper('language');

        //$this->lang->load('en_admin', 'english');
    }

}
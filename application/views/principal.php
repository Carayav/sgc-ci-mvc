<!DOCTYPE html>
<html>
<head>
	<title>Recintos Recoleta</title>
	<link href="<?php echo base_url();?>assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Theme CSS -->
    <link href="<?php echo base_url();?>assets/css/freelancer.min.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<?php echo base_url();?>/assets/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
</head>
<body id="page-top" class="index">
<div id="skipnav"><a href="#maincontent">Skip to main content</a></div>

    <!-- Navigation -->
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top navbar-custom">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header page-scroll">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span> Menu <i class="fa fa-bars"></i>
                </button>
                <a class="navbar-brand" href="#page-top">Arriendos Recoleta</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li class="page-scroll">
                        <a href="#recintos">Recintos</a>
                    </li>

<!-- poner la condicion de session para modificar el menu --> 

                    <?php if($this->session->userdata('logueado')){?>

                    <li> 
                        <a href="#"><?php echo $this->session->userdata('nombre');?></a>
                    </li>

                    <li>
                        
                    <a href="<?php echo base_url();?>index.php/logout">Cerrar Sesion</a>

                    </li>

                        <?php }
                          else {
                         ?>
                    <li>
                        <a href="<?php echo base_url();?>index.php/login">Login</a>
                    </li>
                        <?php } ?>


                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>

    <!-- Header -->
    <header>
        <div class="container" id="page-top" tabindex="-1">
            <div class="row">
                <div class="col-lg-12">
                    <div class="intro-text">
                        <h1 class="name">Centro Deportivo Recoleta</h1>
                        <hr class="star-light">
                        <span class="skills">Tu centro deportivo, el lugar donde puedes mantener tu cuerpo y mente sana</span>
                    </div>
                </div>
            </div>
        </div>
    </header>

    <!-- Portfolio Grid Section -->


    <section id="recintos">
    	<div class="container">
    		<div class="row">
                <div class="col-lg-12 text-center">
                    <h2>Recintos</h2>
                    <hr class="star-primary">
                </div>
        	</div>
        	<div class="row">
                <div class="col-md-3 col-sm-12">
                	Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                	tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                	quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                	consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                	cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                	proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                        <a href="<?php echo base_url();?>index.php/gimnasios">Gimnasios</a>
                    <a href="<?php echo base_url();?>index.php/canchas">Canchas</a>
                        <a href="<?php echo base_url();?>index.php/horarios">horarios</a>
                </div>
                <div class="col-md-3 col-sm-12">
                	Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                	tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                	quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                	consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                	cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                	proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                </div>
                <div class="col-md-3 col-sm-12">
                	Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                	tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                	quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                	consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                	cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                	proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                </div>
                <div class="col-md-3 col-sm-12">
                	Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                	tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                	quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                	consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                	cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                	proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
                </div>
     		</div>

     	
     	</div>	
    </section>
    

    <!-- jQuery -->
    <script src="<?php echo base_url(); ?>assets/vendor/jquery/jquery.min.js"></script>
<script src="<?php echo base_url(); ?>assets/vendor/bootstrap/js/bootstrap.min.js"></script>

</body>
</html>
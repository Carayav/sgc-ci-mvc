<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link href="<?php echo base_url();?>assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<title></title>
</head>
<body>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-4"></div>
		<form class="form-vertical col-md-4" method="POST" action="principal/validar">
			<h3>Ingrese su Correo</h3>
			<input class="form-control" type="text" name="correoUsuario" placeholder="Username">
		</form>
		<div class="col-md-4"></div>
	</div>	
</div>					
<script src="<?php echo base_url(); ?>assets/vendor/jquery/jquery.min.js"></script>
<script src="<?php echo base_url(); ?>assets/vendor/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<link href="css/estilo.css" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" >
<title>Tela de login</title>
</head>
<body>
	<div class="container mt-4 col-lg-4 ">
		<div class="card col-sm-10 login ">
			<div class="card-body">
				<form class="form-sign" action="loginControlador" method="post">
					<div class="form-group text-center ">
						
						<img src="img/logo/logopadariaartesanal.png" alt="70" width="180">
					</div>
					<div class="form-group">
						<label>Usuario</label>
						<input type="text" name="login_usuario" class="form-control" required/>
					</div>
					<div class="form-group">
						<label>Senha</label>
						<input type="password" name="login_senha" class="form-control" required/>
					</div>
					<input type="submit" name="acao" value="entrar" class="btn btn-primary btn-block ">
				</form>
			</div>
		</div>
	</div>




<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" ></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" ></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" ></script>
</body>
</html>
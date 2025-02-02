<!doctype html>
<html lang="es">

<head>
	<!-- Required meta tags -->
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<meta http-equiv="Expires" content="0">
	<meta http-equiv="Last-Modified" content="0">
	<meta http-equiv="Cache-Control" content="no-cache, mustrevalidate">
	<meta http-equiv="Pragma" content="no-cache">

	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
		integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />

	<!-- Fuentes -->
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Reem+Kufi&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Nunito&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Quicksand:wght@300;400;500;600;700&display=swap"
		rel="stylesheet">
	<!-- Hoja de Estilos -->
	<link rel="stylesheet" href="../../resources/css/iniciar_sesion_publico.css">
	<title>Polus - Crear Cuenta</title>
</head>

<body>
	<!-- Fondo -->
	<div id="background">
		<!-- Caja -->
		<div id="form" class="paddingLados animate__animated animate__fadeInUp animate__faster">
			<div class="row">
				<div class="col-12">
					<h1 class="titulo2 text-center m-4">Registro</h1>
				</div>
			</div>
			<form action="/form" autocomplete="off" method="post" id="register-form">
				<!-- Campo oculto para asignar el token del reCAPTCHA -->
				<input type="hidden" id="token_response" name="token_response">
				<div class="justify-content-center row animate__animated animate__fadeInUp animate__faster">
					<!-- Columna 1 -->
					<div
						class="col-xl-3 col-md-6 col-sm-12 col-xs-12 d-flex flex-column justify-content-center paddingLados">
						<div class="form-group mb-2">
							<label for="txtNombre" class="mb-2 texto">Nombres:</label>
							<input type="text" maxlength="25" onchange="checkInputLetras('txtNombre')" class="form-control personalizacionPolus personalizacionPolusP"
								id="txtNombre" name="txtNombre" placeholder="Juan Armando" Required>
						</div>
						<div class="form-group mb-2">
							<label for="txtEmail" class="mb-2 texto">Correo:</label>
							<input type="email" maxlength="80" onchange="checkCorreo('txtEmail')" class="form-control personalizacionPolus personalizacionPolusP mb-1"
								id="txtEmail" name="txtEmail" placeholder="ejemplo@mail.com" Required>
						</div>
						<div class="form-group mb-2">
							<label for="txtUsuario" class="mb-2 texto">Usuario</label>
							<input type="text" maxlength="25" onchange="checkAlfanumerico('txtUsuario')" class="form-control personalizacionPolus personalizacionPolusP mb-1"
								id="txtUsuario" name="txtUsuario" placeholder="usuario123" Required>
						</div>

						<div class="form-group mb-2">
							<label for="txtContraseña" class="mb-2 texto">Contraseña:</label>
							<input data-bs-toggle="tooltip" data-bs-placement="bottom" title="Su contraseña debe tener como mínimo ocho caracteres entre alfanuméricos y especiales (al menos uno de cada uno)." 
							type="password" maxlength="15" onchange="checkContrasena('txtContraseña')" class="form-control personalizacionPolus personalizacionPolusP mb-1"
							id="txtContraseña" name="txtContraseña" placeholder="Contraseña" Required>
						</div>
					</div>
					<div
						class="col-xl-3 col-md-6 col-sm-12 col-xs-12 d-flex flex-column justify-content-center paddingLados animate__animated animate__fadeInUp animate__faster">
						<div class="form-group mb-2">
							<label for="txtApellidos" class="mb-2 texto">Apellidos:</label>
							<input type="text" maxlength="25" onchange="checkInputLetras('txtApellidos')" class="form-control personalizacionPolus personalizacionPolusP"
								id="txtApellidos" name="txtApellidos" aria-describedby="emailHelp"
								placeholder="Hernández Perez" Required>
						</div>
						<div class="form-group mb-2">
							<label for="txtConfirmarEmail" class="mb-2 texto">Confirmar Correo:</label>
							<input type="email" maxlength="80" onchange="checkCorreo('txtConfirmarEmail')" class="form-control personalizacionPolus personalizacionPolusP mb-1"
								id="txtConfirmarEmail" name="txtConfirmarEmail" placeholder="ejemplo@mail.com" Required>
						</div>
						<div class="form-group mb-2">
							<label for="txtFechaNacimiento" class="mb-2 texto">Fecha de Nacimiento:</label>
							<input type="date" class="form-control personalizacionPolus personalizacionPolusP mb-1"
								id="txtFechaNacimiento" name="txtFechaNacimiento" placeholder="dd/mm/aaaa" Required>
						</div>
						<div class="form-group mb-2">
							<label for="txtConfirmarContraseña" class="mb-2 texto">Confirmar Contraseña:</label>
							<input type="password" maxlength="15" onchange="checkContrasena('txtConfirmarContraseña')" class="form-control personalizacionPolus personalizacionPolusP mb-1"
								id="txtConfirmarContraseña" name="txtConfirmarContraseña"
								placeholder="Confirmar Contraseña" Required>
						</div>
					</div>
					<div
						class="col-xl-3 col-md-6 col-sm-12 col-xs-12 d-flex flex-column justify-content-center animate__animated animate__fadeInUp animate__faster">
						<div class="form-group mb-1">
							<label for="txtTelefono" class="mb-2 texto">Teléfono:</label>
							<input type="text" maxlength="9" onchange="checkTelefono('txtTelefono')" class="form-control personalizacionPolus personalizacionPolusP mb-1"
								id="txtTelefono" name="txtTelefono" placeholder="0000-0000" Required>
						</div>

						<div class="form-group mb-4">
							<label for="txtDireccion" class="mb-2 texto">Dirección:</label>
							<textarea maxlength="200" onchange="checkDireccion('txtDireccion')" class="form-control personalizacionPolus personalizacionPolusP mb-1" rows=4
								id="txtDireccion" name="txtDireccion" Required></textarea>
						</div>

						<div class="mb-3">
							<label for="txtGenero" class="mb-2 texto">Género:</label>
							<select id="txtGenero" name="txtGenero"
								class="form-select personalizacionPolus personalizacionPolusP"
								aria-label="Default select example">
								<option selected>Seleccionar...</option>
								<option value="Femenino">Femenino</option>
								<option value="Masculino">Masculino</option>
							</select>
						</div>
					</div>
					<div
						class="col-xl-3 col-md-6 col-sm-12 col-xs-12 d-flex flex-column justify-content-center paddingLados animate__animated animate__fadeInUp animate__faster">
						<div class="d-flex flex-column justify-content-center align-items-center">
							<div class="bordeDivFotografia">
								<div class="divFotografia" id="divFoto">

								</div>
							</div>
							<div id="btnAgregarFoto">
								<button class="btn btn-outline-light my-2" id="botonFoto"><span
										class="fas fa-plus"></span></button>
							</div>
							<input id="archivo_usuario" type="file" class="d-none" name="archivo_usuario"
								accept=".gif, .jpg, .png">
						</div>

					</div>
				</div>

				<div class="row">
					<div class="col-12">
						<div class="form-check mt-3 mb-2">
							<input onChange="showHidePassword2('chMostrarContraseña', 'txtContraseña', 'txtConfirmarContraseña')" class="form-check-input" type="checkbox" value="" id="chMostrarContraseña">
							<label class="form-check-label text-white" for="chMostrarContraseña">
								Mostrar Contraseña
							</label>
						</div>	
					</div>
				</div>
				<div class="row justify-content-center animate__animated animate__fadeInUp animate__faster my-2">
					<div class="col-12 d-flex align-items-center justify-content-center">
						<button type="submit" class="btn boton my-2">Registrarse</button>
					</div>
				</div>
			</form>
		</div>
	</div>

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-b5kHyXgcpbZJO/tY9Ul7kGkf1S0CWuKcCD38l8YkeH8z8QjE0GmW1gYU5S9FOnJ0" crossorigin="anonymous">
	</script>
	<script src="https://kit.fontawesome.com/43634cb7dc.js" crossorigin="anonymous"></script>
	<script type="text/javascript" src="../../app/controllers/public/crear_cuenta.js"></script>
	<script type="text/javascript" src="../../resources/js/sweetalert.min.js"></script>
	<script type="text/javascript" src="../../app/helpers/components.js"></script>
	<script src="https://www.google.com/recaptcha/api.js?render=6Ldf0VAcAAAAAKtU0qNjwTPKAYdl0ZUr7zCFCdJo"></script>
</body>

</html>
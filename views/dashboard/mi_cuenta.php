<?php
//Se incluye la clase con las plantillas del documento
include('../../app/helpers/dashboard_page.php');
//Se imprime la plantilla del encabezado y se envía el titulo para la página web
dashboard_Page::sidebarTemplate('Polus - Mi Cuenta',' ');
?>
<!--Fin del sidebar-->
<!-- Contenido de la Pagina -->
<div class="page-content p-5" id="content">
	<!-- Contenedor de la barra inicial -->
	<?php
		//Se imprime la plantilla la barra inicial
		dashboard_Page::barraInicial();
		?>
	<!-- Contenido -->
	<div class="row mt-3">
		<div class="col-12">
			<h1 class="tituloMiCuenta animate__animated animate__fadeInUp animate__faster">INFORMACIÓN PERSONAL</h1>
		</div>
	</div>

	<form method="post" id="info-form" action="/form" autocomplete="off">
		<div class="row mt-3 justify-content-center animate__animated animate__fadeInUp animate__faster ">
			<div class="col-12 d-flex flex-column justify-content-center align-items-center">
				<div class="d-flex flex-column justify-content-center align-items-center">
					<div class="bordeDivFotografia">
						<div class="divFotografia" id="divFoto">

						</div>
					</div>
					<div id="btnAgregarFoto" class="mt-4">
						<button class="btn btn-outline-dark" id="botonFoto"><span class="fas fa-plus"></span></button>
					</div>
					<input id="archivo_usuario" type="file" class="d-none" name="archivo_usuario"
						accept=".gif, .jpg, .png">
				</div>
			</div>
		</div>

		<div class="row mt-4 animate__animated animate__fadeInUp animate__faster">
			<div class="col-xl-6 col-md-6 col-sm-12 col-xs-12 d-flex justify-content-end align-items-end centrarContenido">
				<div class="form-group formMiCuenta">
					<label for="nombre" class="form-label mt-2">Nombres:</label>
					<input type="text" class="form-control inputMiCuenta" id="txtNombre" name="txtNombre" Required>

					<label for="telefono" class="form-label mt-2">Teléfono:</label>
					<input type="text" class="form-control inputMiCuenta" id="txtTelefono" name="txtTelefono" Required>

					<label for="fechaNacimiento" class="form-label mt-2">Fecha de Nacimiento:</label>
					<input type="date" class="form-control inputMiCuenta" id="txtfechaNacimiento" name="txtfechaNacimiento"
						Required>

					<div class="mt-2">
						<label for="txtGenero" class="form-label">Género:</label>
						<select id="txtGenero" name="txtGenero" class="form-select" aria-label="Default select example"
							Required>
							<option selected>Seleccionar...</option>
							<option value="Femenino">Femenino</option>
							<option value="Masculino">Masculino</option>
						</select>
					</div>
				</div>
			</div>
			<div class="col-xl-6 col-md-6 col-sm-12 col-xs-12 d-flex justify-content-start align-items-start centrarContenido">
				<div class="form-group formMiCuenta">
					<label for="apellido" class="form-label mt-2">Apellidos:</label>
					<input type="text" class="form-control inputMiCuenta" id="txtApellidos" name="txtApellidos" Required>

					<label for="Dirección" class="form-label mt-2">Dirección:</label>
					<textarea class="form-control textareaMiCuenta" id="txtDireccion" name="txtDireccion"
						Required></textarea>
				</div>
			</div>
		</div>

		<div class="row justify-content-center mt-4 animate__animated animate__fadeInUp animate__faster">
			<div class="col-12 d-flex flex-column justify-content-center align-items-center">
				<button type="submit" class="btn btn-outline-dark">Confirmar</button>
			</div>
		</div>
	</form>

	<div class="row mt-5 animate__animated animate__fadeInUp animate__faster">
		<div class="col-12">
			<h1 class="tituloMiCuenta">AJUSTES DE LA CUENTA</h1>
		</div>
	</div>

	<form method="post" id="cuenta-form">
		<div class="row justify-content-end mt-4 animate__animated animate__fadeInUp animate__faster">
			<div class="col-xl-6 col-md-6 col-sm-12 col-xs-12 d-flex flex-column justify-content-end align-items-end centrarContenido">
				<div class="form-group formMiCuenta">
					<label for="nombre" class="form-label mt-2">Usuario:</label>
					<input type="text" class="form-control inputMiCuenta" id="txtUsuario" name="txtUsuario" Required readonly>
				</div>
			</div>
			<div class="col-xl-6 col-md-6 col-sm-12 col-xs-12 d-flex flex-column justify-content-start align-items-start centrarContenido">
				<div class="form-group formMiCuenta">
					<label for="telefono" class="form-label mt-2">Correo Electrónico:</label>
					<input type="text" class="form-control inputMiCuenta" id="txtEmail" name="txtEmail" Required readonly>
				</div>
			</div>
		</div>

		<div class="row justify-content-center animate__animated animate__fadeInUp animate__faster">
			<div class="col-12 d-flex flex-column justify-content-center align-items-center">
				<div class="form-group formMiCuenta">
					<label for="apellido" class="form-label mt-2">Contraseña:</label>
					<input type="password" readonly class="form-control inputMiCuenta" id="txtContrasenia" name="txtContrasenia">
				</div>
			</div>
		</div>

		<div class="row justify-content-center mt-4 animate__animated animate__fadeInUp animate__faster">
			<div class="col-12 d-flex flex-column justify-content-center align-items-center">
				<button type="button" data-bs-toggle="modal" data-bs-target="#administrarAjustes" class="btn btn-outline-dark">Actualizar Ajustes</button>
			</div>
		</div>
	</form>
	<!-- Final del contenido -->
</div>

<!-- Modal para Administrar Ajustes de la Cuenta -->
<div class="modal fade" id="administrarAjustes" tabindex="-1" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered">
		<div class="modal-content justify-content-center px-3 py-2">
			<!-- Cabecera del Modal -->
			<div class="modal-header">
				<!-- Titulo -->
				<h5 class="modal-title tituloModal" id="exampleModalLabel"><span
						class="fas fa-info-circle mx-2"></span>Actualizar Ajustes de la Cuenta</h5>
				<!-- Boton para Cerrar -->
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<br>
			<!-- Contenido del Modal -->
			<div class="textoModal px-3 pb-4 mt-2">
				<div class="row justify-content-center">
					<div class="d-flex justify-content-xl-end mt-2 justify-content-md-end justify-content-center col-xl-4 col-md-6 col-sm-12 col-xs-12">
						<div>
							<button class="btn btn-outline-dark tamañoBotonesMiCuenta d-flex flex-column justify-content-center align-items-center">
								<i class="fas fa-user fs-3"></i>
								Usuario
							</button>
						</div>
					</div>
					<div class="d-flex justify-content-center justify-content-xl-center mt-2 justify-content-md-start justify-content-sm-center justify-content-xl-center col-xl-4 col-md-6 col-sm-12 col-xs-12">
						<div>
							<button class="btn btn-outline-dark tamañoBotonesMiCuenta d-flex flex-column justify-content-center align-items-center">
								<i class="fas fa-envelope fs-3"></i>
								Correo
							</button>
						</div>
					</div>
					<div class="d-flex justify-content-xl-start justify-content-center mt-2 col-xl-4 col-md-12 col-sm-12 col-xs-12">
						<div>
							<button class="btn btn-outline-dark tamañoBotonesMiCuenta d-flex flex-column justify-content-center align-items-center">
								<i class="fas fa-key fs-3"></i>
								Clave
							</button>
						</div>
					</div>
				</div>
				<!-- Fin del Contenido del Modal -->
			</div>
		</div>
	</div>
</div>
<!-- Fin del Modal -->
<!-- Bootstrap core JavaScript -->
<?php
//Se imprime el script para las direcciones de Bootstrap core JavaScript
dashboard_Page::scriptBTJS();
?>

<!-- Movimiento sidebar -->
<?php
//Se imprime el script para el movimiento del sidebar
dashboard_Page::sidebarTemplateMovement('mi_cuenta.js');
?>
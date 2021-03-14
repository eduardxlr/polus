<?php
//Se incluye la clase con las plantillas del documento
include('../../app/helpers/dashboard_page.php');
//Se imprime la plantilla del encabezado y se envía el titulo para la página web
dashboard_Page::sidebarTemplate('pedidos_privado_estilos.css', 'Polus - Dashboard');
?>
    <!--Fin del sidebar-->
    <!-- Contenido de la Pagina -->
    <div id="page-content-wrapper">
        <!-- Contenedor de la barra inicial -->
        <?php
        //Se imprime la plantilla la barra inicial
        dashboard_Page::barraInicial();
        ?>
        <!-- Inicio del contenido -->
        <section>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 title"><h1>Pedidos</h1></div>
                </div><br>
                 <!-- Espacio para buscar -->
                <div class="row">
                    <div class="col-lg-8 formulario2">
                        <form class="d-flex">
                            <input class="form-control me-2" type="search" placeholder="Buscar..." aria-label="Search">
                            <button class="btn btn-outline-dark" type="submit">Buscar</button>
                        </form>
                    </div>
                </div><br><br>
                <!-- Fila de primeros tres apartados -->
                <div class="row">
                    <!-- Columna de opciones -->
                    <div class="col-lg-4 col-sm-12 col-xs-12 opciones">
                        <p class="apartado">Opciones:</p>
                        <img src="../../resources/img/dashboard_img/separator.png" class="img-fluid imagenSeparator">
                        <!-- Botones -->
                        <div class="col-12 formulario1">
                            <div class="mb-3">
                                <label for="selecciona" class="form-label">Selecciona:</label><br>
                                <button class="btn btn-outline-dark" id="selecciona">Programar</button><br><br>
                                <button class="btn btn-outline-dark" id="selecciona">Suspender</button><br><br>
                                <button class="btn btn-outline-dark" id="selecciona">Cancelar</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-8 encargo">
                        <p class="apartado">Últimos encargos:</p>
                        <img src="../../resources/img/dashboard_img/separator.png" class="img-fluid imagenSeparator">
                    <div class="col-12">
                        <table class="table table-hover table-responsive-lg">
                            <thead class="bg-dark tabla">
                                <tr>
                                    <th scope="col">Factura</th>
                                    <th scope="col">Detalle del pedido</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>515561-0</td>
                                    <td>2 camisas</td>
                                </tr>
                                    <td>65561-5</td>
                                    <td>4 mascarillas</td>
                                </tr>
                                <tr>
                                    <td>65105-7</td>
                                    <td>1 sombra</td>
                                </tr>
                            </tbody>
                        </table> 
                    </div>
                    </div>
                </div><br><br>
                <!-- Fila de ultimos dos apartados -->
                <div class="row">
                    <!-- Columna de información del cliente -->
                    <div class="col-lg-6 col-sm-12 col-xs-12">
                        <p class="apartado">Información del cliente:</p>
                        <img src="../../resources/img/dashboard_img/separator.png" class="img-fluid imagenSeparator">
                            <div class="row">
                                <!-- Formulario de contacto -->
                                <div class="col-12 formulario">
                                    <form>
                                        <div class="mb-3">
                                            <label for="info" class="form-label">Información:</label>
                                            <textarea class="form-control" id="info"></textarea>
                                        </div>
                                    </form>
                                </div>
                            </div>
                    </div><br>
                    <!-- Columna de información del cliente -->
                    <div class="col-lg-6 col-sm-12 col-xs-12">
                        <p class="apartado">Factura del pedido seleccionado:</p>
                        <img src="../../resources/img/dashboard_img/separator.png" class="img-fluid imagenSeparator">
                            <div class="row">
                                <!-- Formulario de contacto -->
                                <div class="col-12 formulario">
                                    <form>
                                        <div class="mb-3">
                                            <label for="info" class="form-label">Información:</label>
                                            <textarea class="form-control" id="info"></textarea>
                                        </div>
                                    </form>
                                </div>
                            </div>
                    </div><br>
                </div><br><br>
                
            </div>
        </section>
    </div>
    <!-- Bootstrap core JavaScript -->
    <?php
    //Se imprime el script para las direcciones de Bootstrap core JavaScript
    dashboard_Page::scriptBTJS();
    ?>

    <!-- Movimiento sidebar -->
    <?php
    //Se imprime el script para el movimiento del sidebar
    dashboard_Page::sidebarTemplateMovement();
    ?>
   </body>
</html>


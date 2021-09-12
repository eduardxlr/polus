<?php

//Clase para manejar tabla usuario
Class Usuarios extends Validator{

    //Declarando atributos
    private $idAdmon = null;
    private $nombre = null;
    private $apellido = null;
    private $genero = null;
    private $correo = null;
    private $foto = null;
    private $fechaNacimiento = null;
    private $telefono = null;
    private $direccion = null;
    private $usuario = null;
    private $contrasenia = null;
    private $idEstadoUsuario = null;
    private $idTipoUsuario = null;
    private $ruta = '../../../resources/img/dashboard_img/admon_fotos/';
    private $idHistorialSesion = null;
    private $idBitacora = null;
    private $descripcion = null;
    private $intentos = null;

    /*
        Métodos set
    */
    public function setId($value)
    {
        if ($this->validateNaturalNumber($value)) {
            $this->idAdmon = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setIdHistorialSesion($value)
    {
        if ($this->validateNaturalNumber($value)) {
            $this->idHistorialSesion = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setNombres($value)
    {
        if ($this->validateAlphabetic($value,1,25)) {
            $this->nombre = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setApellidos($value)
    {
        if ($this->validateAlphabetic($value,1,25)) {
            $this->apellido = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setGenero($value)
    {
        if ($this->validateAlphabetic($value,1,10)) {
            $this->genero = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setCorreo($value)
    {
        if ($this->validateEmail($value)) {
            $this->correo = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setFoto($file)
    {
        if ($this->validateImageFile($file, 4000, 4000)) {
            $this->foto = $this->getImageName();
            return true;
        } else {
            return false;
        }
    }

        public function setNacimiento($value)
        {
            if ($this->validateDate($value)) {
                $this->fechaNacimiento = $value;
                return true;
            } else {
                return false;
            }
        }

    public function setTelefono($value)
    {
        if ($this->validatePhone($value)) {
            $this->telefono = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setDireccion($value)
    {
        if ($this->validateString($value,1,200)) {
            $this->direccion = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setUsuario($value)
    {
        if ($this->validateAlphanumeric($value,1,25)) {
            $this->usuario = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setContrasenia($value)
    {
        if ($this->validatePassword($value)) {
            $this->contrasenia = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setIdEstadoUsuario($value)
    {
        if ($this->validateNaturalNumber($value)) {
            $this->idEstadoUsuario = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setIdTipoUsuario($value)
    {
        if ($this->validateNaturalNumber($value)) {
            $this->idTipoUsuario = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setIdBitacora($value)
    {
        if ($this->validateNaturalNumber($value)) {
            $this->idBitacora = $value;
            return true;
        } else {
            return false;
        }
    }

    public function setDescripcion($value)
    {
        if ($this->validateString($value,1,200)) {
            $this->descripcion= $value;
            return true;
        } else {
            return false;
        }
    }

    public function setIntentos($value)
    {
        if ($this->validateNaturalNumber($value)) {
            $this->intentos = $value;
            return true;
        } else {
            return false;
        }
    }

    /* 
        Metodos get
    */

    public function getId(){
        return $this -> idAdmon;
    }

    public function getNombres(){
        return $this -> nombre;
    }

    public function getApellidos(){
        return $this -> apellido;
    }

    public function getGenero(){
        return $this -> genero;
    }

    public function getCorreo(){
        return $this -> correo;
    }

    public function getFoto(){
        return $this -> foto;
    }

    public function getIdHistorialSesion(){
        return $this -> idHistorialSesion;
    }

    public function getRuta()
    {
        return $this->ruta;
    }

    public function getNacimiento(){
        return $this -> fechaNacimiento;
    }

    public function getTelefono(){
        return $this -> telefono;
    }

    public function getDireccion(){
        return $this -> direccion;
    }
    public function getUsuario(){
        return $this -> usuario;
    }

    public function getContrasenia(){
        return $this -> contrasenia;
    }

    public function getIdEstadoUsuario(){
        return $this -> idEstadoUsuario;
    }

    public function getIdTipoUsuario(){
        return $this -> idTipoUsuario;
    }

    public function getIdBitacora(){
        return $this -> idBitacora;
    }

    public function getDescripcion(){
        return $this -> descripcion;
    }

    public function getIntentos(){
        return $this -> intentos;
    }

    //Métodos para administrar cuenta del usuario 
    public function checkUser($alias)
    {
        $sql = 'SELECT idAdmon,foto,idestadousuario FROM admon WHERE usuario = ?';
        $params = array($alias);
        if ($data = Database::getRow($sql, $params)) {
            $this->idAdmon = $data['idadmon'];
            $this->usuario = $alias;
            $this->foto= $data['foto'];
            $this->idEstadoUsuario = $data['idestadousuario'];
            return true;
        } else {
            return false;
        }
    }

    //Método para verificar el estado del usuario
    public function checkEstado()
    {
        if ($this->idEstadoUsuario == 1) {
            return true;
        } else {
            return false;
        }
    }

    //Función para verificar la contraseña
    public function checkPassword($password)
    {
        $sql = 'SELECT contraseña FROM admon WHERE idAdmon = ?';
        $params = array($this->idAdmon);
        $data = Database::getRow($sql, $params);
        if (password_verify($password, $data['contraseña'])) {
            return true;
        } else {
            return false;
        }
    }

    //Función para cambiar la contraseña
    public function changePassword()
    {
        $hash = password_hash($this->contrasenia, PASSWORD_DEFAULT);
        $sql = 'UPDATE admon SET contraseña = ? WHERE idAdmon = ?';
        $params = array($hash, $_SESSION['idAdmon']);
        return Database::executeRow($sql, $params);
    }

    //Función para cambiar el nombre de usuario
    public function changeUser()
    {
        $sql = 'UPDATE admon SET usuario = ? WHERE idAdmon = ?';
        $params = array($this->usuario, $_SESSION['idAdmon']);
        return Database::executeRow($sql, $params);
    }

    //Función para cambiar el correo electrónico del usuario
    public function changeEmail()
    {
        $sql = 'UPDATE admon SET correo = ? WHERE idAdmon = ?';
        $params = array($this->correo, $_SESSION['idAdmon']);
        return Database::executeRow($sql, $params);
    }

    //Se valida si el inicio de sesion es existente o no
    public function validateSesionHistory()
    {
        $sql = 'SELECT*FROM historialSesionAdmon WHERE phpinfo = ? AND idAdmon = ?';
        $params = array(php_uname(), $_SESSION['idAdmon']);
        if (Database::getRow($sql, $params)) {
            return true;
        } else {
            return false;
        }
    }

    //Se crea el inicio de sesion
    public function createSesionHistory()
    {
        $sql = 'INSERT INTO historialSesionAdmon(idadmon, phpinfo, fechasesion) 
                VALUES(?,?,current_date)';
        $params = array($_SESSION['idAdmon'], php_uname());
        return Database::executeRow($sql, $params);
    }

    //Se obtiene el historial de sesiones de un usuario en especifico
    public function getSesionHistory()
    {
        $sql = 'SELECT*FROM historialSesionAdmon WHERE idadmon = ?';
        $params = array($_SESSION['idAdmon']);
        return Database::getRows($sql, $params);
    }

    // Para eliminar un historial de sesion
    public function deleteSesionHistory()
    {
        $sql = 'DELETE FROM historialSesionAdmon WHERE idadmon = ? AND idhistorialsesion_a = ?';
        $params = array($_SESSION['idAdmon'], $this->idHistorialSesion);
        return Database::executeRow($sql, $params);
    }

    //Función para leer los datos del usuario logeado
    public function readProfile()
    {
        $sql = 'SELECT idAdmon, nombre, apellido, genero, correo, foto, fechaNacimiento, telefono, direccion, usuario, contraseña, idEstadoUsuario, idTipoUsuario
        FROM admon
        WHERE idAdmon = ?';
        $params = array($_SESSION['idAdmon']);
        return Database::getRow($sql, $params);
    }

    //Función para cambiar la foto del usuario logeado
    public function updateProfileInfo($current_image)
    {
        // Se verifica si existe una nueva imagen para borrar la actual, de lo contrario se mantiene la actual.
        ($this->foto) ? $this->deleteFile($this->getRuta(), $current_image) : $this->foto = $current_image;

        $sql = 'UPDATE admon
                SET foto = ?, nombre = ?, apellido = ?, genero = ?, fechaNacimiento = ?, telefono = ?, direccion = ?
                WHERE idAdmon = ?';
        $params = array($this->foto, $this->nombre, $this->apellido, $this->genero, $this->fechaNacimiento, $this->telefono,$this->direccion, $_SESSION['idAdmon']);
        return Database::executeRow($sql, $params);
    }

    //Función para cambiar la información de cuenta del usuario logeado
    public function updateProfileAccount()
    {
        $sql = 'UPDATE admon
                SET usuario = ?, correo = ?
                WHERE idAdmon = ?';
        $params = array($this->usuario, $this->correo, $_SESSION['idAdmon']);
        return Database::executeRow($sql, $params);
    }

    //Función para buscar
    public function searchRows($value)
    {
        $sql = 'SELECT idAdmon, nombre, apellido, genero, correo, foto, fechaNacimiento, telefono, direccion, usuario, contraseña, estadoUsuario, tipoUsuario
        FROM admon
        INNER JOIN estadoUsuario ON estadoUsuario.idEstadoUsuario = admon.idEstadoUsuario
        INNER JOIN tipoUsuario ON tipoUsuario.idTipoUsuario = admon.idTipoUsuario
        WHERE apellido ILIKE ? OR nombre ILIKE ? OR usuario ILIKE ?
        ORDER BY apellido';
        $params = array("%$value%", "%$value%", "%$value%");
        return Database::getRows($sql, $params);
    }

    //Función para agregar un nuevo registro
    public function createRow()
    {
        // Se encripta la clave por medio del algoritmo bcrypt que genera un string de 60 caracteres.
        $hash = password_hash($this->contrasenia, PASSWORD_DEFAULT);
        $sql = 'INSERT INTO admon(nombre, apellido, genero, correo, foto, fechaNacimiento, telefono, 
                direccion, usuario, contraseña, idEstadoUsuario, idTipoUsuario)
                VALUES(?,?,?,?,?,?,?,?,?,?,?,?)';
        $params = array($this->nombre, $this->apellido, $this->genero, $this->correo, $this->foto, 
                        $this->fechaNacimiento, $this->telefono, $this->direccion, $this->usuario, 
                        $hash, $this->idEstadoUsuario, $this->idTipoUsuario);
        return Database::executeRow($sql, $params);
    }

    //Métodos para obtener valores
    public function readAll(){
        $sql = 'SELECT idAdmon, nombre, apellido, genero, correo, foto, fechaNacimiento, telefono, direccion, usuario, contraseña, estadoUsuario, tipoUsuario
        FROM admon
        INNER JOIN estadoUsuario ON estadoUsuario.idEstadoUsuario = admon.idEstadoUsuario
        INNER JOIN tipoUsuario ON tipoUsuario.idTipoUsuario = admon.idTipoUsuario
        ORDER BY apellido';
        $params = null;
        return Database::getRows($sql, $params);
    }

    //Función para leer un registro en especifico
    public function readOne()
    {
        $sql = 'SELECT idAdmon, nombre, apellido, genero, correo, foto, fechaNacimiento, telefono, direccion, usuario, contraseña, idEstadoUsuario, idTipoUsuario
        FROM admon
        WHERE idAdmon = ?';
        $params = array($this->idAdmon);
        return Database::getRow($sql, $params);
    }

    //Métodos para obtener tipos de usuario
    public function readAllTipos(){
        $sql = 'SELECT * FROM tipoUsuario';
        $params = null;
        return Database::getRows($sql, $params);
    }

    //Función para actualizar un registro
    public function updateRow($current_image)
    {
        // Se verifica si existe una nueva imagen para borrar la actual, de lo contrario se mantiene la actual.
        ($this->foto) ? $this->deleteFile($this->getRuta(), $current_image) : $this->foto = $current_image;

        $sql = 'UPDATE admon
                SET foto = ?, nombre = ?, apellido = ?, genero = ?, correo = ?, fechaNacimiento = ?, telefono = ?, direccion = ?, usuario = ?, idTipoUsuario = ?
                WHERE idAdmon = ?';
        $params = array($this->foto, $this->nombre, $this->apellido, $this->genero, $this->correo, $this->fechaNacimiento, $this->telefono,$this->direccion, $this->usuario, $this->idTipoUsuario, $this->idAdmon);
        return Database::executeRow($sql, $params);
    }

    //Función para eliminar un registro
    public function deleteRow(){
        $sql = 'DELETE FROM admon WHERE idAdmon = ?';
        $params = array($this->idAdmon);
        return Database::executeRow($sql, $params);
    }

    //Función para suspender un registro
    public function suspenderRow(){
        $sql = 'UPDATE admon SET idEstadoUsuario = 2 WHERE idAdmon = ?';
        $params = array($this->idAdmon);
        return Database::executeRow($sql, $params);
    }

    //Función para activar un registro
    public function activarRow(){
        $sql = 'UPDATE admon SET idEstadoUsuario = 1 WHERE idAdmon = ?';
        $params = array($this->idAdmon);
        return Database::executeRow($sql, $params);
    }

    //Función para llenar tabla de bitacoraUsuario
    public function registerAction($action, $desc)
    {
        $sql = 'INSERT INTO bitacoraUsuario VALUES (DEFAULT, ?, current_date , current_time, ?, ?)';
        $params = array($_SESSION['idAdmon'], $action, $desc);
        return Database::executeRow($sql, $params);
    }

    //Función para evaluar si han pasado 90 días desde la última actualización de clave
    public function checkLastPasswordUpdate() {
        $sql = 'SELECT * 
                FROM bitacoraUsuario 
                WHERE idadmon = ? AND fecha BETWEEN (SELECT current_date - 90) 
                AND current_date AND descripcion = \'Cambio de clave\' LIMIT 1';
        $params = array($_SESSION['idAdmon']);
        return Database::getRow($sql,$params);
    }

    //Función para verificar la cantidad de intentos
    public function checkIntentos() {
        $sql = 'SELECT intentos FROM admon WHERE idadmon = ?';
        $params = array($this->idAdmon);
        return Database::getRow($sql,$params);
    }

    //Función para actualizar los intentos de un registro
    public function updateIntentos($intentos)
    {
        $sql = 'UPDATE admon
                SET intentos = ?
                WHERE idadmon = ?';
        $params = array($intentos,$this->idAdmon);
        return Database::executeRow($sql, $params);
    }

    //Función para bloquear un registro
    public function bloquearRow(){
        $sql = 'UPDATE admon SET idEstadoUsuario = 3 WHERE idadmon = ?';
        $params = array($this->idAdmon);
        return Database::executeRow($sql, $params);
    }

}   

?>
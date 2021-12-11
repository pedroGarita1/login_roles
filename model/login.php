<?php 
    session_start();

    class Conector {

        private $conexion;
        private $servidor = 'localhost';
        private $usuario = 'root';
        private $password = '';
        private $database = 'amaterasu';


        public function __construct(){

            $this->conexion = mysqli_connect($this->servidor, $this->usuario, $this->password, $this->database);

        }

        function iniciarSesion(){
            if (!empty($_POST['email']) && !empty(['password'])) {

                $email = $this->conexion->real_escape_string(htmlentities($_POST['email']));
                $pass = $this->conexion->real_escape_string(htmlentities($_POST['password']));

                $sql = "SELECT * FROM t_usuario WHERE email = ?";
                $consulta = $this->conexion->prepare($sql);
                $consulta->bind_param('s',$email);
                $consulta->execute();
        
                $resultado = $consulta->get_result();
                $resultado = $resultado->fetch_assoc();
        
                if ($resultado && password_verify($pass, $resultado['password'])) {    

                    $_SESSION['user'] = $resultado;
                    $id = $resultado['idUsuario'];
                    $query = "UPDATE t_usuario SET estado ='1' WHERE idUsuario ='$id'";
                    $stmt = $this->conexion->query($query);
                    if($stmt){
                        if($resultado['datosAlumno'] == 1){
                            $tabla = "t_docentes";
                            $id = $resultado['datosDocente'];
                            $tipo = "idDocentes";
                        }elseif ($resultado['datosDocente'] == 1){
                            $tabla = "t_alumnos";
                            $id = $resultado['datosAlumno'];
                            $tipo = "idAlumno";
                        }
                        $sql2 = "SELECT * FROM $tabla WHERE $tipo = ?";
                        $consulta2 = $this->conexion->prepare($sql2);
                        $consulta2->bind_param('s',$id);
                        $consulta2->execute();
                        $resultado2 = $consulta2->get_result();
                        $resultado2 = $resultado2->fetch_assoc();
                        $_SESSION['dataUser'] = $resultado2;

                        echo "2";
                    }else{
                        echo "1";
                    }
                }else {
                    echo "1";	
                } 
                $this->conexion->close();
            }else{
                echo "Las credenciales de acceso no tienen datos.";
            }
        }

        function cerrarSesion(){
            $id=$_SESSION['user']['idUsuario'];
            $query = "UPDATE t_usuario SET estado ='2' WHERE idUsuario ='$id'";
            $stmt = $this->conexion->query($query);
            $stmt;

            session_unset();

            session_destroy();
            
            echo "2";
        }
    }

    $conexi = new Conector();


    if($_POST['funcion'] == '1'){
        echo $conexi->iniciarSesion();
    }else if($_POST['funcion'] == '2'){

    }else if($_POST['funcion'] == '3'){
        echo $conexi->cerrarSesion();
    }

?>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Página diseñada por el equipo AMATERASU"/>
    <?php require_once 'app/config.php';?>
    <?php require_once 'app/dependencias.php';?>
    <title>Login - roles</title>
</head>
<body>
    <?php 
        session_start();
        require_once 'view/loader.php';
        require_once 'view/nav.php';
        
        if(isset($_GET['view'])){
            $url = explode("/", $_GET['view']);

            if(count($url)<2)

                switch($url[0]){
                    case 'home': 
                        require_once 'view/home.php';
                        break;
                //----------------admin-------------------------
                    case 'admin': 
                        require_once 'view/admin/panel.php';
                        break;
                //----------------docente-------------------------
                    case 'docente': 
                        require_once 'view/docente/panel.php';
                        break;
                //----------------alumno-------------------------
                    case 'alumno': 
                        require_once 'view/alumno/panel.php';
                        break;        
                //----------------general-------------------------
                    case 'login': 
                        require_once 'view/login/login.php';
                        break; 
                    case 'recuperar': 
                        require_once 'view/login/recuperacion.php';
                        break;    
                    //----------------404-------------------------             
                    default:
                        require_once 'view/404.php';
                        break;

                }  
            else
                header("location:".SERVIDOR."404");        

        }else{
            require_once 'view/login/login.php';
        }
    ?>
</body>
</html>
<?php
	if (!isset($_SESSION['user'])) {
		echo '<script> window.location="login" </script>';
	}elseif($_SESSION['user']['rol'] != "2"){
		echo '<script> window.location="alumno" </script>';
    }
?>
<div class="container py-4">
    <div class="row justify-content-around">
        <div class="col col-12 d-md-none">
            <?php require_once 'navResponsive.php';?>
        </div>
        <div class="col d-none d-md-block col-md-3">
            <?php require 'datosUsuario.php';?>
        </div>
        <div class="col-md-9">
            <div class="card shadow card-login">
                <div class="card-header text-center" style="background: none;">
                    <h1 class="display-4">Panel de Docente</h1>
                </div>
                <div class="card-body">
                    
                </div>
            </div>
        </div>
    </div>
</div>
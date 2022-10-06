<?php
session_start();

// Llamar el archivo de conexion a la base de datos
require_once "../config/database.php";

// función para comprobar el estado del usuario conectado
// si el usuario no está conectado, cambie a la página de inicio de sesión y envie mensaje en pantalla = 1

    if (isset($_POST['reg'])) {
        extract($_POST);
         $sql = mysqli_query($mysqli, "INSERT INTO t_huespedes(nro_ident,nombres,apellidos,lugar_origen,celular, fecha_nac,edad,correo_elec,password) VALUES($ident,'$nombres','$apellidos','$origen','$celular','$fecha',$edad,'$email','$pass')")  or die('Error : '.mysqli_error($mysqli));

            // contraseñas de selección de la tabla de usuario se comprueban
            
            if ($sql) {
                        // si tiene éxito mensaje indican exitosa actualización de datos
                        header("location: index.php?mensaje=Exito");
                        exit();
        }
    }   
               
?>
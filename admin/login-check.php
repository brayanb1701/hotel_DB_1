<?php
/* Agrega conexion a la base de datos*/
require_once "../config/database.php";

// datos enviados desde el formulario de inicio de sesion
$username = mysqli_real_escape_string($mysqli, stripslashes(strip_tags(htmlspecialchars(trim($_POST['username'])))));
$password = mysqli_real_escape_string($mysqli, stripslashes(strip_tags(htmlspecialchars(trim($_POST['password'])))));

// asegúrese de que el nombre de usuario y la contraseña es en forma de letras o números.
if (!ctype_alnum($username) OR !ctype_alnum($password)) {
	header("Location: index.php?alert=1");
}
else {
	// comprobación de los datos
	$query = mysqli_query($mysqli, "SELECT * FROM t_admin WHERE usuario='$username' AND password='$password'")
									or die('Error: '.mysqli_error($mysqli));
	$rows  = mysqli_num_rows($query);
	$query2 = mysqli_query($mysqli, "SELECT * FROM t_huespedes WHERE nro_ident='$username' AND password='$password'")
									or die('Error: '.mysqli_error($mysqli));
	$rows2  = mysqli_num_rows($query2);

	// Si los datos estan correctos, entonces inicio sesion
	if ($rows > 0) {
		$data  = mysqli_fetch_assoc($query);

		session_start();
		$_SESSION['username'] = $data['usuario'];
		$_SESSION['password'] = $data['password'];
		$_SESSION['fullname'] = $data['nombres']." ".$data['apellidos'];
		
		// Redirecciona a la pagina principal
		header("Location: index2.php?module=home");
		exit();
	}

	if ($rows2 > 0) {
		$data  = mysqli_fetch_assoc($query2);

		session_start();
		$_SESSION['nro_ident'] = $data['nro_ident'];
		$_SESSION['password'] = $data['password'];
		$_SESSION['fullname'] = $data['nombres']." ".$data['apellidos'];
		
		// Redirecciona a la pagina principal
		header("Location: ../reservas.php");
		exit();
	}

	// Sino existen los datos entonces envio de nuevo al login mostrando un error alert=1
	else {
		header("Location: index.php?alert=1");
	}
}
?>
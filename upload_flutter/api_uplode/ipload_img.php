<?php
require_once("config_upload_api.php");

$image = $_FILES['image']['name'];
$nome = $_POST["nome"];


$imagemPath =  'uploads/'.$image;
$tmp_name = $_FILES['image']['tmp_name'];

move_uploaded_file($tmp_name, $imagemPath);

$con->query("INSERT INTO upload_flutter(nome,imagem)VALUES('".$nome."', '".$image."')");

?>
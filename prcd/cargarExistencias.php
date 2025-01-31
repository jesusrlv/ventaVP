<?php

require('../prcd/conn.php');

$categoria = $_POST['categoria'];
$sabor = $_POST['sabor'];
$estado = $_POST['estado'];



$sql = "SELECT * FROM inventario WHERE categoria = '$categoria' AND descripcion = '$sabor'";
$resultado = $conn->query($sql);
$row = $resultado->fetch_assoc();

if($estado == 1){
    $variableEdo = $row['zac'];
}
else if($estado == 2){
    $variableEdo = $row['leon'];
}

echo json_encode(array(
    'success'=> 1,
    'existencias'=> $variableEdo,
    'id' => $row['id'],
    'sabor' => $row['descripcion']
    
));
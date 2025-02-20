<?php

require('conn.php');

$id = $_POST['id'];
$descripcion = $_POST['descripcion'];
$categoria = $_POST['categoria'];
$estado = $_POST['estado'];
$cantidad = $_POST['cantidad'];
$oferta = $_POST['oferta'];
$precio = $_POST['precio'];

if($estado == 1){
    $sql = "UPDATE inventario SET
    descripcion = '$descripcion',
    categoria = '$categoria',
    zac = '$cantidad',
    oferta = '$oferta',
    precio = '$precio',
    descripcion = '$descripcion'
    WHERE id = '$id'
    "; 
    $resultado = $conn->query($sql);

}
else if($estado == 2){
    $sql = "UPDATE inventario SET
    descripcion = '$descripcion',
    categoria = '$categoria',
    leon = '$cantidad',
    oferta = '$oferta',
    precio = '$precio',
    descripcion = '$descripcion'
    WHERE id = '$id'
    "; 
    $resultado = $conn->query($sql);

}

if($resultado){
    echo json_encode(array(
        'success'=>1
    ));
}
else{
    echo json_encode(array(
        'success'=>0
    ));
}

?>
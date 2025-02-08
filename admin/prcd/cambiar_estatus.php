<?php

require('conn.php');

$id = $_POST['id'];
$estatus = $_POST['estatus'];

$sql = "UPDATE venta_completa SET entregado ='$estatus' WHERE id = '$id'";
$resultado = $conn->query($sql);

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
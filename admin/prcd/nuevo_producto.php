<?php

require('conn.php');

$descripcion = $_POST['descripcion'];
$categoria = $_POST['categoria'];
$cantidadZac = $_POST['cantidadZac'];
$cantidadLeon = $_POST['cantidadLeon'];
$oferta = $_POST['oferta'];
$precio = $_POST['precio'];

$sql = "INSERT INTO inventario (
descripcion,
zac,
leon,
precio,
categoria,
oferta
) VALUES(
'$descripcion',
'$cantidadZac',
'$cantidadLeon',
'$precio',
'$categoria',
'$oferta'
);
";
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
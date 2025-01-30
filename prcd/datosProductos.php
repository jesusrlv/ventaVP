<?php

require('../prcd/conn.php');

$sabor = $_POST['sabor'];
$categoria = $_POST['categoria'];

$sql = "SELECT * FROM inventario WHERE descripcion = '$sabor' AND categoria = '$categoria'";
$resultado = $conn->query($sql);
$row = $resultado->fetch_assoc();
    echo json_encode(
        array(
            'id' => $row['id'],
            'sabor' => $row['descripcion'],
            'precio' => $row['precio']
        )
    );
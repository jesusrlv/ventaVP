<?php

require('../prcd/conn.php');

$sabor = $_POST['sabor'];

$sql = "SELECT * FROM inventario WHERE descripcion = '$sabor'";
$resultado = $conn->query($sql);
$row = $resultado->fetch_assoc();
    echo json_encode(
        array(
            'id' => $row['id'],
            'sabor' => $row['descripcion'],
            'precio' => $row['precio']
        )
    );
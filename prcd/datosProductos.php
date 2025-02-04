<?php

require('../prcd/conn.php');

$sabor = $_POST['sabor'];
$categoria = $_POST['categoria'];

$sql = "SELECT * FROM inventario WHERE descripcion = '$sabor' AND categoria = '$categoria'";
$resultado = $conn->query($sql);
$row = $resultado->fetch_assoc();

$sqlCategoria = "SELECT * FROM categoria WHERE categoria = '$categoria'";
$resultadocategoria = $conn->query($sqlCategoria);
$rowCategoria = $resultadocategoria->fetch_assoc();
$categoriaP = $rowCategoria['id'];
    echo json_encode(
        array(
            'id' => $row['id'],
            'sabor' => $row['descripcion'],
            'precio' => $row['precio'],
            'categoria' => $categoriaP
        )
    );
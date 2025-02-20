<?php

require('conn.php');

$estado = $_POST['estado'];
$x = 0;

$sql = "SELECT * FROM inventario ORDER BY id DESC";
$resultado = $conn->query($sql);
while($row = $resultado->fetch_assoc()){

    $x++;
    echo'
    <tr>
        <td>'.$x.'</td>
        <td>'.$row['descripcion'].'</td>
        <td>'.$row['categoria'].'</td>';

        if($estado == 1){
            $estado2 = $row['zac'];
            echo'
            <td>'.$row['zac'].'</td>
            ';
        }
        else if($estado == 2){
            $estado2 = $row['leon'];
            echo'
            <td>'.$row['leon'].'</td>
            ';
        }

        echo'
        <td>'.$row['precio'].'</td>
        <td>'.$row['oferta'].'</td>
        <td>
            <a href="#" onclick="editarProducto('.$row['id'].', \''.addslashes($row['descripcion']).'\', \''.addslashes($row['categoria']).'\', \''.addslashes($estado).'\', '.$estado2.', '.$row['precio'].', '.$row['oferta'].')">
                <i class="bi bi-pencil-square text-danger"></i>
            </a>
        </td>
        <td>
            <a href="#" onclick="eliminarProducto('.$row['id'].')">
                <i class="bi bi-trash3-fill text-danger"></i>
            </a>
        </td>
        ';
        
        echo'
    </tr>
    ';
}
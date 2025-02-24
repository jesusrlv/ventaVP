<?php

require('conn.php');

$sql = "SELECT * FROM categoria ORDER BY id ASC";
$resultado = $conn->query($sql);
$x=0;
while($row = $resultado->fetch_assoc()){
    $x++;
    echo'
    <tr class="text-center">
        <td>'.$x.'</td>
        <th scope="row"><img src="../productos/'.$row['img'].'" width="50"></th>
        <td>'.$row['categoria'].'</td>
        <td>'.$row['precio'].'</td>
        <td><a href="#" onclick="deleteCategoria('.$row['id'].')"><i class="bi bi-trash3-fill text-danger"></i></a></td>
    </tr>
    ';
}

?>
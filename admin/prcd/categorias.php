<?php

require('conn.php');

$sql = "SELECT * FROM categoria ORDER BY id ASC";
$resultado = $conn->query($sql);
while($row = $resultado->fetch_assoc()){
    echo'
    <option value="'.$row['categoria'].'">'.$row['categoria'].'</option>
    ';
}

?>
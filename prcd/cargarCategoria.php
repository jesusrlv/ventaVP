<?php

require('../prcd/conn.php');

$sql = "SELECT * FROM categoria ORDER BY id ASC";
$resultado = $conn->query($sql);
echo'
<option value ="" selected>Selecciona la categoría ...</option>
';
while($row = $resultado->fetch_assoc()){
    echo '
    <option value="'.$row['categoria'].'">'.$row['categoria'].'</option>
    ';
}
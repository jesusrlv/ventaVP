<?php

require('../prcd/conn.php');

$categoria = $_POST['categoria'];
$sabor = $_POST['sabor'];

$sql = "SELECT * FROM inventario WHERE categoria = '$categoria' AND descripcion = '$sabor'";
$resultado = $conn->query($sql);
echo'
<option value ="" selected>Selecciona la categoría ...</option>
';
while($row = $resultado->fetch_assoc()){
    echo '
    <option value="'.$row['categoria'].'">'.$row['categoria'].'</option>
    ';
}
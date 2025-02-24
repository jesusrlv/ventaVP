<?php

require('conn.php');

$id = $_POST['id'];

$sql = "DELETE FROM categoria WHERE id = '$id'";
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
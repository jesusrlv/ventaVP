<?php
session_start();

require('conn.php');

if(isset($_SESSION['sess'])){
    echo json_encode(array(
        'success'=>1
    ));
}
else{
    echo json_encode(array(
        'success'=>0
    ));
}

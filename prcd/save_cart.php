<?php
header("Content-Type: application/json");

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $input = file_get_contents("php://input");
    $cartData = json_decode($input, true);

    if (!$cartData) {
        echo json_encode(["message" => "Datos inválidos"]);
        exit;
    }

    // Conexión a la base de datos
    $mysqli = new mysqli("localhost", "root", "", "superissste");

    if ($mysqli->connect_error) {
        echo json_encode(["message" => "Error de conexión: " . $mysqli->connect_error]);
        exit;
    }

    foreach ($cartData as $item) {
        $productId = $mysqli->real_escape_string($item['productId']);
        $quantity = $mysqli->real_escape_string($item['quantity']);
        $identificador = $mysqli->real_escape_string($item['identificador']);
        $total = $mysqli->real_escape_string($item['total']);

        $query = "INSERT INTO carrito (
        producto_id, 
        cantidad, 
        total,
        id_venta_completa
        ) VALUES (
        '$productId', 
        '$quantity', 
        '$total',
        '$identificador'
        )";
        $mysqli->query($query);
    }

    $mysqli->close();
    echo json_encode(["message" => "Carrito guardado correctamente"]);
}
?>

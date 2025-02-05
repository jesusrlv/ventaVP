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
    $mysqli = new mysqli("localhost", "root", "", "ventaVP");

    if ($mysqli->connect_error) {
        echo json_encode(["message" => "Error de conexión: " . $mysqli->connect_error]);
        exit;
    }

    foreach ($cartData as $item) {
        $productId = $mysqli->real_escape_string($item['productId']);
        $quantity = $mysqli->real_escape_string($item['quantity']);
        $identificador = $mysqli->real_escape_string($item['identificador']);
        $estado = $mysqli->real_escape_string($item['estado']);
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
        // $mysqli->query($query);
        if ($mysqli->query($query) == true){
            if($estado == 1){
                $sqlUpdate = "UPDATE inventario SET zac = zac - $quantity WHERE id = $productId";
            }
            else{
                $sqlUpdate = "UPDATE inventario SET leon = leon - $quantity WHERE id = $productId";
            }
            $mysqli->query($sqlUpdate); 
        }
    }

    $mysqli->close();
    echo json_encode(["message" => "Carrito guardado correctamente"]);
}
?>

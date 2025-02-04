<?php
include('conn.php');
header("Content-Type: application/json");

// Leer los datos enviados en el cuerpo de la solicitud (JSON)
$jsonData = file_get_contents("php://input");
$data = json_decode($jsonData, true); // Decodificar el JSON

// Validar si los datos se recibieron correctamente
if ($data === null) {
    $response = [
        "success" => false,
        "message" => "Error al procesar los datos recibidos."
    ];
    echo json_encode($response);
    exit;
}

date_default_timezone_set('America/Mexico_City');
                setlocale(LC_TIME, 'es_MX.UTF-8');
$fecha_sistema = strftime("%Y-%m-%d,%H:%M:%S");

// Extraer datos desde el JSON recibido
$nombre = $data['nombre'] ?? null;
$direccion = $data['direccion'] ?? null;
$telefono = $data['telefono'] ?? null;

$estado = $data['estado'] ?? null;

// Validar campos obligatorios
if (empty($nombre) || empty($direccion) || empty($telefono)) {
    $response = [
        "success" => false,
        "message" => "Todos los campos son obligatorios."
    ];
    echo json_encode($response);
    exit;
}

// Generar un identificador único
$fechaActual = date("YmdHis"); // Formato: AñoMesDíaHoraMinutoSegundo
$identificadorUnico = $fechaActual . strtoupper(bin2hex(random_bytes(4))); // Cadena única alfanumérica

// Insertar los datos en la base de datos
$query = "INSERT INTO venta_completa (
    nombre_completo,
    direccion,
    telefono,
    identificador,
    estado,
    fecha_registro
) VALUES (
    '$nombre',
    '$direccion',
    '$telefono',
    '$identificadorUnico',
    '$estado',
    '$fecha_sistema'
)";
$resultado = $conn->query($query);

if ($resultado) {
    $response = [
        "success" => true,
        "message" => "Compra registrada con éxito",
        "estado" => $estado,
        "identificador" => $identificadorUnico // Devolver el identificador generado
    ];
    echo json_encode($response);
} else {
    $response = [
        "success" => false,
        "message" => "Error al registrar la compra: " . $conn->error
    ];
    echo json_encode($response);
}
?>

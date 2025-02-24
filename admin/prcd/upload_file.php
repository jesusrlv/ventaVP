<?php
require('conn.php'); // Incluye la conexión a la base de datos

// Datos del formulario
$categoria = $_POST['categoria']; // Asegúrate de validar y sanitizar este valor
$precio = $_POST['precio']; // Asegúrate de validar y sanitizar este valor

// Información del archivo subido
$fileName = $_FILES["file"]["name"]; // Nombre del archivo
$fileTmpLoc = $_FILES["file"]["tmp_name"]; // Ubicación temporal del archivo
$fileType = $_FILES["file"]["type"]; // Tipo de archivo
$fileSize = $_FILES["file"]["size"]; // Tamaño del archivo en bytes
$fileErrorMsg = $_FILES["file"]["error"]; // Código de error

// Verificar si se seleccionó un archivo
if (!$fileTmpLoc) {
    echo "ERROR: Por favor, selecciona un archivo antes de hacer clic en el botón de subir.";
    exit();
}

// Obtener la extensión del archivo
$extension = pathinfo($fileName, PATHINFO_EXTENSION);

// Ruta base donde se guardarán los archivos
$basePath = "../../productos/";

// Nombre inicial del archivo
$nombreArchivo = $categoria . '.' . $extension;

// Verificar si el archivo ya existe y generar un nombre único
$contador = 1;
while (file_exists($basePath . $nombreArchivo)) {
    // Si el archivo existe, agregar un sufijo único (por ejemplo, un número incremental)
    $nombreArchivo = $categoria . '_' . $contador . '.' . $extension;
    $contador++;
}

// Mover el archivo subido a la ubicación final
if (move_uploaded_file($fileTmpLoc, $basePath . $nombreArchivo)) {
    echo "$fileName se ha subido correctamente.";

    // Guardar la ruta del archivo en la base de datos
    $ruta = $nombreArchivo;
    $sqlInsert = "INSERT INTO categoria (
        categoria,
        precio,
        img
    ) VALUES (
        '$categoria',
        '$precio',
        '$ruta'
    )";
    $resultado = $conn->query($sqlInsert);

    if ($resultado) {
        echo " Los datos se han insertado correctamente en la base de datos.";
    } else {
        echo " Error al insertar datos en la base de datos: " . $conn->error;
    }
} else {
    echo " Error al mover el archivo subido.";
}
?>
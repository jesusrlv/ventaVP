<?php

require('../prcd/conn.php');

// Recibir datos POST
$producto = $_POST['producto'];
$num = $_POST['num'];

// Consulta protegida contra inyección SQL
$stmt = $conn->prepare("SELECT COUNT(*) as contador FROM inventario WHERE categoria = ?");
$stmt->bind_param("s", $producto);
$stmt->execute();
$resultado = $stmt->get_result();
$row = $resultado->fetch_assoc();
$numero = $row['contador'];

// Calcular número de páginas
$contar = ceil($numero / 12);

// Escapar el valor de $producto para el HTML
$productoEscaped = htmlspecialchars($producto, ENT_QUOTES, 'UTF-8');

// Generar la paginación
echo '
<nav aria-label="Page navigation example">
    <ul class="pagination">
        <li class="page-item"><a class="page-link" href="javascript:void(0)">Anterior</a></li>
';

if ($numero > 0) {
    $i = 0;
    for ($x = 0; $x < $contar; $x++) {
        $i++;
        echo '
        <li class="page-item"><a href="javascript:void(0)" class="page-link" onclick="return cargaProductos(\'' . $productoEscaped . '\',' . $x . ')">' . $i . '</a></li>
        ';
    }
}

echo '
        <li class="page-item"><a class="page-link" href="javascript:void(0)">Siguiente</a></li>
    </ul>
</nav>
';
?>

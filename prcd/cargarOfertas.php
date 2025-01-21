<?php

require('../prcd/conn.php');

$sql = "SELECT * FROM inventario WHERE oferta = 1 ORDER BY id DESC";
$resultado = $conn->query($sql);
$filas = $resultado->num_rows;
if ($filas > 0){
    $x = 0;
    while($row = $resultado->fetch_assoc()){
        $x++;
        if($x == 1){
        echo'
        <div class="carousel-item active">
        ';
        }
        else{
        echo'
        <div class="carousel-item">
        ';    
        }
        echo '
            <img src="productos/'.$row['ruta'].'" class="d-block w-100 imagenOfertas" alt="...">

            <!-- Etiqueta "Ofertas" en la esquina superior izquierda -->
            <div class="position-absolute top-0 start-0 bg-warning text-dark text-center p-2 w-50 display-6" style="box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);">
                <i class="bi bi-piggy-bank"></i> Ofertas
            </div>

            <!-- Información en la parte inferior con botones de control -->
            <div class="position-absolute bottom-0 start-0 bg-primary text-white w-100 p-3">
                <div class="container">
                    <div class="d-flex justify-content-between align-items-center">
                        <!-- Información del producto y botón alineados verticalmente -->
                        <div class="d-flex align-items-center">
                            <h5 class="mb-0">'.$row['descripcion'].' | Precio: $'.$row['precio'].'</h5>
                        </div>
                        <!-- Botón alineado verticalmente -->
                        <div class="d-flex align-items-center" style="z-index:10000;">
                            <button class="btn btn-outline-light btn-sm"onclick="carritoStore('.$row['id'].',\''.$row['descripcion'].'\','.$row['precio'].')">
                                <i class="bi bi-cart-plus-fill"></i> Agregar
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        ';
    }

}
else{
    echo '
       <div class="carousel-item active">
            <img src="img/superissste_no_ofertas.jpg" class="d-block w-100 h-100 " alt="..." style="object-fit: contain;">
        </div>
        
        ';
}
<?php

require('../prcd/conn.php');

$sql = "SELECT * FROM inventario ORDER BY RAND() LIMIT 12";
$resultado = $conn->query($sql);

while($row = $resultado->fetch_assoc()){
    echo '
    <div class="col-md-3 col-sm-12">
        <div class="card1000">
            <img src="productos/'.$row['ruta'].'" class="card-img-top" alt="..." id="imagenCatalogo">
            <div class="card-body">
                <h5 class="card-title">
                    <span class="badge text-bg-primary">'.$row['descripcion'].'</span>
                </h5>
                <p><span class="text-light"><strong>Precio:</strong></span><span class="text-light"> $'.$row['precio'].'</span></p>
            </div>
            <div class="card-footer">
                <div class="d-grid gap-2">
                    <button class="btn btn-warning" type="button" onclick="carritoStore('.$row['id'].',\''.$row['descripcion'].'\','.$row['precio'].')"><i class="bi bi-cart-plus-fill"></i> Carrito</button>
                </div>
            </div>
        </div>
    </div>
    ';
}
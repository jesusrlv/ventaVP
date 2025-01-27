<?php

require('../prcd/conn.php');

$estado = $_POST['estadoMx'];

$sql = "SELECT * FROM categoria ORDER BY id ASC";
$resultado = $conn->query($sql);

while($row = $resultado->fetch_assoc()){
$categoria = $row['categoria'];
    echo '
<div class="col-md-3 col-sm-12">
    <div class="card cardDos">
        <img src="productos/'.$row['img'].'" class="card-img-top p-2" alt="..." id="imagenCatalogo">
        <div class="card-body">
            <h5 class="card-title">
                <span class="badge text-bg-primary">'.$row['categoria'].'</span>
            </h5>
            <p>
                <select class="form-select" aria-label="Default select example">
                    <option selected>Selecciona el sabor ...</option>';
                
$sql2 = "SELECT * FROM inventario WHERE categoria = '$categoria'";
$resultado2 = $conn->query($sql2);
while($row2 = $resultado2->fetch_assoc()){
    echo'
                <option value="'.$row2['descripcion'].'">'.$row2['descripcion'].'</option>
    ';
}
                    
    echo'
                </select>
            </p>
        </div>
        <div class="card-footer">
            <div class="d-grid gap-2">
                <button class="btn btn-warning" type="button" onclick="carritoStore()"><i class="bi bi-cart-plus-fill"></i> Carrito</button>
            </div>
        </div>
    </div>
</div>';

}

// <button class="btn btn-warning" type="button" onclick="carritoStore('.$row['id'].',\''.$row['descripcion'].'\','.$row['precio'].')"><i class="bi bi-cart-plus-fill"></i> Carrito</button>
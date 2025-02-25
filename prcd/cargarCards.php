<?php

require('../prcd/conn.php');

$estado = $_POST['estadoMx'];

$sql = "SELECT * FROM categoria ORDER BY id ASC";
$resultado = $conn->query($sql);
echo'
<div class="row g-2 mb-2" id="categoria2">';
while($row = $resultado->fetch_assoc()){
$categoria = $row['categoria'];
    echo '
<div class="col-lg-3 col-md-4 col-sm-6 col-12 d-flex">
    <div class="card cardDos w-100">

        <img src="productos/'.$row['img'].'" class="card-img-top w-100 h-100 bg-dark p-2" alt="..." id="imagenCatalogo">
        <div class="card-body">
            <h5 class="card-title">
                <span class="badge text-bg-primary"><small>'.$row['categoria'].' '.$row['prefijo'].'</small></span>
                <span class="badge text-bg-warning"><small>$'.$row['precio'].'.00 MXN</small></span>
            </h5>
            <p>
                <select class="form-select" aria-label="Default select example" id="sabor'.$row['id'].'" onchange="existencias('.$row['id'].',\''.addslashes($categoria).'\','.$estado.',this.value)">
                    <option value="" selected>Selecciona el sabor ...</option>';
                
$sql2 = "SELECT * FROM inventario WHERE categoria = '$categoria'";
$resultado2 = $conn->query($sql2);
while($row2 = $resultado2->fetch_assoc()){
    if($estado == 1){
        $variable = $row2['zac'];
    }
    else{
        $variable = $row2['leon'];
    }

    if($variable > 0){
        echo'
                    <option value="'.$row2['descripcion'].'">'.$row2['descripcion'].'</option>
        ';
    }
    else{
        echo'
                    <option value="'.$row2['descripcion'].'" disabled>'.$row2['descripcion'].' - Agotado</option>
        ';
    }
        
}
                    
    echo'
                </select>
            </p>
            <p class="d-flex align-items-center gap-2">
                <span class="badge text-bg-warning">Existencias:</span>
                <span id="existencia'.$row['id'].'" class="badge rounded-pill text-bg-light text-center"></span>
                
            </p>
            <p class="d-flex align-items-center gap-2">
                <span class="badge text-bg-success">Cantidad:</span>
                <span id="agregarCarrito'.$row['id'].'" class="badge rounded-pill text-bg-light text-center"></span>
                <a href="#" id="masProd'.$row['id'].'" onclick="aumentarCarrito('.$row['id'].')" hidden>
                    <i class="bi bi-plus-circle-fill text-warning"></i>
                </a>
                <a href="#" id="menosProd'.$row['id'].'" onclick="disminuirCarrito('.$row['id'].')" hidden>
                    <i class="bi bi-dash-circle-fill text-warning"></i>
                </a>
            </p>

        </div>
        <div class="card-footer">
            <div class="d-grid gap-2">
                <button class="btn btn-warning" type="button" id="btnAgregar" onclick="agregarCarrito('.$row['id'].', \''.addslashes($categoria).'\'); bloquearOptions('.$row['id'].')">
                 <i class="bi bi-cart-plus-fill"></i> Agregar al carrito
                </button>
            </div>
        </div>
    </div>
</div>';

}
echo'
 </div>';
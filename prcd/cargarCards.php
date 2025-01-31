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
<div class="col-md-3 col-sm-12">
    <div class="card cardDos">
        <img src="productos/'.$row['img'].'" class="card-img-top w-100 h-100 bg-dark p-2" alt="..." id="imagenCatalogo">
        <div class="card-body">
            <h5 class="card-title">
                <span class="badge text-bg-primary"><small>'.$row['categoria'].'</small></span>
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
            <p>
                <span class="text-light"><small>Existencias: </small></span><span id="existencia'.$row['id'].'" class="text-light"></span>
            </p>
        </div>
        <div class="card-footer">
            <div class="d-grid gap-2">
                <button class="btn btn-warning" type="button" onclick="agregarCarrito('.$row['id'].', \''.addslashes($categoria).'\')">
                 <i class="bi bi-cart-plus-fill"></i> Carrito
                </button>
            </div>
        </div>
    </div>
</div>';

}
echo'
 </div>';

// <button class="btn btn-warning" type="button" onclick="carritoStore('.$row['id'].','.$row['precio'].')"><i class="bi bi-cart-plus-fill"></i> Carrito</button>

// <button class="btn btn-warning" type="button" onclick="carritoStore('.$row['id'].',\''.$row['descripcion'].'\','.$row['precio'].')"><i class="bi bi-cart-plus-fill"></i> Carrito</button>

// Iplay Max 	265
// Iplay big Max 	375
// Iplay Xbox 	355
// Iplay Xbox pro	410
// Masking ultra 	265
// Nasty 8.5	410
// Vhill 3000	285
// Vhill 6000	385
// Vhil 12000	585
// Wonder g4	365
// Wonder g20	690
// Wonder race 	590
// Waka 16	690
// Waka 18	725
// Waka 36	790
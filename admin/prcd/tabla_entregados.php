<?php

require('conn.php');

$estado = $_POST['estado'];
$x = 0;

$sql = "SELECT * FROM venta_completa WHERE entregado = 1 AND estado = '$estado' ORDER BY id DESC";
$resultado = $conn->query($sql);
while($row = $resultado->fetch_assoc()){

    $id = $row['identificador'];
    $sqlId = "SELECT * FROM carrito WHERE id_venta_completa = '$id'";
    $resultadoId = $conn->query($sqlId);

    $x++;
    echo'
    <tr>
        <td>'.$x.'</td>
        <td>'.$row['identificador'].'</td>
        <td>'.$row['nombre_completo'].'</td>
        <td>'.$row['direccion'].'</td>
        <td>'.$row['telefono'].'</td>';
    if($row['estado'] == 1){
        echo '
        <td><span class="badge text-bg-primary"><i class="bi bi-globe-americas mt-2"></i> Zacatecas</span></td>
        ';
    }
    else if($row['estado'] == 2 || $row['estado'] == 0){
        echo'
        <td><span class="badge text-bg-warning"><i class="bi bi-globe-americas mt-2"></i> León, GTO</span></td>
        ';
    }

    if(IS_NULL($row['entregado']) || $row['entregado'] == 0){
        echo'
        <td><a href="#" onclick="cambiarEstatus('.$row['id'].',1)"><span class="badge text-bg-danger"><i class="bi bi-x-circle-fill mt-2"></i> No entregado</span></a></td>

        ';
    }
    else{
        echo'
        <td><a href="#" onclick="cambiarEstatus('.$row['id'].',0)"><span class="badge text-bg-success"><i class="bi bi-check-circle-fill mt-2"></i> Entregado</span></a></td>
        ';
    }
        
        echo'
    </tr>
    <tr>
        <td colspan="9">
        <div class="accordion accordion-flush" id="accordionFlushExample'.$x.'">
            <div class="accordion-item">
                <h2 class="accordion-header">
                <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapseOne'.$x.'" aria-expanded="false" aria-controls="flush-collapseOne'.$x.'">
                    Productos
                </button>
                </h2>
                <div id="flush-collapseOne'.$x.'" class="accordion-collapse collapse" data-bs-parent="#accordionFlushExample'.$x.'">
                <div class="accordion-body">
                
                    <div class="row text-center">
                        <div class="col-3 border bg-primary text-light">
                            Producto
                        </div>
                        <div class="col-3 border bg-primary text-light">
                            Cantidad
                        </div>
                        <div class="col-3 border bg-primary text-light">
                            Total
                        </div>
                        <div class="col-3 border bg-primary text-light">
                            Fecha
                        </div>
                    </div>
            
                ';
                while($rowId = $resultadoId->fetch_assoc()){
                    $idP = $rowId['producto_id'];
                    $sqlFinal = "SELECT * FROM inventario WHERE id = '$idP'";
                    $resultadoF = $conn->query($sqlFinal);
                    $rowF = $resultadoF->fetch_assoc();
                    echo'
                    <div class="row text-center">
                        <div class="col-3 border">
                            '.$rowF['descripcion'].'
                        </div>
                        <div class="col-3 border">
                            '.$rowId['cantidad'].'
                        </div>
                        <div class="col-3 border">
                            '.$rowId['total'].'
                        </div>
                        <div class="col-3 border">
                            '.$rowId['fecha'].'
                        </div>
                    </div>
                    ';
                }
                
                echo'
                </div>
                </div>
            </div>
        </div>
        </td>
    </tr>
    ';
}
function modalInventario(){

    $("#estado").modal("show");

}

function cargaCategoria(){
    $.ajax({
        type: "POST",
        url: "prcd/cargarCategoria.php",
        dataType: "html",
        success: function(data){
            $('#categoria').fadeIn(1000).html(data);    
        }
    });
}

function cargaProductosRandom(){

    $.ajax({
        type: "POST",
        url: "prcd/cargarProductosRandom.php",
        dataType: "html",
        success: function(data){
            
            $('#inventario').fadeIn(1000).html(data);    
        }
    });
}

function cargaProductos(producto,num){
    
    document.getElementById('inventario').innerHTML = "";
    contador(producto,num);
    $.ajax({
        type: "POST",
        url: "prcd/cargarProductos.php",
        data:{
            producto:producto,
            num:num
        },
        dataType: "html",
        success: function(data){
            // $('#inventario').fadeIn(1000).html(data); 
            document.getElementById('inventario').innerHTML = "";
            $('#inventario').html(data);
            
            // Aplica la clase de animación a cada card después de insertarlas.
            $('.card').each(function (index) {
                $(this).addClass('card-slide-in');
                // Añadir un retraso para cada tarjeta (efecto escalonado).
                $(this).css('animation-delay', `${index * 0.01}s`);
            });
        }
    });
}

function cargarCards(estadoMx){
    $("#estado").modal("hide");
    $.ajax({
        type: "POST",
        url: "prcd/cargarCards.php",
        data:{
            estadoMx:estadoMx
        },
        dataType: "html",
        success: function(data){
            $('#categoria2').fadeIn(1000).html(data);
            document.getElementById('estado').value = estadoMx;
            
            if(estadoMx == 1){
                document.getElementById('edoEnvio').innerHTML = "Zacatecas";
            }
            else if(estadoMx == 2){
                document.getElementById('edoEnvio').innerHTML = "León, Guanajuato";
            }
        }
    });
}

function contador(producto,num){
    $.ajax({
        type:"POST",
        data:{
            producto:producto,
            num:num
        },
        url:"prcd/contador.php",
        dataType:"html",
        success:function(data){
            $('#contadorProductos').fadeIn(1000).html(data);
        }
    });
}

function ofertas(){
    $.ajax({
        type: "POST",
        url: "prcd/cargarOfertas.php",
        dataType: "html",
        success: function(data){
            $('#ofertas').fadeIn(1000).html(data);    
        }
    });
}

// offcanvas
function carrito(){
    // Seleccionar el elemento del offcanvas
    const offcanvasElement = document.getElementById('carrito');
    
    // Crear una instancia de Offcanvas de Bootstrap
    const bsOffcanvas = new bootstrap.Offcanvas(offcanvasElement);
  
    // Mostrar el offcanvas
    bsOffcanvas.show();
}

function existencias(id,categoria,estado,sabor){
    $.ajax({
        type: "POST",
        url: "prcd/cargarExistencias.php",
        dataType: "json",
        data:{
            id:id,
            categoria:categoria,
            estado:estado,
            sabor:sabor
        },
        success: function(data){
            console.log("aquí llega");

            var datos = JSON.parse(JSON.stringify(data));
            var success = datos.success;
            var existencias = datos.existencias;
            var idProd = datos.id;
            var sabor = datos.sabor;
            console.log(existencias)
                document.getElementById('existencia'+id).innerText = existencias;
                
            
           
        }
    });
}
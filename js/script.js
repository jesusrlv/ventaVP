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
            $(this).css('animation-delay', `${index * 0.1}s`);
        });
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


// function carritoStore(id,detalle,precio){
//     // Seleccionar el elemento del offcanvas
//     const offcanvasElement = document.getElementById('carrito');
    
//     // Crear una instancia de Offcanvas de Bootstrap
//     const bsOffcanvas = new bootstrap.Offcanvas(offcanvasElement);
  
//     // Mostrar el offcanvas
//     bsOffcanvas.show();

//     //función de llenado de grid
//     tablaGrid(id,detalle,precio);
// }

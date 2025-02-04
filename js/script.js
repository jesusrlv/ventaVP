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
        async: true,
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
            document.getElementById('existencia'+id).innerText = existencias;
            document.getElementById('agregarCarrito'+id).innerText = 1;
            document.getElementById('masProd'+id).hidden = false;
            document.getElementById('menosProd'+id).hidden = false;
                 
        }
    });
}

function aumentarCarrito(val) {
    event.preventDefault(); // Evita que el enlace te lleve al inicio
    var elemento = document.getElementById('agregarCarrito' + val);
    var cantidad = parseInt(elemento.innerText, 10); // Convierte el texto a número
    cantidad++; // Incrementa la cantidad
    elemento.innerText = cantidad; // Actualiza el valor en el HTML
}

function disminuirCarrito(val) {
    event.preventDefault(); // Evita que el enlace te lleve al inicio
    var elemento = document.getElementById('agregarCarrito' + val);
    var cantidad = parseInt(elemento.innerText, 10); // Convierte el texto a número
    if (cantidad > 0) { // Evita que sea menor a 0
        cantidad--; // Disminuye la cantidad
    }
    elemento.innerText = cantidad; // Actualiza el valor en el HTML
}

function bloquearOptions(id){
    let select = document.getElementById('sabor' + id);
    let selectedValue = select.value; // Obtener el valor seleccionado

    if (selectedValue !== "") {
        let options = select.getElementsByTagName('option');

        for (let i = 0; i < options.length; i++) {
            if (options[i].value == selectedValue) {
                options[i].disabled = true; // Deshabilitar la opción seleccionada
            }
        }
        console.log("Seleccionado y deshabilitado:", selectedValue);
        document.getElementById('sabor'+id).value = "";
        document.getElementById('existencia' + id).innerText = ""; 
        document.getElementById('agregarCarrito' + id).innerText = ""; 

    }

}
function regresarOptions(id, sabor) {
    console.log("ID:", id, "Sabor:", sabor);

    // Obtener el select correspondiente
    let select = document.getElementById('sabor' + id);

    if (!select) {
        console.warn("No se encontró el select con ID:", 'sabor' + id);
        return;
    }

    // Obtener todas las opciones del select
    let options = select.getElementsByTagName('option');

    // Recorrer las opciones para encontrar la que coincide con 'sabor'
    for (let i = 0; i < options.length; i++) {
        if (options[i].value == sabor) {
            options[i].disabled = false; // Habilitar la opción
            console.log("Se ha habilitado nuevamente:", sabor);
            break; // Terminamos el loop cuando encontramos el valor
        }
        else {
            console.log("No Se habilitado:", sabor);
        }
    }
}


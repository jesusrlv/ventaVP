function tablaDatos(){
  $('#modalAcceso').modal('hide');
  let estado = document.getElementById('selectEstado').value;
  if(estado == ""){
    alert("Debes seleccionar un estado");
    return;
  }
  document.getElementById('tablaEntregas').hidden = false;
  document.getElementById('tablaProductos').hidden = true;
  $.ajax({
    type: "POST",
    url: "prcd/tabla_pedidos.php",
    data:{
      estado:estado
    },
    dataType: "html",
    success: function(data){
        document.getElementById('tituloTipo').innerText = "Pedidos";
        document.getElementById('pedidosH').hidden = false;
        document.getElementById('entregadosH').hidden = true;
        document.getElementById('noentregadosH').hidden = true;
        document.getElementById('productosH').hidden = true;
        document.getElementById('usuariosH').hidden = true;
        $('#tablaDatos').fadeIn(1000).html(data);    
    }
  });
}

function cambiarTitulo(estado){
  if(estado == 1){
    document.getElementById('tituloEstado').innerText = "Zacatecas";
    document.getElementById('tituloEstado2').innerText = "Zacatecas";
    tablaDatos();
  }
  if(estado == 2){
    document.getElementById('tituloEstado').innerText = "León, GTO";
    document.getElementById('tituloEstado2').innerText = "León, GTO";
    tablaDatos()
  }
}

function tablaEntregados(){
  let estado = document.getElementById('selectEstado').value;
  if(estado == ""){
    alert("Debes seleccionar un estado");
    return;
  }
  document.getElementById('tituloTipo').innerText = "Entregados";
  document.getElementById('tablaEntregas').hidden = false;
  document.getElementById('tablaProductos').hidden = true;
  $.ajax({
    type: "POST",
    url: "prcd/tabla_entregados.php",
    data:{
      estado:estado
    },
    dataType: "html",
    success: function(data){
        $('#tablaDatos').fadeIn(1000).html(data);
        document.getElementById('pedidosH').hidden = true;
        document.getElementById('entregadosH').hidden = false;
        document.getElementById('noentregadosH').hidden = true;
        document.getElementById('productosH').hidden = true;
        document.getElementById('usuariosH').hidden = true;    
    }
  });
}
function tablaNoEntregados(){
  let estado = document.getElementById('selectEstado').value;
  if(estado == ""){
    alert("Debes seleccionar un estado");
    return;
  }
  document.getElementById('tituloTipo').innerText = "No Entregados";
  document.getElementById('tablaEntregas').hidden = false;
  document.getElementById('tablaProductos').hidden = true;
  $.ajax({
    type: "POST",
    url: "prcd/tabla_no_entregados.php",
    data:{
      estado:estado
    },
    dataType: "html",
    success: function(data){
        $('#tablaDatos').fadeIn(1000).html(data);  
        
        document.getElementById('pedidosH').hidden = true;
        document.getElementById('entregadosH').hidden = true;
        document.getElementById('noentregadosH').hidden = false;
        document.getElementById('productosH').hidden = true;
        document.getElementById('usuariosH').hidden = true;
    }
  });
}

function tablaProdcutos(){
  let estado = document.getElementById('selectEstado').value;
  if(estado == ""){
    alert("Debes seleccionar un estado");
    return;
  }
  document.getElementById('tituloProductos').innerText = "Inventario";
  document.getElementById('tablaEntregas').hidden = true;
  document.getElementById('tablaProductos').hidden = false;
  $.ajax({
    type: "POST",
    url: "prcd/tabla_productos.php",
    data:{
      estado:estado
    },
    dataType: "html",
    success: function(data){
        $('#tablaProductos2').fadeIn(1000).html(data);  
        
        document.getElementById('pedidosH').hidden = true;
        document.getElementById('entregadosH').hidden = true;
        document.getElementById('noentregadosH').hidden = true;
        document.getElementById('productosH').hidden = false;
        document.getElementById('usuariosH').hidden = true;
    }
  });
}

function editarProducto(id, descripcion, categoria, estado, cantidad, precio,  oferta){
  $('#editarProducto').modal('show');
  datosCategoria();

  document.getElementById('idProducto').value = id;
  document.getElementById('descripcionProducto').value = descripcion;
  document.getElementById('categoriaProducto').value = categoria;
  document.getElementById('estadoProducto').value = estado;
  document.getElementById('cantidadProducto').value = cantidad;
  document.getElementById('ofertaProducto').value = oferta;
  document.getElementById('precioProducto').value = precio;
}

function datosCategoria(){
  $.ajax({
    type: "POST",
    url: "prcd/categorias.php",
    dataType: "html",
    success: function(data){
        $('#categoriaProducto').html(data);  
    }
  });
}

function editarProducto2(){
  if (confirm("¿Editar el producto?")) {
    var id = document.getElementById('idProducto').value;
    var descripcion = document.getElementById('descripcionProducto').value;
    var categoria = document.getElementById('categoriaProducto').value;
    var estado = document.getElementById('estadoProducto').value;
    var cantidad = document.getElementById('cantidadProducto').value;
    var oferta = document.getElementById('ofertaProducto').value;
    var precio = document.getElementById('precioProducto').value;
    $.ajax({
      type: "POST",
      url: "prcd/editar_producto.php",
      data:{
        id:id,
        descripcion:descripcion,
        categoria:categoria,
        estado:estado,
        cantidad:cantidad,
        oferta:oferta,
        precio:precio
        
      },
      dataType: "json",
      success: function(data){
        var datos = JSON.parse(JSON.stringify(data));

        var success = datos.success;

        if(success = 1){
          alert("Producto editado");
          tablaProdcutos();
          $('#editarProducto').modal('hide');
          limpiarCampos()
        }
        else{
          alert("No se editó");
        }
      }
    });
  }
  else{
    alert("No se editó");
  }
}

function cambiarEstatus(id,estatus){
  if (confirm("¿Cambiar el estatus?")) {
    $.ajax({
      type: "POST",
      url: "prcd/cambiar_estatus.php",
      data:{
        id:id,
        estatus:estatus
      },
      dataType: "html",
      success: function(data){
        var datos = JSON.parse(JSON.stringify(data));

        var success = datos.success;

        if(success = 1){
          alert("Estatus cambiado");
          if(estatus == 0){
            tablaNoEntregados();
          }
          else if(estatus == 1){
            tablaEntregados();
          }
        }
        else{
          alert("No se cambió el estatus");
        }
      }
    });
  }
  else{
    alert("No se cambió el estatus");
  }

}

function limpiarCampos(){
  document.getElementById('idProducto').value = "";
  document.getElementById('descripcionProducto').value = "";
  document.getElementById('categoriaProducto').value = "";
  document.getElementById('estadoProducto').value = "";
  document.getElementById('cantidadProducto').value = "";
  document.getElementById('ofertaProducto').value = "";
  document.getElementById('precioProducto').value = "";
}

function checarSession(){
  $.ajax({
    type: "POST",
    url: "prcd/session.php",
    dataType: "json",
    success: function(data){
        
      var datos = JSON.parse(JSON.stringify(data));
      var success = datos.success;

      if(success == 1){
        $('#modalAcceso').modal('show');
      }
      else if(success == 0){
        $('#modalAcceso2').modal('show');
      }

    }
  });
}

function redirigir() {
  window.location.href = "../index.html"; // Cambia por la URL a la que quieres redirigir
}

function eliminarProducto(id){
  if (confirm("Eliminar el producto?")) {
    $.ajax({
      type: "POST",
      url: "prcd/eliminarProducto.php",
      data:{
        id:id
      },
      dataType: "json",
      success: function(data){
          
        var datos = JSON.parse(JSON.stringify(data));
        var success = datos.success;
  
        if(success == 1){
          alert("Prodducto eliminado");
          tablaProdcutos();
        }
        else if(success == 0){
          alert("Producto no eliminado");
        }
  
      }
    });
  }
}
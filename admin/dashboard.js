function tablaDatos(){
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

function editarProducto(id){
  $('#editarProducto').modal('show');
  datosCategoria();
}

function datosCategoria(){

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
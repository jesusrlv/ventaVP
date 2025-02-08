function tablaDatos(){
  let estado = document.getElementById('selectEstado').value;
  if(estado == ""){
    alert("Debes seleccionar un estado");
    return;
  }
  $.ajax({
    type: "POST",
    url: "prcd/tabla_pedidos.php",
    data:{
      estado:estado
    },
    dataType: "html",
    success: function(data){
        document.getElementById('tituloTipo').innerText = "Pedidos";
        $('#tablaDatos').fadeIn(1000).html(data);    
    }
  });
}

function cambiarTitulo(estado){
  if(estado == 1){
    document.getElementById('tituloEstado').innerText = "Zacatecas";
    tablaDatos();
  }
  if(estado == 2){
    document.getElementById('tituloEstado').innerText = "León, GTO";
    tablaDatos()
  }
}

function tablaEntregados(){
  let estado = document.getElementById('selectEstado').value;
  document.getElementById('tituloTipo').innerText = "Entregados";
  if(estado == ""){
    alert("Debes seleccionar un estado");
    return;
  }
  $.ajax({
    type: "POST",
    url: "prcd/tabla_entregados.php",
    data:{
      estado:estado
    },
    dataType: "html",
    success: function(data){
        $('#tablaDatos').fadeIn(1000).html(data);    
    }
  });
}
function tablaNoEntregados(){
  let estado = document.getElementById('selectEstado').value;
  document.getElementById('tituloTipo').innerText = "No Entregados";
  if(estado == ""){
    alert("Debes seleccionar un estado");
    return;
  }
  $.ajax({
    type: "POST",
    url: "prcd/tabla_no_entregados.php",
    data:{
      estado:estado
    },
    dataType: "html",
    success: function(data){
        $('#tablaDatos').fadeIn(1000).html(data);    
    }
  });
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

/* globals Chart:false */

(() => {
  'use strict'

  // Graphs
  const ctx = document.getElementById('myChart')
  // eslint-disable-next-line no-unused-vars
  const myChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: [
        'Sunday',
        'Monday',
        'Tuesday',
        'Wednesday',
        'Thursday',
        'Friday',
        'Saturday'
      ],
      datasets: [{
        data: [
          15339,
          21345,
          18483,
          24003,
          23489,
          24092,
          12034
        ],
        lineTension: 0,
        backgroundColor: 'transparent',
        borderColor: '#007bff',
        borderWidth: 4,
        pointBackgroundColor: '#007bff'
      }]
    },
    options: {
      plugins: {
        legend: {
          display: false
        },
        tooltip: {
          boxPadding: 3
        }
      }
    }
  })
})()
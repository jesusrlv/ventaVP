function accesos(){
    let usr = document.getElementById('usr').value;
    let pwd = document.getElementById('pwd').value;
    
    if (usr == "" || pwd == ""){
        alert("Debes llenar todos los campos");
        return;
    }
    
    $.ajax({
      type: "POST",
      data:{
        usr:usr,
        pwd:pwd
      },
      url: "prcd/acceso.php",
      dataType: "JSON",
      success: function(data){
        var datos = JSON.parse(JSON.stringify(data));
        
        var success = datos.success;
        if(success == 1){
          Swal.fire({
            icon: 'success',
            imageUrl: '../img/logo_vape.png',
            imageHeight: 200,
            title: 'Usuario correcto',
            text: 'Credenciales correctas',
            confirmButtonColor: '#3085d6',
            footer: 'Vape Factory',
            // Personalización del contenedor de la imagen
            didOpen: () => {
                const image = Swal.getImage();
                if (image) {
                    image.style.borderRadius = '50%'; // Fondo redondo
                    image.style.backgroundColor = '#343435'; // Color de fondo
                    image.style.padding = '10px'; // Espaciado interno
                }
            }
        }).then(function(){window.location='dashboard.html';});
        }
        else
        {
            Swal.fire({
                icon: 'error',
                title: 'Datos incorrectos',
                text: 'Credenciales incorrectas',
                confirmButtonColor: '#3085d6',
                footer: 'Vape Factory'
            }).then(function(){window.location='index.html';});
            }
      }
    });
  }
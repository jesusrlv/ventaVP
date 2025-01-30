let nombre = document.getElementById('nombre');
let direccion = document.getElementById('direccion');
let telefono = document.getElementById('telefono');
let cartBody = document.getElementById('cartBody');

// nueva forma
document.addEventListener("DOMContentLoaded", function () {
    
    var stripe = Stripe("PUBLIC_KEY"); // 🔹 Cambia esto por tu clave pública
    var elements = stripe.elements();

    var card = elements.create("card");
    card.mount("#card-element");

    // Manejo de errores en tiempo real
    card.on("change", function (event) {
        var displayError = document.getElementById("card-errors");
        displayError.textContent = event.error ? event.error.message : "";
    });

    // Manejo del formulario
    var form = document.getElementById("payment-form");
    form.addEventListener("submit", function (event) {
        event.preventDefault();

        stripe.createPaymentMethod({
            type: "card",
            card: card
        }).then(function (result) {
            if (result.error) {
                document.getElementById("card-errors").textContent = result.error.message;
            } else {
                enviarAlServidor(result.paymentMethod.id);
            }
        });
    });

    function enviarAlServidor(paymentMethodId) {
        var pagoS = document.getElementById("total").textContent;
        var pagoStripe = parseFloat(pagoS) * 100; // 🔹 Convierte a número y multiplica por 100

        if(nombre.value == "" || direccion.value == "" || telefono.value == "" || cartBody.rows.lenght == 0){
            alert("Debes agregar tus datos y productos al carrito");
            return;
        }

        let btnPay = document.getElementById("btnPay");
                btnPay.textContent = "Procesando ..."; // 🔹 Cambia el texto del botón
                btnPay.disabled = true; // 🔹 Deshabilita el botón

        var formData = new FormData();
        formData.append("payment_method", paymentMethodId);
        formData.append("pagoStripe", pagoStripe);
        
        fetch("prcd/procesar_pago.php", {
            method: "POST",
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                document.getElementById("payment-result").textContent = "Pago exitoso";

                // aquí va el código para guardar datos en la db
                
                cerrarTransaccion();

                // aquí va el código para guardar datos en la db

            } else {
                document.getElementById("payment-result").textContent = "Error en el pago: " + data.message;
                
                // se agrega para saber cuando hay algún error en el proceso
                Swal.fire({
                    title: "¡Error!",
                    text: "Todos los campos son obligatorios",
                    icon: "error",
                    confirmButtonColor: "#3085d6" 
                });
                return;

            }
        })
        .catch(error => console.error("Error:", error));
    }
});

function cerrarTransaccion(){
    // sendCart.addEventListener("click", () => {
        // Obtener los valores de los campos
        let nombre = document.getElementById("nombre").value;
        let direccion = document.getElementById("direccion").value;
        let telefono = document.getElementById("telefono").value;
        let correo = document.getElementById("email").value;
        let tarjeta = document.getElementById("tarjeta").value;
        let estado =  document.getElementById("estado").value;
        
        $('#carrito').offcanvas('hide');
        
        // Validar que los campos no estén vacíos
        if(nombre == "" || direccion == "" || telefono == "" || correo == "" || tarjeta == ""){
            Swal.fire({
                title: "¡Error!",
                text: "Todos los campos son obligatorios",
                icon: "error",
                confirmButtonColor: "#3085d6" 
            });
            return;
        }
        console.log("Datos:" + cartBody.rows.length);
         if(cartBody.rows.length == "" || cartBody.rows.length == null || cartBody.rows.length == 0){
            Swal.fire({
                title: "El carrito está vacío",
                text: "Por favor, agregue productos al carrito",
                icon: "warning",
                showCancelButton: false,
                confirmButtonText: "Aceptar",
                confirmButtonColor: "#3085d6" // Azul
            });
            return;
        }

        // Crear un objeto con los datos
        const datos = {
            nombre: nombre,
            direccion: direccion,
            telefono: telefono,
            correo: correo,
            tarjeta: tarjeta,
            estado: estado
        };
    
        // Realizar el fetch con los datos
        fetch("prcd/save_cart2.php", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(datos)
        })
        .then(response => {
            if (!response.ok) {
                throw new Error("Error en la respuesta del servidor");
            }
            return response.json(); // Convertir la respuesta a JSON
        })
        .then(data => {
            // Manejar el mensaje de éxito
            if (data.success) {
                let id = data.identificador;
                agregarProductos(id);
                
                console.log("Datos registrados");
            } else {
                 // revisar si el carrito esta vacio
                
               
                console.log("Error al procesar solicitud");
            }
        })
        .catch(error => {
            // Manejar errores de red o del servidor
            console.error("Error:", error);
            
        });
    // });
}

function agregarProductos(id){
    console.log("Identificador recibido:", id); // Verificar si llega correctamente
        const cartData = [...cartBody.querySelectorAll("tr")].map(row => ({
            productId: row.dataset.productId,
            quantity: row.querySelector(".quantity").value,
            total: row.querySelector(".total").textContent,
            identificador: id
        }));

        if(cartData.length == 0){
            Swal.fire({
                title: "El carrito está vacío",
                text: "Por favor, agregue productos al carrito",
                icon: "warning",
                showCancelButton: false,
                confirmButtonText: "Aceptar",
                confirmButtonColor: "#3085d6" // Azul
            });
            return;
        }
        
        fetch("prcd/save_cart.php", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(cartData)
        })
        .then(response => response.json())
        .then(data => {
            Swal.fire({
                title: "Carrito agregado, se confirma la compra",
                text: "VAPE FACTORY",
                icon: "success",
                showCancelButton: false,
                confirmButtonText: "Aceptar",
                confirmButtonColor: "#3085d6" // Azul
            }).then((result) => {
                if (result.isConfirmed) {
                    // Acciones a realizar después de que el usuario confirme
                    document.getElementById("nombre").value = "";
                    document.getElementById("direccion").value = "";
                    document.getElementById("telefono").value = "";
                    document.getElementById("email").value = "";
                    document.getElementById("tarjeta").value = "";
                    document.getElementById("cartBody").innerHTML = "";
                    // filasTotales(0);

                    location.reload();
                }
            });
            
        }
            // alert(data.message || "Carrito enviado con éxito")
        )
        .catch(error => console.error("Error:", error));
}
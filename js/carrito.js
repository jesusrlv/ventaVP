function agregarCarrito(id,categoria){

    var sabor = document.getElementById("sabor"+id).value;

    // para las sumas
    var existencia = parseInt(document.getElementById('existencia' + id).innerText, 10) || 0;
    var agregarCarrito = parseInt(document.getElementById('agregarCarrito' + id).innerText, 10) || 0;

    console.log("Existencia: "+existencia + " " + agregarCarrito);
    if(agregarCarrito > existencia){
        Swal.fire({
            title: "¡Error!",
            text: "No hay suficiente producto para agregar al carrito",
            icon: "error",
            confirmButtonColor: "#3085d6" 
        });
        return;
    }
    

    if(sabor == ''){
        Swal.fire({
            title: "¡Error!",
            text: "Debe seleccionar un sabor",
            icon: "error",
            confirmButtonColor: "#3085d6" 
        });
        return;
    }
    $.ajax({
        url: 'prcd/datosProductos.php',
        type: 'POST',
        dataType: 'json',
        data: { 
            sabor: sabor,
            categoria: categoria
        },
        success: function(data){
            var datos = JSON.parse(JSON.stringify(data));
            var precio = datos.precio;
            var sabor = datos.sabor;
            var id = datos.id;
            var categoria = datos.categoria;

            carritoStore(id, sabor, precio, categoria);
        }
    });
}

document.addEventListener("DOMContentLoaded", () => {
    const cartBody = document.getElementById("cartBody");
    const sendCart = document.getElementById("sendCart");
    const totalDisplay = document.getElementById("total");

    let products = [];
    let sumar = 0;

    window.carritoStore = (id, detalle, precio, categoria) => {
        const offcanvasElement = document.getElementById('carrito');
        const bsOffcanvas = new bootstrap.Offcanvas(offcanvasElement);
        Swal.fire({
            title: "Producto agregado al carrito",
            text: "Agregado correctamente",
            icon: "success",
            showCancelButton: false,
            confirmButtonText: "Aceptar",
            cancelButtonText: "Cancelar",
            confirmButtonColor: "#3085d6", // Azul
            cancelButtonColor: "#d33" // Rojo
        }).then((result) => {
            if (result.isConfirmed) {
                
                // bloquearOptions(id);
                bsOffcanvas.show();
                tablaGrid(id, detalle, precio, categoria);
                
            } else {
                console.log("El usuario canceló la acción");
            }
        });
    };

    const tablaGrid = (id1, detalle, precio, categoria1) => {
        sumar = sumar + 1;
        products.push({ id: id1, name: detalle, price: precio, categoria: categoria1 });
        
        const row = document.createElement("tr");
        row.dataset.productId = id1;

        row.innerHTML = `
            <td class="fw-bold small">${detalle}</td>
            <td class="text-center" style="width: 80px;">
                <input type="text" value="1" min="1" class="form-control quantity text-center" style="width: 100%;" disabled>
            </td>
            <td class="text-center small">${precio}</td>
            <td class="text-center small total" hidden>${precio}</td>
            <td class="text-center">
                <button class="btn btn-danger btn-sm remove" onclick="regresarOptions(${categoria1}, '${detalle.replace(/'/g, "\\'")}')">
                        <i class="bi bi-trash"></i>
                    </button>
            </td>
        `;
        
        cartBody.appendChild(row);
        calculateTotal();
        filasTotales(sumar);
        
    };

    const filasTotales  = (sumaT) =>{
        document.getElementById('sumaCarrito').innerText = sumaT;
    };

    const calculateTotal = () => {
        const totals = [...cartBody.querySelectorAll(".total")].map(cell => parseFloat(cell.textContent) || 0);
        const total = totals.reduce((sum, value) => sum + value, 0);
        totalDisplay.textContent = `${total.toFixed(2)}`;
        sendCart.disabled = total === 0;
       
    };

    cartBody.addEventListener("input", (e) => {
        if (e.target.classList.contains("quantity")) {
            const row = e.target.closest("tr");
            const price = parseFloat(row.children[2].textContent) || 0;
            const quantity = parseInt(e.target.value) || 0;
            const totalCell = row.querySelector(".total");

            totalCell.textContent = (price * quantity).toFixed(2);
            calculateTotal();
        }
    });

    cartBody.addEventListener("click", (e) => {
        const removeButton = e.target.closest(".remove");
        if (removeButton) {
            removeButton.closest("tr").remove();
            sumar = sumar - 1;

            calculateTotal();
            filasTotales(sumar);
        }
    });

    // sendCart.addEventListener("click", () => {
    
    // aquí iba el código de guardar datos
    const agregarProductos = (id) => {
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
                    document.getElementById("cartBody").innerHTML = "";
                    filasTotales(0);
                }
            });
            
        }
            // alert(data.message || "Carrito enviado con éxito")
        )
        .catch(error => console.error("Error:", error));
    }
    // aquí iba el código de guardar datos
    // aquí iba el código de guardar datos
    sendCart.addEventListener("click", () => {
        // Obtener los valores de los campos
        let nombre = document.getElementById("nombre").value;
        let direccion = document.getElementById("direccion").value;
        let telefono = document.getElementById("telefono").value;
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
    // };
    });
    // aquí iba el código de guardar datos
});

document.addEventListener("DOMContentLoaded", () => {
    const cartBody = document.getElementById("cartBody");
    const sendCart = document.getElementById("sendCart");
    const totalDisplay = document.getElementById("total");
    let products = [];
    let sumar = 0;

    window.carritoStore = (id, detalle, precio) => {
        const offcanvasElement = document.getElementById('carrito');
        const bsOffcanvas = new bootstrap.Offcanvas(offcanvasElement);
        Swal.fire({
            title: "¿Deseas agregar este producto al carrito?",
            text: "Confirma tu acción",
            icon: "question",
            showCancelButton: true,
            confirmButtonText: "Sí, agregar",
            cancelButtonText: "Cancelar",
            confirmButtonColor: "#3085d6", // Azul
            cancelButtonColor: "#d33" // Rojo
        }).then((result) => {
            if (result.isConfirmed) {
                
                bsOffcanvas.show();
                tablaGrid(id, detalle, precio);
                
            } else {
                console.log("El usuario canceló la acción");
            }
        });
    };

    const tablaGrid = (id1, detalle, precio) => {
        sumar = sumar + 1;
        products.push({ id: id1, name: detalle, price: precio });
        
        const row = document.createElement("tr");
        row.dataset.productId = id1;

        row.innerHTML = `
            <td class="fw-bold small">${detalle}</td>
            <td><input type="number" value="1" min="1" class="form-control quantity text-center"></td>
            <td class="text-center small">${precio.toFixed(2)}</td>
            <td class="text-center small total">${precio.toFixed(2)}</td>
            <td><button class="btn btn-danger btn-sm remove"><i class="bi bi-trash"></i></button></td>
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
    const agregarProductos = (id) => {
        console.log("Identificador recibido:", id); // Verificar si llega correctamente
        const cartData = [...cartBody.querySelectorAll("tr")].map(row => ({
            productId: row.dataset.productId,
            quantity: row.querySelector(".quantity").value,
            total: row.querySelector(".total").textContent,
            identificador: id
        }));

        fetch("prcd/save_cart.php", {
            method: "POST",
            headers: { "Content-Type": "application/json" },
            body: JSON.stringify(cartData)
        })
        .then(response => response.json())
        .then(data => {
            Swal.fire({
                title: "Carrito agregado, se confirma la compra",
                text: "SUPERISSSTE",
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
                    filasTotales(0);
                }
            });
            
        }
            // alert(data.message || "Carrito enviado con éxito")
        )
        .catch(error => console.error("Error:", error));
    // });
    }
    sendCart.addEventListener("click", () => {
    // const datosGenerales = () => {
        // Obtener los valores de los campos
        let nombre = document.getElementById("nombre").value;
        let direccion = document.getElementById("direccion").value;
        let telefono = document.getElementById("telefono").value;
        let correo = document.getElementById("email").value;
        let tarjeta = document.getElementById("tarjeta").value;
        $('#carrito').offcanvas('hide');
        
        // Crear un objeto con los datos
        const datos = {
            nombre: nombre,
            direccion: direccion,
            telefono: telefono,
            correo: correo,
            tarjeta: tarjeta
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
               
                console.log("Error al procesar solicitud");
            }
        })
        .catch(error => {
            // Manejar errores de red o del servidor
            console.error("Error:", error);
            
        });
    // };
    });
});

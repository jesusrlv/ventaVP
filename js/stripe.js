
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
        var formData = new FormData();
        formData.append("payment_method", paymentMethodId);

        fetch("prcd/procesar_pago.php", {
            method: "POST",
            body: formData
        })
        .then(response => response.json())
        .then(data => {
            if (data.success) {
                document.getElementById("payment-result").textContent = "Pago exitoso";
            } else {
                document.getElementById("payment-result").textContent = "Error en el pago: " + data.message;
            }
        })
        .catch(error => console.error("Error:", error));
    }
});


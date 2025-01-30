<?php
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $stripeSecretKey = "SECRET_KEY"; // 🔹 Reemplázala con tu clave secreta de Stripe
    $paymentMethod = $_POST["payment_method"];
    $monto = $_POST['pagoStripe'];
    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, "https://api.stripe.com/v1/payment_intents");
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
    curl_setopt($ch, CURLOPT_POST, 1);
    curl_setopt($ch, CURLOPT_POSTFIELDS, http_build_query([
        "amount" => $monto, // 🔹 Monto en centavos (50.00 MXN)
        "currency" => "mxn", // 🔹 Moneda en pesos mexicanos
        "payment_method" => $paymentMethod,
        "confirm" => "true"
    ]));
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        "Authorization: Bearer " . $stripeSecretKey
    ]);

    $result = curl_exec($ch);
    curl_close($ch);

    $response = json_decode($result, true);

    if (isset($response["id"])) {
        echo json_encode(["success" => true, "message" => "Pago exitoso"]);
    } else {
        echo json_encode(["success" => false, "message" => "Error en el pago"]);
    }
}
?>


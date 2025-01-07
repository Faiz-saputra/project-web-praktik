<?php
    require "koneksi.php";
    require_once dirname(__FILE__) . '/vendor/midtrans/midtrans-php/Midtrans.php';

    $json = file_get_contents('php://input');
    $response = json_decode($json, true);
    $order_id =  $response['order_id'];
    $data = array();
    $query = mysqli_query($db, "SELECT * FROM jemput_sampah WHERE order_id = '$order_id'");
    while ($row = mysqli_fetch_assoc($query)) {
        $data = $row;
    }
    \Midtrans\Config::$serverKey = 'SB-Mid-server-MvphB7Ik9N03aqqwJ3hD2kFZ';
    \Midtrans\Config::$isProduction = false;
    \Midtrans\Config::$isSanitized = true;
    \Midtrans\Config::$is3ds = true;

    $params = array(
        'transaction_details' => array(
            'order_id' => $data['order_id'],
            'gross_amount' => $data['harga'],
        ),
    );

    $snapToken = \Midtrans\Snap::getSnapToken($params);
    
    if (!empty($snapToken)) {
        mysqli_query($db, "UPDATE jemput_sampah SET token = '$snapToken' WHERE order_id = '$order_id'");
        echo json_encode(['success'=> true,'token'=>$snapToken]);
        exit();
    } else {
        echo json_encode(['success'=>false,'message'=>'Failed to get Snap Token']);
        exit();
    }

?>
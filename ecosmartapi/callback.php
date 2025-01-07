<?php
include 'koneksi.php';

require_once dirname(__FILE__) . '/vendor/midtrans/midtrans-php/Midtrans.php';
\Midtrans\Config::$isProduction = false;
\Midtrans\Config::$serverKey = 'SB-Mid-server-MvphB7Ik9N03aqqwJ3hD2kFZ';
$notif = new \Midtrans\Notification();

$transaction = $notif->transaction_status;
$type = $notif->payment_type;
$order_id = $notif->order_id;
$fraud = $notif->fraud_status;

if ($transaction == 'capture') {
  if ($type == 'credit_card'){
    if($fraud == 'accept'){
      mysqli_query($db, "UPDATE jemput_sampah SET status='success',metode_pembayaran='$type' WHERE order_id='$order_id'");
      }
    }
  }
else if ($transaction == 'settlement'){
    mysqli_query($db, "UPDATE jemput_sampah SET status='success',metode_pembayaran='$type' WHERE order_id='$order_id'");
  }
  else if($transaction == 'pending'){
    mysqli_query($db, "UPDATE jemput_sampah SET status='pending',metode_pembayaran='$type' WHERE order_id='$order_id'");
  }
  else if ($transaction == 'deny') {
    mysqli_query($db, "UPDATE jemput_sampah SET status='denied',metode_pembayaran='$type' WHERE order_id='$order_id'");
  }
  else if ($transaction == 'expire') {
    mysqli_query($db, "UPDATE jemput_sampah SET status='expired',metode_pembayaran='$type' WHERE order_id='$order_id'");
  }
  else if ($transaction == 'cancel') {
    mysqli_query($db, "UPDATE jemput_sampah SET status='canceled',metode_pembayaran='$type' WHERE order_id='$order_id'");
}
?>
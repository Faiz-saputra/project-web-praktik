<?php
require "koneksi.php";

// Ambil data dari POST
$json = file_get_contents('php://input');
$response = json_decode($json, true);
$data =  $response['data'];

// Pastikan data di-decode dengan benar
if (!$data) {
    echo json_encode(array("status" => "error", "message" => "Invalid input data"));
    exit();
}

$query = "
    INSERT INTO jemput_sampah (
        order_id, nama,  alamat, harga, kategori, berat, catatan,tanggal) VALUES (?, ?, ?, ?, ?, ?, ?, ?)
";

$stmt = $db->prepare($query);

// Bind parameter
$stmt->bind_param(
    "sssisiss", 
    $data['order_id'], 
    $data['nama'], 
    $data['alamat'], 
    $data['harga'], 
    $data['kategori'], 
    $data['berat'], 
    $data['catatan'],   
    $data['tanggal'],
);

// Eksekusi query
if ($stmt->execute()) {
    echo json_encode(array("status" => "success"));
} else {
    echo json_encode(array("status" => "error", "message" => $stmt->error));
}

$stmt->close();
exit();
?>
// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';


class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Pembayaran"),
        centerTitle: true,
        backgroundColor: const Color(0xFF5D9CEC),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFF6F9FE), Color(0xFFEAF0F8)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // Section: Summary
            buildPaymentSummary(),
            const SizedBox(height: 20),

            // Section: Payment Methods
            const Text(
              "Metode Pembayaran",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5D9CEC),
              ),
            ),
            const SizedBox(height: 10),
            buildPaymentMethod(
              context,
              title: "Tunai / COD",
              icon: Icons.money,
              onTap: () {
                // Handle payment method selection
              },
            ),
            const SizedBox(height: 10),
            buildPaymentMethod(
              context,
              title: "Kartu Kredit/Debit",
              icon: Icons.credit_card,
              onTap: () {
                // Handle payment method selection
              },
            ),
            buildPaymentMethod(
              context,
              title: "Transfer Bank",
              icon: Icons.account_balance,
              onTap: () {
                // Handle payment method selection
              },
            ),
            buildPaymentMethod(
              context,
              title: "E-Wallet (GoPay, OVO)",
              icon: Icons.phone_android,
              onTap: () {
                // Handle payment method selection
              },
            ),
            buildPaymentMethod(
              context,
              title: "Virtual Account",
              icon: Icons.account_balance_wallet,
              onTap: () {
                // Handle payment method selection
              },
            ),
            const SizedBox(height: 30),

            // Button: Confirm Payment
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: const Color(0xFF5D9CEC),
              ),
              onPressed: () {
                // Handle payment confirmation
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text("Pembayaran Berhasil"),
                    content:
                        const Text("Terima kasih telah melakukan pembayaran."),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/home');
                        },
                        child: const Text("OK"),
                      ),
                    ],
                  ),
                );
              },
              child: const Text(
                "Konfirmasi Pembayaran",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPaymentSummary() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: Offset(4, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Ringkasan Pembayaran",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Harga sampah"),
              Text("Rp XXX.XXX", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Biaya Penjemputan"),
              Text("Rp X.XXX", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          Divider(height: 20, thickness: 1, color: Colors.grey),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Total",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "Rp 155,000",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF5D9CEC)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPaymentMethod(BuildContext context,
      {required String title,
      required IconData icon,
      required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5,
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 30, color: const Color(0xFF5D9CEC)),
            
            const SizedBox(width: 15),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
            ),
            Spacer(),
            Icon(Icons.check, size: 20, color: Colors.black87),
          ],
        ),
      ),
    );
  }
}

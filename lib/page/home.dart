
import 'package:flutter/material.dart';
import 'package:flutter_midtrans_example/models/database.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  @override
  WidgetHome createState() => WidgetHome();
}

class WidgetHome extends State<Home> {
  final Database db = Database();
  String name = '';
  @override
  void initState() {
    super.initState();
    userShow();
  }
  Future<void> userShow() async {
    var users = await db.findAll("users");
    debugPrint('Users: $users');
    debugPrint('Current User Email: ${db.user!.email}');
    var currentUser = users.firstWhere(
      (user) => user['email'] == db.user!.email,
      orElse: () => <String, dynamic>{}, // Default jika tidak ditemukan
    );
    if (currentUser.isNotEmpty) {
      setState(() {
        name = currentUser['fullname'] ?? "fullname available";
      });
    } else {
      setState(() {
        name = "User not found";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 70,
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Welcome,",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
                Text(name,style: const TextStyle(color: Colors.white, fontSize: 16,fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/profile');
              },
              icon: const Icon(Icons.person),
              color: Colors.white,
              iconSize: 30,
            ),
          ],
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF56AB2F), Color(0xFFA8E063)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF00C9FF), Color(0xFF92FE9D)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(10),
          children: [
            Container(
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
              child: const Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Tukarkan sampah plastikmu sekarang!",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Aplikasi bank sampah adalah solusi anda untuk menyelesaikan masalah sosial tentang kebersihan lingkungan.",
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Image(
                    image: AssetImage("images/Recylle.png"),
                    width: 120,
                    height: 120,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            buildMenuButton(
              context,
              title: "Informasi Sampah",
              iconPath: "images/SampahIlust.png",
              onPressed: () => Navigator.pushNamed(context, '/infoSmph'),
            ),
            buildMenuButton(
              context,
              title: "Jemput Sampah",
              iconPath: "images/Truck.png",
              onPressed: () => Navigator.pushNamed(context, '/jemput'),
            ),
            buildMenuButton(
              context,
              title: "Saldo",
              iconPath: "images/dompet.png",
              onPressed: () => Navigator.pushNamed(context, '/saldo'),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuButton(BuildContext context,
      {required String title,
      required String iconPath,
      required VoidCallback onPressed}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.all(15),
          backgroundColor: Colors.white,
          shadowColor: Colors.black12,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: onPressed,
        child: Row(
          children: [
            Image.asset(
              iconPath,
              width: 50,
              height: 50,
            ),
            const SizedBox(width: 20),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

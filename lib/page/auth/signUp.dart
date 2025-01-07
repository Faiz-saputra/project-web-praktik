import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:math';
import '../../models/database.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  RegisterPage createState() => RegisterPage();
}

class RegisterPage extends State<Register> {
  final Database db = Database();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpVerify = TextEditingController();

  var otpAuth = 0;
  String? alert;

  verifyOtp(context) async {
    var min = 100000;
    var max = 999999;
    var otp = min + Random().nextInt(max - min + 1);

    setState(() {
      otpAuth = otp;
    });

    var message = "Your otp is $otp";

    var response = await http.get(Uri.parse(
        "https://api.fonnte.com/send?token=T2f676XnnpDVo2kzWAkS&target=${phoneController.text}&message=$message"));

    var data = jsonDecode(response.body);

    if (data['status'] == true && response.statusCode == 200) {
      return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Center(child: Text("Verfikasi Otp")),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: otpVerify,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: 'Otp',
                      hintText: 'Masukan Otp'),
                ),
              ],
            ),
            actions: [
              Center(
                child: TextButton(
                  onPressed: () {
                    signUp(context);
                  },
                  child: const Text("Verifikasi"),
                ),
              ),
            ],
          );
        },
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Gagal mendaftar, silahkan cek kembali')),
      );
    }
  }

  Future<void> signUp(context) async {
    try {
      if (otpVerify.text == otpAuth.toString()) {
        UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        String uid = userCredential.user!.uid;
        db.addDataWithDoc('users', uid, {
          'fullname': nameController.text.trim(),
          'email': emailController.text.trim(),
          'phone': phoneController.text.trim(),
          'createdAt': FieldValue.serverTimestamp(),
        });

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Berhasil Mendaftar')),
        );
        Navigator.pushNamed(context, '/login');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Otp tidak valid')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          width: 380,
          height: 650,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [
              BoxShadow(
                color: Colors.black26, 
                blurRadius: 100,
                offset:
                    Offset(4, 4),
              ),
            ],
          ),
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
          child:
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const SizedBox(height: 10),
            Image.asset(
              'images/signup.jpg',
              height: 180,
              width: 180,
            ),
            const Text(
              'Create Your Account',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("have an account"),
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "/login");
                    },
                    child: const Text(
                      "Sign In",
                      style: TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            if (alert != null)
              Text(
                alert!,
                style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontStyle: FontStyle.normal),
              ),
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(
                  icon: Icon(Icons.account_circle),
                  labelText: 'Full Name',
                  hintText: 'masukan username'),
            ),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  icon: Icon(Icons.email),
                  labelText: 'Email',
                  hintText: 'masukan Email'),
              validator : (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email tidak boleh kosong';
                  } else if (!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+').hasMatch(value)) {
                    return 'Masukkan email yang valid';
                  }
                  return null;
                },
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                  icon: Icon(Icons.lock),
                  labelText: 'Password',
                  hintText: 'masukan password'),
              validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password tidak boleh kosong';
                  } else if (value.length < 6) {
                    return 'Password minimal 6 karakter';
                  }
                  return null;
              },
            ),
            TextFormField(
              controller: phoneController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                  icon: Icon(Icons.phone),
                  labelText: 'No.Tlpn',
                  hintText: 'masukan no telepon'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                verifyOtp(context);
              },
              style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.fromLTRB(50, 0, 50, 0),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white),
              child: const Text("Register"),
            ),
          ]),
        ),
      ),
    );
  }
}

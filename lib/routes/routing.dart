
import 'package:flutter/material.dart';
import 'package:flutter_midtrans_example/page/auth/signIn.dart';
import 'package:flutter_midtrans_example/page/auth/signUp.dart';
import 'package:flutter_midtrans_example/page/home.dart';
import 'package:flutter_midtrans_example/page/infosampah.dart';
import 'package:flutter_midtrans_example/page/jemput.dart';
import 'package:flutter_midtrans_example/page/payment.dart';
import 'package:flutter_midtrans_example/page/saldo.dart';
import 'package:flutter_midtrans_example/page/setting/account_seting.dart';
import 'package:flutter_midtrans_example/page/setting/set_name.dart';
import 'package:flutter_midtrans_example/page/setting/set_tlp.dart';
import 'package:flutter_midtrans_example/splash.dart';

class Routing extends StatelessWidget {
  const Routing({super.key});

    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/splash',
      routes: {
        '/splash' : (context) => const SplashScren(),
        '/register': (context) => const Register(),
        '/login': (context) => const Login(),
        '/home': (context) => const Home(),
        '/infoSmph': (context) => const InfoSampah(),
        '/saldo': (context) => const BalancePage(),
        '/jemput': (context) => const Jemput(),
        '/payment': (context) => const PaymentPage(),
        '/profile' : (context) => const AccountSeting(),
        '/setnama' : (context) => const ChangeNamePage(),
        '/set_tlp' :(context) =>  const ChangePhoneNumberPage(),
      },
    );
  }
}
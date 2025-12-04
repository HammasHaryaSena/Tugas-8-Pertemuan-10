import 'package:flutter/material.dart';
import 'ui/registrasi_page.dart';
import 'ui/login_page.dart';
import 'ui/produk_detail.dart';
import 'ui/produk_form.dart';
import 'model/produk.dart';
void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toko Kita',
      debugShowCheckedModeBanner: false,
      home: ProdukForm(),
    );
  }
}

import 'package:flutter/material.dart';
// Asumsi path ini benar, menghubungkan ke file registrasi yang sudah Anda buat
import 'package:tokokita/ui/registrasi_page.dart'; 

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  final _emailTextboxController = TextEditingController();
  final _passwordTextboxController = TextEditingController();

  // Method untuk menangani proses Login
  Future<void> _doLogin() async {
    // 1. Validasi form
    if (_formKey.currentState!.validate()) {
      
      // Mengaktifkan state loading
      setState(() { 
        _isLoading = true; 
      });

      // --- TEMPATKAN LOGIKA PANGGILAN API LOGIN CODEIGNITER DI SINI ---
      // Ambil nilai: 
      // final email = _emailTextboxController.text;
      // final password = _passwordTextboxController.text;
      
      // SIMULASI PANGGILAN API (ganti dengan kode http post ke endpoint Login Anda)
      await Future.delayed(const Duration(seconds: 2)); 
      
      // Menonaktifkan state loading
      setState(() {
        _isLoading = false; 
      });

      // --- LOGIKA RESPON API ---
      // Asumsi login sukses:
      if (_emailTextboxController.text == "user@test.com" && _passwordTextboxController.text == "password") {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login Berhasil!"),
            backgroundColor: Colors.green,
          ),
        );
        // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HalamanUtama())); 
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Email atau Password salah."),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Icon(Icons.lock, size: 80, color: Colors.blueAccent),
                const SizedBox(height: 20),
                _emailTextField(),
                _passwordTextField(),
                const SizedBox(height: 20),
                _buttonLogin(),
                const SizedBox(height: 30),
                _menuRegistrasi()
              ],
            ),
          ),
        ),
      ),
    );
  }
  
  // Membuat Textbox email
  Widget _emailTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: const InputDecoration(labelText: "Email"),
        keyboardType: TextInputType.emailAddress,
        controller: _emailTextboxController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Email harus diisi';
          }
          return null;
        },
      ),
    );
  }
  
  // Membuat Textbox password
  Widget _passwordTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        decoration: const InputDecoration(labelText: "Password"),
        keyboardType: TextInputType.text,
        obscureText: true,
        controller: _passwordTextboxController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Password harus diisi";
          }
          return null;
        },
      ),
    );
  }
  
  // Membuat Tombol Login
  Widget _buttonLogin() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        // Tombol akan memanggil _doLogin dan dinonaktifkan saat loading
        onPressed: _isLoading ? null : _doLogin,
        child: _isLoading
            ? const SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : const Text(
                "Login",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
      ),
    );
  }
  
  // Membuat menu untuk membuka halaman registrasi
  Widget _menuRegistrasi() {
    return Center(
      child: InkWell(
        child: const Text(
          "Registrasi",
          style: TextStyle(color: Colors.blue, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        onTap: () {
          // Navigasi ke halaman registrasi
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const RegistrasiPage()));
        },
      ),
    );
  }
}
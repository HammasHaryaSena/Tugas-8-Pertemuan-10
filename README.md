# Tugas-8-Pertemuan-10

**Nama**       : Hammas Harya Sena 
**NIM**        : H1D023062  
**Shift Baru** : A  
**Shift Lama** : E  

---

## Demo Aplikasi

<img width="754" height="933" alt="Image" src="https://github.com/user-attachments/assets/35e7260d-01f0-4ca4-a858-4c2abf0cb72e" />
<img width="757" height="968" alt="Image" src="https://github.com/user-attachments/assets/38498e84-9110-472b-8179-80c49094eb5b" />
<img width="765" height="972" alt="Image" src="https://github.com/user-attachments/assets/57b29f21-bd3c-4e8e-88b6-228ba3b59642" />

---

## Penjelasan

1. Model

- produk.dart

Model Produk adalah representasi data untuk satu produk, berisi informasi seperti id, kodeProduk, namaProduk, dan hargaProduk, serta menyediakan metode fromJson dan toJson untuk konversi data ke dan dari format JSON.

- login.dart

Model Login digunakan sebagai representasi data hasil autentikasi dari API backend. Model ini menampung nilai seperti kode status (code), status login (status), token autentikasi (token), serta data pengguna berupa userID dan userEmail. Pada bagian fromJson, model melakukan pengecekan: jika kode respons adalah 200, maka berarti login berhasil dan objek Login diisi dengan token serta data user.

- registrasi.dart

Model Registrasi digunakan untuk menampung respons dari proses pendaftaran, berisi kode respons, status keberhasilan, dan pesan dari server.

2. UI

- produk_form.dart

Halaman ProdukForm berfungsi sebagai form untuk menambah atau mengedit data produk. Jika produk dikirim ke halaman ini, field akan terisi otomatis sehingga pengguna bisa memperbarui data; jika tidak, form digunakan untuk menambah produk baru.

- produk_detail.dart

ProdukDetail adalah halaman yang menampilkan informasi lengkap mengenai satu produk, seperti kode, nama, dan harga, serta menyediakan tombol untuk mengedit atau menghapus produk.

- login_page.dart

Halaman LoginPage adalah antarmuka pengguna untuk proses masuk ke aplikasi. Halaman ini terdiri dari form berisi input email dan password, yang validasinya dilakukan sebelum proses login dijalankan. Ketika tombol Login ditekan, aplikasi akan menampilkan indikator loading lalu memproses autentikasi, yang dalam struktur ini masih disimulasikan menggunakan delay. Hasilnya ditampilkan melalui SnackBar, menandakan keberhasilan atau kegagalan login

- regstrasi_page.dart

RegistrasiPage adalah halaman form tempat pengguna memasukkan nama, email, password, dan konfirmasi password, lengkap dengan validasi.

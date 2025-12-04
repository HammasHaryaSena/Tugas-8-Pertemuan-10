import 'package:flutter/material.dart';
import 'package:tokokita/model/produk.dart';
import 'package:tokokita/ui/produk_form.dart';

class ProdukDetail extends StatefulWidget {
  final Produk produk;

  const ProdukDetail({Key? key, required this.produk}) : super(key: key);

  @override
  State<ProdukDetail> createState() => _ProdukDetailState();
}

class _ProdukDetailState extends State<ProdukDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Produk Hammas")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Kode : ${widget.produk.kodeProduk}",
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),

            Text("Nama : ${widget.produk.namaProduk}",
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),

            Text("Harga : Rp ${widget.produk.hargaProduk}",
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 30),

            Row(
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ProdukForm(produk: widget.produk),
                      ),
                    );
                  },
                  child: const Text("EDIT"),
                ),
                const SizedBox(width: 16),
                OutlinedButton(
                  onPressed: () => _confirmHapus(),
                  child: const Text("DELETE"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void _confirmHapus() {
    showDialog(
      context: context,
      builder: (c) => AlertDialog(
        title: const Text("Konfirmasi"),
        content: const Text("Yakin ingin menghapus produk ini?"),
        actions: [
          TextButton(
            onPressed: () {
              // Karena ID string → kirim apa adanya
              print("Hapus produk ID = ${widget.produk.id}");

              Navigator.pop(context); // tutup dialog
              Navigator.pop(context); // kembali
            },
            child: const Text("Ya"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Batal"),
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tokokita/model/produk.dart';

class ProdukForm extends StatefulWidget {
  final Produk? produk;

  const ProdukForm({Key? key, this.produk}) : super(key: key);

  @override
  State<ProdukForm> createState() => _ProdukFormState();
}

class _ProdukFormState extends State<ProdukForm> {
  final _formKey = GlobalKey<FormState>();

  // Controller disesuaikan dengan model yang pakai String/dynamic
  final kodeController = TextEditingController();
  final namaController = TextEditingController();
  final hargaController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Jika mode edit
    if (widget.produk != null) {
      kodeController.text = widget.produk!.kodeProduk ?? "";
      namaController.text = widget.produk!.namaProduk ?? "";
      hargaController.text = widget.produk!.hargaProduk.toString();
    }
  }

  @override
  void dispose() {
    kodeController.dispose();
    namaController.dispose();
    hargaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.produk == null ? "Tambah Produk Hammas" : "Edit Produk Hammas"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: kodeController,
                decoration: const InputDecoration(
                  labelText: "Kode Produk Hammas",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Kode produk wajib diisi" : null,
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: namaController,
                decoration: const InputDecoration(
                  labelText: "Nama Produk Hammas",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Nama produk wajib diisi" : null,
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: hargaController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Harga Produk Hammas",
                  border: OutlineInputBorder(),
                ),
                validator: (value) =>
                    value!.isEmpty ? "Harga wajib diisi" : null,
              ),
              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Buat object produk dari input
                    Produk newProduct = Produk(
                      id: widget.produk?.id, // tetap string
                      kodeProduk: kodeController.text,
                      namaProduk: namaController.text,
                      hargaProduk: hargaController.text, // tetap String
                    );

                    Navigator.pop(context, newProduct);
                  }
                },
                child: Text(widget.produk == null ? "SIMPAN" : "UPDATE"),
              )
            ],
          ),
        ),
      ),
    );
  }
}

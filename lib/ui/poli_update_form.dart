import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_detail.dart';

class PoliUpdateForm extends StatefulWidget {
  final Poli poli;
  const PoliUpdateForm({Key? key, required this.poli}) : super(key: key);

  @override
  _PoliUpdateFormState createState() => _PoliUpdateFormState();
}

class _PoliUpdateFormState extends State<PoliUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _namaPoliCtrl;
  late TextEditingController _namaDokterCtrl;

  @override
  void initState() {
    super.initState();
    _namaPoliCtrl = TextEditingController(text: widget.poli.namaPoli);
    _namaDokterCtrl = TextEditingController(text: widget.poli.namaDokter);
  }

  @override
  void dispose() {
    _namaPoliCtrl.dispose();
    _namaDokterCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Poli")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNamaPoli(),
              _fieldNamaDokter(),
              const SizedBox(height: 20),
              _tombolSimpan(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _fieldNamaPoli() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nama Poli"),
      controller: _namaPoliCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Nama Poli tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _fieldNamaDokter() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Nama Dokter"),
      controller: _namaDokterCtrl,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Nama Dokter tidak boleh kosong';
        }
        return null;
      },
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // Update data pada objek yang sama
          widget.poli.namaPoli = _namaPoliCtrl.text;
          widget.poli.namaDokter = _namaDokterCtrl.text;

          // Kembali ke halaman sebelumnya dengan membawa data yang sudah diperbarui
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => PoliDetail(poli: widget.poli),
            ),
          );
        }
      },
      child: const Text("Simpan Perubahan"),
    );
  }
}

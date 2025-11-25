import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_detail.dart';
import '../service/poli_service.dart';
//file poliform12a

class PoliForm extends StatefulWidget {
  const PoliForm({super.key});

  @override
  State<PoliForm> createState() => _PoliFormState();
}

class _PoliFormState extends State<PoliForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();
  final _namaPoli2Ctrl = TextEditingController();
  final _namaPoli3Ctrl = TextEditingController();
  final _namaPoli4Ctrl = TextEditingController();
  final _namaPoli5Ctrl = TextEditingController();
  final _namaPoli6Ctrl = TextEditingController();
  final _namaPoli7Ctrl = TextEditingController();
  final _namaDokterCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Input Staf Administrasi"),
        backgroundColor: Color.fromRGBO(126, 188, 150, 0.612),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNamaPoli(),
              _fieldNamaDokter(),
              _fieldNama(),
              _fieldNama2(),
              _fieldNama3(),
              _fieldNama4(),
              _fieldNama6(),
              SizedBox(height: 20),
              _tombolSimpan()
            ],
          ),
        ),
      ),
    );
  }

  _fieldNamaPoli() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Staf"),
      controller: _namaPoliCtrl,
    );
  }

  _fieldNamaDokter() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Dokter"),
      controller: _namaDokterCtrl,
    );
  }

  _fieldNama() {
    return TextField(
      decoration: const InputDecoration(labelText: "NIP"),
      controller: _namaPoliCtrl,
    );
  }

  _fieldNama2() {
    final List<String> _nipList = ['Laki-laki', 'Perempuan'];

    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: "Jenis Kelamin",
        border: OutlineInputBorder(),
      ),
      value: _namaPoli2Ctrl.text.isNotEmpty ? _namaPoli2Ctrl.text : null,
      items: _nipList.map((nip) {
        return DropdownMenuItem<String>(
          value: nip,
          child: Text(nip),
        );
      }).toList(),
      onChanged: (value) {
        _namaPoli2Ctrl.text = value!;
      },
    );
  }

  _fieldNama3() {
    final List<String> _nipList = ['Tetap', 'Kontrak'];

    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: "Status",
        border: OutlineInputBorder(),
      ),
      value: _namaPoliCtrl.text.isNotEmpty ? _namaPoliCtrl.text : null,
      items: _nipList.map((nip) {
        return DropdownMenuItem<String>(
          value: nip,
          child: Text(nip),
        );
      }).toList(),
      onChanged: (value) {
        _namaPoliCtrl.text = value!;
      },
    );
  }

  _fieldNama4() {
    return TextField(
      decoration: const InputDecoration(labelText: "Tahun Masuk"),
      controller: _namaPoliCtrl,
    );
  }

  _fieldNama6() {
    return TextField(
      decoration: const InputDecoration(labelText: "Usia"),
      controller: _namaPoliCtrl,
    );
  }

  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () async {
          Poli poli = new Poli(
              namaPoli: _namaPoliCtrl.text, namaDokter: _namaDokterCtrl.text);
          await PoliService().simpan(poli).then((value) {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => PoliDetail(poli: value)));
          });
        },
        child: const Text("Simpan"));
  }
}

class _namaPoliCtrl2 {}
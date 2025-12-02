import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_detail.dart';
import '../service/poli_service.dart';

//file poliupdateform13a

class PoliUpdateForm extends StatefulWidget {
  final Poli poli;

  const PoliUpdateForm({super.key, required this.poli});

  @override
  State<PoliUpdateForm> createState() => _PoliUpdateFormState();
}

class _PoliUpdateFormState extends State<PoliUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();
  final _namaDokterCtrl = TextEditingController();

  Future<Poli> getData() async {
    Poli data = await PoliService().getById(widget.poli.id.toString());
    setState(() {
      _namaPoliCtrl.text = data.namaPoli ?? "";
      _namaDokterCtrl.text = data.namaDokter ?? "";
    });
    return data;
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ubah Poli"),
        backgroundColor: const Color.fromRGBO(5, 5, 237, 0.612),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNamaPoli(),
              const SizedBox(height: 20),
              _tombolSimpan()
            ],
          ),
        ),
      ),
    );
  }

  Widget _fieldNamaPoli() {
    return TextField(
      decoration: const InputDecoration(labelText: "Nama Poli"),
      controller: _namaPoliCtrl,
    );
  }

  Widget _tombolSimpan() {
    return ElevatedButton(
      onPressed: () async {
        Poli poli = Poli(
          namaPoli: _namaPoliCtrl.text,
          namaDokter: _namaDokterCtrl.text,
        );

        String id = widget.poli.id.toString();

        var value = await PoliService().ubah(poli, id);

        // Cegah error use_build_context_synchronously
        if (!mounted) return;

        Navigator.pop(context);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => PoliDetail(poli: value),
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(177, 15, 244, 34),
      ),
      child: const Text("Simpan Perubahan"),
    );
  }
}

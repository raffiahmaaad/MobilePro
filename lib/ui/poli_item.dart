import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_detail.dart';

class PoliItem extends StatelessWidget {
  final Poli poli;
  const PoliItem({super.key, required this.poli});

  // Method untuk menentukan warna background berdasarkan nama poli
  Color _getBackgroundColor() {
    switch (poli.namaPoli.toLowerCase()) {
      case 'poli anak':
        return Colors.lightBlue.shade100;
      case 'poli tht':
        return Colors.lightBlue.shade100;
      case 'poli kandungan':
        return Colors.lightBlue.shade100;
      case 'poli gigi':
        return Colors.lightBlue.shade100;
      
      default:
        return Colors.white; // warna default untuk poli lain
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        color: _getBackgroundColor(),
        child: ListTile(
          title: Text(poli.namaPoli),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => PoliDetail(poli: poli)),
        );
      },
    );
  }
}

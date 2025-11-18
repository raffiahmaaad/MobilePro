import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/poli.dart';

class PoliService {
  static const String baseUrl =
      "https://691bd70e3aaeed735c8e7438.mockapi.io/poli";

  static Future<List<Poli>> fetchPoli() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List data = json.decode(response.body);
      return data.map((item) => Poli.fromJson(item)).toList();
    } else {
      throw Exception("Gagal memuat data POLI");
    }
  }

  static Future<Poli> createPoli(Poli poli) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: {"Content-Type": "application/json"},
      body: json.encode(poli.toJson()),
    );

    return Poli.fromJson(json.decode(response.body));
  }

  static Future<Poli> updatePoli(String id, Poli poli) async {
    final response = await http.put(
      Uri.parse("$baseUrl/$id"),
      headers: {"Content-Type": "application/json"},
      body: json.encode(poli.toJson()),
    );

    return Poli.fromJson(json.decode(response.body));
  }

  static Future<bool> deletePoli(String id) async {
    final response = await http.delete(Uri.parse("$baseUrl/$id"));
    return response.statusCode == 200;
  }
}

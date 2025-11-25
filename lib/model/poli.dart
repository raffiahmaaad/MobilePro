class Poli {
  String? id;
  String? namaPoli;
  String? namaDokter;

  Poli({this.id, this.namaPoli, this.namaDokter});

  factory Poli.fromJson(Map<String, dynamic> json) => Poli(
        id: json["id"]?.toString(),
        namaPoli: json["nama_poli"] ?? "",
        namaDokter: json["nama_dokter"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "nama_poli": namaPoli ?? "",
        "nama_dokter": namaDokter ?? "",
      };
}

class Poli {
  String? id;
  String namaPoli;
  String namaDokter;

  Poli({
    this.id,
    required this.namaPoli,
    required this.namaDokter,
  });

  factory Poli.fromJson(Map<String, dynamic> json) {
    return Poli(
      id: json['id'],
      namaPoli: json['namaPoli'],
      namaDokter: json['namaDokter'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'namaPoli': namaPoli,
      'namaDokter': namaDokter,
    };
  }
}

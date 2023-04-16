import 'dart:convert';

class PackagesModel {
  int id_package;
  String nama_package;

  PackagesModel({required this.id_package, required this.nama_package});

  factory PackagesModel.fromJson(Map<String, dynamic> json) => PackagesModel(
      id_package: json["id_package"], nama_package: json["nama_package"]);

  // Map<String, dynamic> toJson() =>
  //     {"id_package": id_package, "nama_package": nama_package};

  // PackagesModel.fromJson(Map<String, dynamic> json) {
  //   id_package = json["id_package"];
  //   nama_package = json["nama_package"];
  // }

  Map<String, dynamic> toJson() {
    return {'id_package': id_package, 'nama_package': nama_package};
  }
}

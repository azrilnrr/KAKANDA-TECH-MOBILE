class Package {
  Package({
    required this.idPackage,
    required this.namaPackage,
    required this.slug,
    required this.harga,
    required this.deskripsi,
    required this.keuntungan1,
    required this.keuntungan2,
    required this.keuntungan3,
    required this.keuntungan4,
    required this.keuntungan5,
    required this.keuntungan6,
    required this.keuntungan7,
    required this.keuntungan8,
    required this.waktuPengerjaan,
    required this.idProduct,
    required this.createdAt,
    required this.updatedAt,
  });

  int idPackage;
  String namaPackage;
  String slug;
  String harga;
  String deskripsi;
  String keuntungan1;
  String keuntungan2;
  String keuntungan3;
  String keuntungan4;
  String keuntungan5;
  String keuntungan6;
  String keuntungan7;
  String keuntungan8;
  String waktuPengerjaan;
  String idProduct;
  DateTime createdAt;
  dynamic updatedAt;

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        idPackage: json["id_package"],
        namaPackage: json["nama_package"],
        slug: json["slug"],
        harga: json["harga"],
        deskripsi: json["deskripsi"],
        keuntungan1: json["keuntungan_1"],
        keuntungan2: json["keuntungan_2"],
        keuntungan3: json["keuntungan_3"],
        keuntungan4: json["keuntungan_4"],
        keuntungan5: json["keuntungan_5"],
        keuntungan6: json["keuntungan_6"],
        keuntungan7: json["keuntungan_7"],
        keuntungan8: json["keuntungan_8"],
        waktuPengerjaan: json["waktu_pengerjaan"],
        idProduct: json["id_product"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id_package": idPackage,
        "nama_package": namaPackage,
        "slug": slug,
        "harga": harga,
        "deskripsi": deskripsi,
        "keuntungan_1": keuntungan1,
        "keuntungan_2": keuntungan2,
        "keuntungan_3": keuntungan3,
        "keuntungan_4": keuntungan4,
        "keuntungan_5": keuntungan5,
        "keuntungan_6": keuntungan6,
        "keuntungan_7": keuntungan7,
        "keuntungan_8": keuntungan8,
        "waktu_pengerjaan": waktuPengerjaan,
        "id_product": idProduct,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt,
      };
}

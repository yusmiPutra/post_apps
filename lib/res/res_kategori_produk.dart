// To parse this JSON data, do
//
//     final resKategoriProduk = resKategoriProdukFromJson(jsonString);

import 'dart:convert';

ResKategoriProduk resKategoriProdukFromJson(String str) => ResKategoriProduk.fromJson(json.decode(str));

String resKategoriProdukToJson(ResKategoriProduk data) => json.encode(data.toJson());

class ResKategoriProduk {
  ResKategoriProduk({
    this.isSuccess,
    this.message,
    this.data,
    this.erros,
  });

  bool? isSuccess;
  String? message;
  List<Kategori>? data;
  dynamic erros;

  factory ResKategoriProduk.fromJson(Map<String, dynamic> json) => ResKategoriProduk(
    isSuccess: json["isSuccess"] == null ? null : json["isSuccess"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : List<Kategori>.from(json["data"].map((x) => Kategori.fromJson(x))),
    erros: json["erros"],
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess == null ? null : isSuccess,
    "message": message == null ? null : message,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
    "erros": erros,
  };
}

class Kategori {
  Kategori({
    this.idKategori,
    this.idCompany,
    this.kategoriName,
    this.kategoriImage,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  int? idKategori;
  int? idCompany;
  String? kategoriName;
  String? kategoriImage;
  String? isActive;
  String? createdAt;
  String? updatedAt;

  factory Kategori.fromJson(Map<String, dynamic> json) => Kategori(
    idKategori: json["id_kategori"] == null ? null : json["id_kategori"],
    idCompany: json["id_company"] == null ? null : json["id_company"],
    kategoriName: json["kategori_name"] == null ? null : json["kategori_name"],
    kategoriImage: json["kategori_image"] == null ? null : json["kategori_image"],
    isActive: json["is_active"] == null ? null : json["is_active"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id_kategori": idKategori == null ? null : idKategori,
    "id_company": idCompany == null ? null : idCompany,
    "kategori_name": kategoriName == null ? null : kategoriName,
    "kategori_image": kategoriImage == null ? null : kategoriImage,
    "is_active": isActive == null ? null : isActive,
    "created_at": createdAt == null ? null : createdAt,
    "updated_at": updatedAt == null ? null : updatedAt,
  };
}

// To parse this JSON data, do
//
//     final resProdukByKategori = resProdukByKategoriFromJson(jsonString);

import 'dart:convert';

ResProdukByKategori resProdukByKategoriFromJson(String str) => ResProdukByKategori.fromJson(json.decode(str));

String resProdukByKategoriToJson(ResProdukByKategori data) => json.encode(data.toJson());

class ResProdukByKategori {
  ResProdukByKategori({
    this.isSuccess,
    this.message,
    this.data,
    this.erros,
  });

  bool? isSuccess;
  String? message;
  List<Produk>? data;
  dynamic erros;

  factory ResProdukByKategori.fromJson(Map<String, dynamic> json) => ResProdukByKategori(
    isSuccess: json["isSuccess"] == null ? null : json["isSuccess"],
    message: json["message"] == null ? null : json["message"],
    data: json["data"] == null ? null : List<Produk>.from(json["data"].map((x) => Produk.fromJson(x))),
    erros: json["erros"],
  );

  Map<String, dynamic> toJson() => {
    "isSuccess": isSuccess == null ? null : isSuccess,
    "message": message == null ? null : message,
    "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
    "erros": erros,
  };
}

class Produk {
  Produk({
    this.idProduct,
    this.idKategori,
    this.idCompany,
    this.productName,
    this.productDesc,
    this.productPrice,
    this.productImage,
    this.productStock,
    this.isPromo,
    this.diskonType,
    this.calcPrice,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  int? idProduct;
  int? idKategori;
  int? idCompany;
  String? productName;
  String? productDesc;
  double? productPrice;
  String? productImage;
  String? productStock;
  String? isPromo;
  String? diskonType;
  String? calcPrice;
  String? isActive;
  String? createdAt;
  String? updatedAt;

  factory Produk.fromJson(Map<String, dynamic> json) => Produk(
    idProduct: json["id_product"] == null ? null : json["id_product"],
    idKategori: json["id_kategori"] == null ? null : json["id_kategori"],
    idCompany: json["id_company"] == null ? null : json["id_company"],
    productName: json["product_name"] == null ? null : json["product_name"],
    productDesc: json["product_desc"] == null ? null : json["product_desc"],
    productPrice: json["product_price"] == null ? null : json["product_price"].toDouble(),
    productImage: json["product_image"] == null ? null : json["product_image"],
    productStock: json["product_stock"] == null ? null : json["product_stock"],
    isPromo: json["is_promo"] == null ? null : json["is_promo"],
    diskonType: json["diskon_type"] == null ? null : json["diskon_type"],
    calcPrice: json["calc_price"] == null ? null : json["calc_price"],
    isActive: json["is_active"] == null ? null : json["is_active"],
    createdAt: json["created_at"] == null ? null : json["created_at"],
    updatedAt: json["updated_at"] == null ? null : json["updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "id_product": idProduct == null ? null : idProduct,
    "id_kategori": idKategori == null ? null : idKategori,
    "id_company": idCompany == null ? null : idCompany,
    "product_name": productName == null ? null : productName,
    "product_desc": productDesc == null ? null : productDesc,
    "product_price": productPrice == null ? null : productPrice,
    "product_image": productImage == null ? null : productImage,
    "product_stock": productStock == null ? null : productStock,
    "is_promo": isPromo == null ? null : isPromo,
    "diskon_type": diskonType == null ? null : diskonType,
    "calc_price": calcPrice == null ? null : calcPrice,
    "is_active": isActive == null ? null : isActive,
    "created_at": createdAt == null ? null : createdAt,
    "updated_at": updatedAt == null ? null : updatedAt,
  };
}

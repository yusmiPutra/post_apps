import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:pos_apps/data_global.dart';
import 'package:pos_apps/network/api.dart';
import 'package:pos_apps/res/res_kategori_produk.dart';
import 'package:pos_apps/res/res_produk_kategori.dart';

class RepoKategori {
  Dio dio = Dio();
  Future<ResKategoriProduk?> getKategori() async {
    try {
      Response res = await dio.post(kategoriProduk,
          data: {'id_company': dataGlobal.user?.user?.companyId});
      return ResKategoriProduk.fromJson(res.data);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<ResProdukByKategori?> getProduk(int idCategori) async {
    try {
      Response res = await dio.post(produkByKategori, data: {
        'id_company': dataGlobal.user?.user?.companyId,
        'id_kategori': idCategori
      });
      return ResProdukByKategori.fromJson(res.data);
    } catch (e) {
      log(e.toString());
    }
  }
}

import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:pos_apps/repository/repo_kategori.dart';
import 'package:pos_apps/res/res_kategori_produk.dart';
import 'package:pos_apps/res/res_produk_kategori.dart';

part 'kategori_state.dart';

class KategoriCubit extends Cubit<KategoriState> {
  KategoriCubit() : super(KategoriInitial());

  RepoKategori repoKategori = RepoKategori();
  List<Kategori> kategori = [];
  Map<int, List<Produk>> listProduk = {};
  int? tabSelected = 0;

  void changeTab(int? tab) async {
    tabSelected = tab;
    int? idKategori = kategori[tabSelected!].idKategori;

    if (idKategori != null) {
      await getProduk(idKategori);
      emit(KategoriSuccess(kategori, listProduk, tabSelected));
    } else {}
  }

  Future<void> getKategoriProduk(BuildContext context) async {
    try {
      emit(KategoriLoading());
      ResKategoriProduk? res = await repoKategori.getKategori();
      if (res != null) {
        if (res.isSuccess == true) {
          kategori = res.data!;
          emit(KategoriSuccess(kategori, listProduk, tabSelected));
          getProduk(kategori[0].idKategori);
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('${res.message}')));
        }
      } else {
        emit(KategoriInitial());
      }
    } catch (e) {
      emit(KategoriError(e.toString()));
    }
  }

  Future<void> getProduk(int? idKategori) async {
    try {
      emit(KategoriProdukLoading(kategori, listProduk, tabSelected));
      ResProdukByKategori? res = await repoKategori.getProduk(idKategori!);
      if (res != null) {
        if (res.isSuccess == true) {
          listProduk[idKategori] = res.data!;
          emit(KategoriSuccess(kategori, listProduk, tabSelected));
        } else {
          emit(KategoriProdukFailed(kategori, listProduk, tabSelected));
        }
      } else {
        emit(KategoriInitial());
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

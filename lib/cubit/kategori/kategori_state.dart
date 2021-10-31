part of 'kategori_cubit.dart';

@immutable
abstract class KategoriState {}

class KategoriInitial extends KategoriState {}

class KategoriLoading extends KategoriState {}

class KategoriSuccess extends KategoriState {
  final List<Kategori>? kategori;
  final Map<int, List<Produk>>? listProduk;
  final int? tabSelected;
  KategoriSuccess(this.kategori, this.listProduk, this.tabSelected);
}

class KategoriProdukLoading extends KategoriState {
  final List<Kategori>? kategori;
  final Map<int, List<Produk>>? listProduk;
  final int? tabSelected;
  KategoriProdukLoading(this.kategori, this.listProduk, this.tabSelected);
}

class KategoriProdukFailed extends KategoriState {
  final List<Kategori>? kategori;
  final Map<int, List<Produk>>? listProduk;
  final int? tabSelected;
  KategoriProdukFailed(this.kategori, this.listProduk, this.tabSelected);
}

class KategoriError extends KategoriState {
  final String? message;
  KategoriError(this.message);
}

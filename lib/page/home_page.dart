import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pos_apps/cubit/kategori/kategori_cubit.dart';
import 'package:pos_apps/network/api.dart';
import 'package:pos_apps/page/detail_produk.dart';
import 'package:pos_apps/res/res_produk_kategori.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  KategoriCubit? cubit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<KategoriCubit>(create: (context) => KategoriCubit())
        ],
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: 'Search here',
                        contentPadding: EdgeInsets.only(top: 8, bottom: 8),
                        prefixIcon: Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'Categories',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  BlocBuilder<KategoriCubit, KategoriState>(
                    builder: (context, state) {
                      cubit = context.read<KategoriCubit>();
                      if (state is KategoriInitial) {
                        cubit?.getKategoriProduk(context);
                      }
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          child: DefaultTabController(
                            length: cubit?.kategori?.length ?? 0,
                            child: TabBar(
                              isScrollable: true,
                              onTap: (index) {
                                setState(() {
                                  cubit?.changeTab(index);
                                });
                              },
                              indicatorSize: TabBarIndicatorSize.tab,
                              unselectedLabelColor: Colors.green,
                              labelColor: Colors.white,
                              indicatorColor: Colors.transparent,
                              indicator: const BubbleTabIndicator(
                                indicatorColor: Colors.green,
                                indicatorHeight: 30,
                                tabBarIndicatorSize: TabBarIndicatorSize.tab,
                              ),
                              tabs: cubit?.kategori.map((e) {
                                    return Tab(
                                      text: '${e.kategoriName}',
                                    );
                                  }).toList() ??
                                  [],
                            ),
                          ));
                    },
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  BlocBuilder<KategoriCubit, KategoriState>(
                    builder: (context, state) {
                      cubit = context.read<KategoriCubit>();
                      if (state is KategoriInitial) {
                        cubit?.getKategoriProduk(context);
                      }
                      if (state is KategoriSuccess) {
                        int? idKategori =
                            state.kategori![state.tabSelected!].idKategori;
                        List<Produk>? listProduk =
                            state.listProduk?[idKategori];
                        return Column(
                          children: listProduk?.map((e) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => DetailProduk(
                                                e
                                              )));
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 1, color: Colors.grey),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              child: Image.network(
                                                produkUrl + '${e.productImage}',
                                                height: 100,
                                                width: 125,
                                                fit: BoxFit.fitWidth,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 25,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${e.productName}',
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Text(
                                                  '${e.productDesc}',
                                                  style: TextStyle(
                                                      color: Colors.grey),
                                                ),
                                                Text(
                                                    'Stock : ${e.productStock}'),
                                                Text('RM. ${e.productPrice}')
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }).toList() ??
                              [],
                        );
                      }
                      return Container();
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

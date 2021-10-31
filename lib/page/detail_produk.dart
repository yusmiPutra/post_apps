import 'package:flutter/material.dart';
import 'package:pos_apps/network/api.dart';
import 'package:pos_apps/res/res_produk_kategori.dart';

class DetailProduk extends StatefulWidget {
  final Produk e;
  DetailProduk(this.e);

  @override
  _DetailProdukState createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk> {
  double totalItem = 0.0;
  int counter = 1;

  void minusItem() {
    setState(() {
      counter--;
    });
  }

  void addItem() {
    setState(() {
      counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Produ'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            produkUrl + '${widget.e.productImage}',
            height: 250,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitHeight,
          ),
          Container(
            height: 60,
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'RM. ${widget.e.productPrice}',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          counter == 1 ? Container() : minusItem();
                          totalItem = counter * widget.e.productPrice!;
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 15,
                          child: Icon(Icons.remove),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text('$counter'),
                      SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          addItem();
                          totalItem = counter * widget.e.productPrice!;
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 15,
                          child: Icon(Icons.add),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.e.productName}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Stock : ${widget.e.productStock}',
                  style: TextStyle(fontSize: 12),
                ),
                SizedBox(
                  height: 8,
                ),
                Text('${widget.e.productDesc}')
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(
                  'RM. ${totalItem == 0.0 ? widget.e.productPrice : totalItem}',
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
              MaterialButton(
                elevation: 0,
                height: 65,
                color: Colors.green,
                textColor: Colors.white,
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Checkout'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

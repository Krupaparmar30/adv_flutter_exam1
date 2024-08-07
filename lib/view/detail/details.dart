import 'package:adv_flutter_exam1/view/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/product_provider.dart';

class detailPage extends StatelessWidget {
  const detailPage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductProvider productProviderTrue =
        Provider.of<ProductProvider>(context, listen: true);
    ProductProvider productProviderFalse =
        Provider.of<ProductProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Page'),
      ),
      body: FutureBuilder(
        future: Provider.of<ProductProvider>(context).fromList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade50,
                          image: DecorationImage(

                              image: NetworkImage(productProviderFalse
                                  .productList[selIndex].image))),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 500,
                      width: 600,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                productProviderFalse
                                    .productList[selIndex].category,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 22),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                  productProviderFalse
                                      .productList[selIndex].title,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 16)),
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                color: Colors.grey.shade200,
                                child: Text(
                                  productProviderFalse
                                      .productList[selIndex].description,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GestureDetector(
                                  onDoubleTap: () {
                                    cartList.add(productProviderFalse
                                        .productList[selIndex]);
                                    for (int i = 0;
                                        i <
                                            productProviderFalse
                                                .productList.length;
                                        i++) {
                                      qty.add(1);
                                    }
                                    Navigator.of(context).pushNamed('/cart');
                                  },
                                  child: Container(
                                    height: 100,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade200,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(child: Text('ADD TO CART')),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

List cartList = [];
List<int> qty = [];

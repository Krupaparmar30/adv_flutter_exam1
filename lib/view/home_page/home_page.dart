import 'dart:math';

import 'package:adv_flutter_exam1/helper/pro_helper.dart';
import 'package:adv_flutter_exam1/modal/product_modal/product_modal.dart';
import 'package:adv_flutter_exam1/provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class home_page extends StatelessWidget {
  const home_page({super.key});

  Widget build(BuildContext context) {
    ProductProvider productProviderTrue =
    Provider.of<ProductProvider>(context, listen: true);
    ProductProvider productProviderFalse =
    Provider.of<ProductProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar
        (
        title: Text('Home Page'),
      ),
      body: FutureBuilder(
        future: Provider.of<ProductProvider>(context).fromList(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return GridView.builder(
              gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: productProviderFalse.productList.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: GestureDetector(
                    onDoubleTap: () {
                      selIndex=index;
                      Navigator.of(context).pushNamed('/next');
                    },
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 180,
                            width: 200,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  spreadRadius: 2,blurRadius: 2,offset: Offset(0,2)
                                )
                              ],
                                color: Colors.white,
                                image: DecorationImage(
                                    image: NetworkImage(productProviderFalse
                                        .productList[index].image))),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 130),
                                  child: Container(
                                    height: 50,
                                    width: 200,
                                    decoration: BoxDecoration(
                                        color: Colors.grey.shade50
                                    ),
                                    child: Text(
                                        productProviderFalse.productList[index].title),
                                  ),
                                )
                              ],

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
int selIndex=0;

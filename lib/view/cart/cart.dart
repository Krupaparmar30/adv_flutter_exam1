import 'package:adv_flutter_exam1/provider/cart_provider.dart';
import 'package:adv_flutter_exam1/view/detail/details.dart';
import 'package:adv_flutter_exam1/view/home_page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/product_provider.dart';

class cartPage extends StatelessWidget {
  const cartPage({super.key});

  @override
  Widget build(BuildContext context) {
    CartProvider cartProviderT = Provider.of(context, listen: true);
    CartProvider cartProviderF = Provider.of(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cart Page'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            ...List.generate(
              cartList.length,
              (index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 150,
                    width: 500,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(cartList[index].category,style: TextStyle(
                            fontSize: 18,fontWeight: FontWeight.w500
                          ),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(cartList[index].title),
                        ),
                        Text(qty[index].toString()),
                        GestureDetector(
                            onTap: () {
                              cartProviderF.removeqtyAll(index);
                            },
                            child: Icon(Icons.delete)),

                      ],
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

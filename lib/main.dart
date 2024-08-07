import 'package:adv_flutter_exam1/provider/product_provider.dart';
import 'package:adv_flutter_exam1/view/cart/cart.dart';
import 'package:adv_flutter_exam1/view/detail/details.dart';
import 'package:adv_flutter_exam1/view/home_page/home_page.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';

void main()
{
  runApp(myApp());
}
class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProductProvider(),),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        routes: {
          '/':(context)=>home_page(),
          '/next':(context)=>detailPage(),
          '/cart':(context)=>cartPage()
        },


      ),
    );
  }
}

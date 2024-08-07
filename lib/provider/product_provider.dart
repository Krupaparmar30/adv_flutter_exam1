import 'dart:convert';

import 'package:adv_flutter_exam1/helper/pro_helper.dart';
import 'package:flutter/widgets.dart';

import '../modal/product_modal/product_modal.dart';

class ProductProvider  extends ChangeNotifier
{
  ProHelper proHelper = ProHelper();
  List<ProductModal> productList = [];

  Future<List<ProductModal?>> fromList()
  async {
    List prod=await proHelper.proApiHelper();
    productList= prod.map((e)=>ProductModal.fromJson(e)).toList();
    return productList;
  }
  ProductProvider()
  {
    fromList();
  }
}
// List photoes=jsonDecode(json);
// List<Photos> photoesList=[];
//
//
// Future<List> jsonParsing()
// async {
//   String json=await rootBundle.loadString('assets/json/photos.json');
//   List photoes=jsonDecode(json);
//
//   return photoes;
// }
//
// Future<void> fromList()
// async {
//   List photoes=await jsonParsing();
//   photoesList = photoes.map((e)=>Photos.fromMap(e),).toList();
//   notifyListeners();
// }


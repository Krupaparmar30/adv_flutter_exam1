import 'dart:convert';

import 'package:adv_flutter_exam1/helper/pro_helper.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../modal/product_modal/product_modal.dart';

class ProductProvider extends ChangeNotifier {
  ProHelper proHelper = ProHelper();
  List<ProductModal> productList = [];
  List<String> add = [];

  Future<List<ProductModal?>> fromList() async {
    List prod = await proHelper.proApiHelper();
    productList = prod.map((e) => ProductModal.fromJson(e)).toList();
    return productList;
  }

  ProductProvider() {
    fromList();
  }

  Future<void> fromS() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setStringList("product", add);
    notifyListeners();
  }

  Future<void> fromG() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    add = sharedPreferences.getStringList("product") ?? [];
    notifyListeners();
  }
}

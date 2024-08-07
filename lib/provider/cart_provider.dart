
import 'package:flutter/cupertino.dart';

import '../view/detail/details.dart';

class CartProvider extends ChangeNotifier{
  dynamic price=0;
  int quantity = 1;

  void add(int index)
  {

   qty[index]++;
   notifyListeners();
  }
  void removeqty(int index)
  {
    if(qty[index]>0)
      {
        qty[index]--;
        notifyListeners();
      }
  }
  void removeqtyAll(int index)
  {
    price -= cartList[index].price;
    cartList.removeAt(index);
    qty[index] = 1;
    notifyListeners();
  }

}

import 'package:flutter/cupertino.dart';

import '../view/detail/details.dart';

class CartProvider extends ChangeNotifier{
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
      }
  }
  void removeqtyAll(int index)
  {

  }
}
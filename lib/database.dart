import 'package:flutter/widgets.dart';

class FinalResult with ChangeNotifier {
   List<Map<String, dynamic>> data = [];

  void addData(Map<String, dynamic> entry) {
    data.add(entry);
    notifyListeners();
  }
  void removeData(){
    data.clear();
    notifyListeners();
  }
  
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/M%20E%20T%20R%20O/flutter/expense/lib/models/transcation.dart';
import 'package:intl/intl.dart';
import 'tran_list.dart';
import 'package:flutter/foundation.dart';


class Changeit extends ChangeNotifier {


  List<Transcation> transcation = [
    // Transcation(id: 0, title: "Eating pizza", amount: 50.6, dateTime: DateTime.now()  ),
    // Transcation(id: 1, title: "حواوشي", amount: 15.6, dateTime: DateTime.now()  ),
    // Transcation(id: 2, title: "Spagtie", amount: 20.6, dateTime: DateTime.now()  ),
  ];


  void addOne(String title, double amount, DateTime dateTime) {
    transcation.add(Transcation(title:title, amount: amount, dateTime: dateTime ));
    notifyListeners();
  }


  void deteit(int n) {
    transcation.removeAt(n);
    print("done");
    notifyListeners();
  }




}
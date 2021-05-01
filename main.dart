import 'package:flutter/material.dart';
import 'file:///C:/Users/M%20E%20T%20R%20O/flutter/expense/lib/models/transcation.dart';
import 'package:intl/intl.dart';
import 'widget/home.dart';
import 'widget/listChange.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Changeit() ,
      child: Platform.isIOS ? CupertinoApp(
        theme: CupertinoThemeData(
          primaryColor: Colors.purple
        ),
        home: HomePage(),
      ) : MaterialApp(
        theme: ThemeData(
          textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.purple
            )
          ) ,
          fontFamily: 'Quicksand',
          primarySwatch: Colors.purple,
          appBarTheme: AppBarTheme(textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(fontFamily: "Open Sans", fontSize: 20)

          ), )
        ),
        home: HomePage(),
      ),
    );
  }
}






// ListView.builder(
//     itemBuilder: (context, index) {
//       return Card(
//         color: Colors.blue,
//         child: Text(transcation[index].title),
//           elevation: 5,
//         );
//
//     },
//   itemCount: transcation.length,


// Column(
//
//
// children: transcation.map((tran) {
// return Card(
// child: Row(
// children: [
// Container(
// padding: EdgeInsets.all(10),
// decoration: BoxDecoration(
// border: Border.all(color: Colors.black, width: 2)
// ),
// margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
// child: Text('\$' + tran.amount.toString(), style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.purple),)
// ),
// SizedBox(width: 20,),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start ,
// children: [
// Text(tran.title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
// SizedBox(width: 20,),
// Text(DateFormat().add_yMMM().format(tran.dateTime), style: TextStyle( fontSize: 10, color: Colors.grey, fontWeight: FontWeight.w700),)
// ],
// )
// ],
// ),
//
// );
// }).toList()
// ),
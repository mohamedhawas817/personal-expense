import 'package:flutter/material.dart';
import 'file:///C:/Users/M%20E%20T%20R%20O/flutter/expense/lib/models/transcation.dart';
import 'package:intl/intl.dart';
import 'listChange.dart';
import 'package:provider/provider.dart';


class Tran_list extends StatefulWidget {

  // List transcation;
  //
  // Tran_list({this.transcation});




  @override
  _Tran_listState createState() => _Tran_listState();
}

class _Tran_listState extends State<Tran_list> {

  void deletet(n) {
    Provider.of<Changeit>(context, listen: false).deteit(n);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,

        child: ListView.builder(
          itemBuilder: (context, index) {

            return Card(
              child: ListTile(

                leading: CircleAvatar(

                  radius: 30,
                  child: Text(
                    '\$' + Provider.of<Changeit>(context, listen: false).transcation[index].amount.toStringAsFixed(2),
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.white),),
                ),

                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start ,
                  children: [
                    Text( Provider.of<Changeit>(context, listen: false).transcation[index].title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
                    SizedBox(width: 20,),
                    Text(DateFormat().add_yMMM().format( Provider.of<Changeit>(context, listen: false).transcation[index].dateTime), style: TextStyle( fontSize: 10, color: Colors.grey, fontWeight: FontWeight.w700),),

                  ],
                ),
                trailing: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    deletet(index);
                  },
                ),
              ),
            );


            // return Card (
            //
            //   child:Provider.of<Changeit>(context, listen: false).transcation.isEmpty ? Container(
            //
            //     child: Image.asset('images/asssets/waiting.png'),
            //   )  : Row(
            //     children: [
            //       Container(
            //           padding: EdgeInsets.all(1),
            //           decoration: BoxDecoration(
            //               border: Border.all(color: Colors.black, width: 2)
            //           ),
            //           margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            //           child: Text(
            //             '\$' + Provider.of<Changeit>(context, listen: false).transcation[index].amount.toStringAsFixed(2),
            //             style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.purple),)
            //       ),
            //       SizedBox(width: 20,),
            //
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start ,
            //         children: [
            //           Text( Provider.of<Changeit>(context, listen: false).transcation[index].title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
            //           SizedBox(width: 20,),
            //           Text(DateFormat().add_yMMM().format( Provider.of<Changeit>(context, listen: false).transcation[index].dateTime), style: TextStyle( fontSize: 10, color: Colors.grey, fontWeight: FontWeight.w700),),
            //
            //         ],
            //       )
            //     ],
            //   ),
            // );
          },
          itemCount: Provider.of<Changeit>(context, listen: false).transcation.length ,
        ),

    );
  }
}






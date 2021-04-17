import 'package:flutter/material.dart';
import 'file:///C:/Users/M%20E%20T%20R%20O/flutter/expense/lib/models/transcation.dart';
import 'package:intl/intl.dart';
import 'tran_list.dart';
import 'trans_add.dart';
import 'listChange.dart';
import 'package:provider/provider.dart';
import 'chart.dart';


class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String inputTitle;
  String inputAmount;



  final titleController = TextEditingController();
  final amountController = TextEditingController();

  // List<Transcation> transcation = [
  //   Transcation(id: 0, title: "Eating pizza", amount: 50.6, dateTime: DateTime.now()  ),
  //   Transcation(id: 1, title: "حواوشي", amount: 15.6, dateTime: DateTime.now()  ),
  //   Transcation(id: 2, title: "Spagtie", amount: 20.6, dateTime: DateTime.now()  ),
  // ];


  Changeit chan = Changeit();

  @override
  Widget build(BuildContext context) {


    void model() {
      showModalBottomSheet(context: context, builder: (context) {
        return SingleChildScrollView(
          child: Column(
            children: [
              TranAdd(),
            ],
          ),
        );
      });
    }



    return Scaffold(

      floatingActionButton: FloatingActionButton(
        onPressed:() => model(),
        backgroundColor: Colors.black,
        child: Icon(Icons.add, color: Colors.lightBlueAccent,),
      ),
        appBar: AppBar(
          title: Text("Personal Expenses"),
          actions: [
            IconButton(
                icon: Icon(Icons.add),
                onPressed:  (){
                  model();
                },
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [



              Card(
                child: Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Chart(Provider.of<Changeit>(context, listen: false).transcation),
                        SizedBox(height: 10,),
                        Tran_list(),


                      ]
                  ),
                ),
              ),





            ],
          ),
        )
    );




  }
}
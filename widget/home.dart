import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/M%20E%20T%20R%20O/flutter/expense/lib/models/transcation.dart';
import 'package:intl/intl.dart';
import 'tran_list.dart';
import 'trans_add.dart';
import 'listChange.dart';
import 'package:provider/provider.dart';
import 'chart.dart';
import 'dart:io';

class HomePage extends StatefulWidget {


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>  with WidgetsBindingObserver {
  String inputTitle;
  String inputAmount;



  final titleController = TextEditingController();
  final amountController = TextEditingController();

  bool _showChart = false;


  @override
  void initState() {

    WidgetsBinding.instance.addObserver(this);

  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {

  print(state);
}

  @override
  dispose() {

  WidgetsBinding.instance.removeObserver(this);
  super.dispose();
  }

  // List<Transcation> transcation = [
  //   Transcation(id: 0, title: "Eating pizza", amount: 50.6, dateTime: DateTime.now()  ),
  //   Transcation(id: 1, title: "حواوشي", amount: 15.6, dateTime: DateTime.now()  ),
  //   Transcation(id: 2, title: "Spagtie", amount: 20.6, dateTime: DateTime.now()  ),
  // ];


  Changeit chan = Changeit();


  // List<Widget> _buildLandScapeContent() {
  //   return [Wiget, Widget];
  //you can add ... in front of a list of widget to make it acceptable as a widget children
  //
  // }
  //
  //
  // Widget _buildPortraitContext() {
  // }



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



    final landscape = MediaQuery.of(context).orientation == Orientation.landscape;

    final pageBody = SingleChildScrollView(
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
                    landscape ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Show it"),
                        Switch.adaptive( activeColor: Colors.yellow ,value: _showChart, onChanged: (vd){
                          setState(() {
                            _showChart = !_showChart;
                          });
                        }),
                      ],
                    ):  Chart(Provider.of<Changeit>(context, listen: false).transcation) ,
                    _showChart ? Chart(Provider.of<Changeit>(context, listen: false).transcation): Container(alignment: Alignment.center, child: Text("click to show")),
                    SizedBox(height: 10,),
                    Tran_list(),


                  ]
              ),
            ),
          ),





        ],
      ),
    );

    return Platform.isIOS ? CupertinoPageScaffold(child: pageBody, navigationBar: CupertinoNavigationBar(
      middle: Text("Personal Expense"),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(onTap:() => model() , child: Icon(CupertinoIcons.add), )
        ],
      ),
    ), ) : Scaffold(

      floatingActionButton: Platform.isIOS ? Container(): FloatingActionButton(
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
        body: pageBody
    );




  }
}


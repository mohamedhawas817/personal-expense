import 'package:flutter/material.dart';
import 'file:///C:/Users/M%20E%20T%20R%20O/flutter/expense/lib/models/transcation.dart';
import 'package:intl/intl.dart';
import 'tran_list.dart';
import 'listChange.dart';
import 'package:provider/provider.dart';
import 'package:provider/provider.dart';



class TranAdd extends StatefulWidget {



  @override
  _TranAddState createState() => _TranAddState();
}

class _TranAddState extends State<TranAdd> {

  String inputTitle;
  String inputAmount;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  List<Transcation> transcation = [
    // Transcation(id: 0, title: "Eating pizza", amount: 50.6, dateTime: DateTime.now()  ),
    // Transcation(id: 1, title: "حواوشي", amount: 15.6, dateTime: DateTime.now()  ),
    // Transcation(id: 2, title: "Spagtie", amount: 20.6, dateTime: DateTime.now()  ),
  ];


  Changeit chan = Changeit();

  void sub() {

    setState(() {
      // transcation.add(Transcation(title:inputTitle, amount:double.parse(inputAmount)  ));
      Provider.of<Changeit>(context, listen: false).addOne(inputTitle, double.parse(inputAmount));

      Navigator.pop(context);
    });




    print(chan.transcation);
    print(inputTitle);
    print(inputAmount);

    titleController.clear();
    amountController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          onSubmitted: (val) => sub(),
          controller: titleController,
          decoration: InputDecoration(
            labelText: 'Title',
            suffixIcon: IconButton(
              onPressed: () => titleController.clear(),
              icon: Icon(Icons.clear),
            ),
          ),
          onChanged: (e) {
            setState(() {
              inputTitle = e;
            });
          },
        ),
        TextField(
          onSubmitted: (val) => sub(),
          keyboardType: TextInputType.number,
          controller: amountController,
          decoration: InputDecoration(
              suffixIcon: IconButton(
                onPressed: () => titleController.clear(),
                icon: Icon(Icons.clear),
              ),
              labelText: 'Amount'
          ),

          onChanged: (e) {
            setState(() {
              inputAmount =e ;

            });
          },

        ),
        FlatButton(
          textColor: Colors.purple,
          child: Text("Add Transcation"),
          onPressed: () {
            sub();


          },

        ),
      ],

    );
  }
}


// Provider.of<Changeit>(context, listen: false).addOne(inputTitle, double.parse(inputAmount));


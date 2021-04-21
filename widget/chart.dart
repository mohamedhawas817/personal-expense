import 'package:flutter/material.dart';
import 'file:///C:/Users/M%20E%20T%20R%20O/flutter/expense/lib/models/transcation.dart';
import 'package:intl/intl.dart';
import 'tran_list.dart';
import 'trans_add.dart';
import 'listChange.dart';
import 'package:provider/provider.dart';
import 'chart_bar.dart';

class Chart  extends StatelessWidget {

  final List<Transcation> recentTransaction;

  Chart(this.recentTransaction);

  List<Map<String, Object>> get groupedTranscationValue {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      double totalSum = 0.0;

      for(var i = 0; i <  recentTransaction.length; i++) {
        if(recentTransaction[i].dateTime.day == weekDay.day
            && recentTransaction[i].dateTime.month == weekDay.month
            && recentTransaction[i].dateTime.year == weekDay.year

        ) {
          totalSum += recentTransaction[i].amount;
        }
      }

      print( DateFormat.E().format(weekDay));
      print(totalSum);

      return {'day' : DateFormat.E().format(weekDay).substring(0,1), 'amount' :totalSum};
    }).reversed.toList();
  }


  double get maxSpending {
    return groupedTranscationValue.fold(0.0 , (previousValue, element) {
      return previousValue + element['amount'];
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTranscationValue);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Container(
        padding: EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: groupedTranscationValue.map((data) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: data['day'],
                spendingAmount: data['amount'],
                spendingPctOfTotal: maxSpending == 0.0 ? 0.0:  (data['amount'] as double) / maxSpending , ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

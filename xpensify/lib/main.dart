import 'package:flutter/material.dart';

import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xpensify',
      theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.deepOrange,
          fontFamily: 'Quicksand',
          textTheme: ThemeData.light().textTheme.copyWith(
                title: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
                button: TextStyle(color: Colors.white),
              ),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
          )),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    Transaction(id: "t1", title: "Happy's Fish House", amount: 31.2, date: DateTime.now()),
    Transaction(id: "t2", title: "Adidas Snicker", amount: 91.2, date: DateTime.now()),
    Transaction(id: "t3", title: "Galveston Beach", amount: 131.11, date: DateTime.now()),
    Transaction(id: "t4", title: "Nike Shorts", amount: 31.01, date: DateTime.now()),
    Transaction(id: "t3", title: "Galveston Beach", amount: 131.11, date: DateTime.now()),
    Transaction(id: "t5", title: "Nike Shorts", amount: 31.01, date: DateTime.now()),
    Transaction(id: "t3", title: "Galveston Beach", amount: 131.11, date: DateTime.now()),
    Transaction(id: "t3", title: "Galveston Beach", amount: 131.11, date: DateTime.now()),
    Transaction(id: "t6", title: "Nike Shorts", amount: 31.01, date: DateTime.now()),
    Transaction(id: "t3", title: "Galveston Beach", amount: 131.11, date: DateTime.now()),
    Transaction(id: "t7", title: "Nike Shorts", amount: 31.01, date: DateTime.now()),
    Transaction(id: "t3", title: "Galveston Beach", amount: 131.11, date: DateTime.now()),
    Transaction(id: "t8", title: "Nike Shorts", amount: 31.01, date: DateTime.now()),
    Transaction(id: "t8", title: "Nike Shorts", amount: 31.01, date: DateTime.now()),
    Transaction(id: "t3", title: "Galveston Beach", amount: 131.11, date: DateTime.now()),
    Transaction(id: "t8", title: "Nike Shorts", amount: 31.01, date: DateTime.now()),
    Transaction(id: "t3", title: "Galveston Beach", amount: 131.11, date: DateTime.now()),
    Transaction(id: "t3", title: "Galveston Beach", amount: 131.11, date: DateTime.now()),
    Transaction(id: "t8", title: "Nike Shorts", amount: 31.01, date: DateTime.now()),
    Transaction(id: "t8", title: "Nike Shorts", amount: 31.01, date: DateTime.now()),
  ];

  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  void _addNewTransaction(
      String txTitle, double txAmount, DateTime chosenDate) {
    final newTx = Transaction(
      title: txTitle,
      amount: txAmount,
      date: chosenDate,
      id: DateTime.now().toString(),
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          onTap: () {},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((tx) => tx.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Xpensify',
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Chart(_recentTransactions),
            TransactionList(_userTransactions, _deleteTransaction),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}

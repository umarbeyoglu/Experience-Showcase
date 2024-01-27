import 'dart:core';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Page1.dart';

class BankProvider extends ChangeNotifier{
  String bankname;
  int coinsadded;
  bool ischanged;

  BankProvider({this.bankname = "Mapp",this.coinsadded = 1,this.ischanged = false});

  void changeBankerName({required String newUserName}) async{
    bankname = newUserName;
    coinsadded = coinsadded + 1;
    ischanged = true;
    notifyListeners(); //Data has been changed!
  }

}

class BankProviderPage extends StatefulWidget {
  const BankProviderPage({super.key});

  @override
  State<BankProviderPage> createState() => BankProviderPageState();
}

class BankProviderPageState extends State<BankProviderPage> {
  int _counter = 0;
  TextEditingController bankController = TextEditingController();
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: bankController,
              onChanged: (value){
                context.read<BankProvider>().changeBankerName(newUserName : value);
                FocusManager.instance.primaryFocus?.unfocus();
                bankController.clear;
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            Text(
              'Name : ${context.watch<BankProvider>().bankname}',
            ),
            Text(
              ' You have changed ${  context.watch<BankProvider>().coinsadded.toString()} characters Until Now',
            ),
            Text(
              ' Is Name Changed ?  ${  context.watch<BankProvider>().ischanged ? 'Yes' : 'No'}',
            ),
          ],
        ),

      ),);
  }
}














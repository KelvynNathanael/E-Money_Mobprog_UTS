import 'package:flutter/material.dart';
import 'package:mobileapps/home.dart';
import 'GlobalVariabel.dart';
import 'package:intl/intl.dart';

class TopUP extends StatefulWidget {
  final TopUPpage state;

  TopUP({required this.state});

  @override
  TopUPpage createState() => state;
}

class TopUPpage extends State<TopUP> {
  Historys myHistory = Historys();
  String recipientAccountNumber = '';
  int selectedAmount = 0;
  String selectedBank = 'Bank BCA';
  List<int> predefinedAmounts = [25000, 50000, 100000, 250000, 500000];
  TextEditingController amountController = TextEditingController();
  Historys history = Historys();

  List<String> banks = ['Bank BCA', 'Bank BNI', 'Bank BRI', 'Shinhan Bank'];

  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  void _navigateBack() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: _navigateBack,
        ),
        title: Text(
          'Top Up',
          style: TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Nomor Telepon Anda:',
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  TextFormField(
                    onChanged: (value) {
                      setState(() {
                        recipientAccountNumber = value;
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Masukkan Nomor Telepon',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
              Text(
                'Nama Bank:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              DropdownButton<String>(
                value: selectedBank,
                onChanged: (value) {
                  setState(() {
                    selectedBank = value!;
                  });
                },
                items: banks.map((bank) {
                  return DropdownMenuItem<String>(
                    value: bank,
                    child: Text(bank),
                  );
                }).toList(),
              ),
              SizedBox(height: 20.0),
              Text(
                'Jumlah Top Up:',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              // Text field for entering custom amount
              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Masukkan Jumlah',
                ),
                onChanged: (value) {
                  // Handle custom amount change
                  setState(() {
                    selectedAmount = int.tryParse(value) ?? 0;
                  });
                },
              ),
              SizedBox(height: 20.0),
              // List of predefined amounts
              Column(
                children: predefinedAmounts.map((amount) {
                  return ListTile(
                    title: Text('Rp ${amount.toStringAsFixed(0)}'),
                    leading: Radio(
                      value: amount,
                      groupValue: selectedAmount,
                      onChanged: (value) {
                        setState(() {
                          selectedAmount = value!;
                          amountController.text = value.toString();
                        });
                      },
                    ),
                  );
                }).toList(),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  DateTime now = DateTime.now();

                  String formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(now);
                  Balance.addMoney(selectedAmount.toDouble());
                  history.addHistory("TopUP","+ Rp ${NumberFormat('#,###', 'id_ID').format(selectedAmount).toString()}",
                      formattedDate);
                  print(myHistory.nama[0]);
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Home()));
                },
                child: Text('Top Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'GlobalVariabel.dart';
import 'home.dart';
import 'package:intl/intl.dart';

class Transfer extends StatefulWidget {
  @override
  _TransferState createState() => _TransferState();
}

class _TransferState extends State<Transfer> {
  Historys history = Historys();
  TextEditingController amountController = TextEditingController(); // Create the controller for the "Jumlah Transfer" TextField

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
        ),
        title: Text('Transfer'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Nomor Rekening Tujuan:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Masukkan Nomor Rekening Tujuan',
              ),
            ),
            SizedBox(height: 20.0),
            Text(
              'Jumlah Transfer:',
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: amountController, // Associate the controller with this TextField
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Masukkan Jumlah Transfer',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                DateTime now = DateTime.now();

                String formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(now);
                String input = amountController.text; 
                print(input);

                if (input.isEmpty) {
                  // Handle the case where the input is empty
                  print("Input is empty");
                  return;
                }

                double amount;
                try {
                  amount = double.parse(input); // Try to parse the input as a double
                } catch (e) {
                  // Handle the case where the input is not a valid double
                  print("Invalid input: $input is not a valid number");
                  return;
                }

                Balance.deductMoney(amount);

                history.addHistory("Transfer", "- Rp ${NumberFormat('#,###', 'id_ID').format(amount).toString()}", formattedDate);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home()));
              },
              child: Text('Proses Transfer'),
            ),
          ],
        ),
      ),
    );
  }
}


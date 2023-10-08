import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobileapps/Profile.dart';

void main() {
  debugPaintSizeEnabled = false;
  debugPrintRebuildDirtyWidgets = false;
  runApp(changepin());
}

class changepin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.white,
            title: Row(
              children: <Widget>[
                Text(
                  'ECO-M',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
                SizedBox(width: 245),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profile()),
                    );
                  },
                  child: Image.asset(
                    'assets/left-arrow.png',
                    width: 48,
                    height: 48,
                  ),
                )
              ],
            ),
          ),
          body: Center(
            child: ListView(
              padding: EdgeInsets.all(0),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Image.asset(
                    'assets/Profil.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Masukkan PIN saat ini',
                      labelText: 'PIN',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Masukkan PIN yang baru',
                      labelText: 'PIN',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Konfirmasi PIN yang baru',
                      labelText: 'PIN',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 32.0),
              ],
            ),
          ),
        ));
  }
}

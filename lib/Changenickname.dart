import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobileapps/Profile.dart';

void main() {
  debugPaintSizeEnabled = false;
  debugPrintRebuildDirtyWidgets = false;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
                SizedBox(width: 245), // Jarak antara gambar dan teks
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
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Image.asset(
                    'assets/Profil.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                SizedBox(
                    height:
                        20.0), // Menambahkan jarak antara foto profil dan TextField
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.0), // Menambahkan padding horizontal
                  child: TextField(
                    decoration: InputDecoration(
                      hintText:
                          'Masukkan nama yang baru', // Hint teks untuk TextField
                      labelText:
                          'Masukkan nama yang baru', // Label untuk TextField (opsional)
                      border: OutlineInputBorder(), // Menambahkan border
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobileapps/Changenickname.dart';
import 'package:mobileapps/home.dart';
import 'package:mobileapps/Changepin.dart';

void main() {
  debugPaintSizeEnabled = false;
  debugPrintRebuildDirtyWidgets = false;
  runApp(Profile());
}

class Profile extends StatelessWidget {
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
                SizedBox(width: 235),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
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
                  padding: EdgeInsets.only(bottom: 0.1),
                  child: Image.asset(
                    'assets/Profil.png',
                    width: 100,
                    height: 100,
                  ),
                ),
                SizedBox(height: 0.1),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 12),
                    Align(
                      alignment: Alignment
                          .centerLeft, // Atur tata letak teks ke tengah
                      child: Text(
                        '      Kelvyn Nathanael',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    SizedBox(width: 1.0), // Jarak antara elemen di dalam Row
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp()),
                        );
                      },
                      child: Image.asset(
                        'assets/setting.png',
                        width: 40,
                        height: 40,
                        colorBlendMode: BlendMode.darken,
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: <Widget>[
                      Divider(
                        height: 1,
                        color: Colors.blue,
                        thickness: 2,
                      ),
                      ListTile(
                          leading: Image.asset(
                            'assets/email.png',
                            width: 48,
                            height: 48,
                          ),
                          title: Text(
                            'Email:Kelvynnathanael@gmail.com',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                      Divider(
                        height: 1,
                        color: Colors.blue,
                        thickness: 2,
                      ),
                      ListTile(
                          leading: Image.asset(
                            'assets/phone.png',
                            width: 48,
                            height: 48,
                          ),
                          title: Text(
                            'No Telepon: 0815262727272',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                      Divider(
                        height: 1,
                        color: Colors.blue,
                        thickness: 2,
                      ),
                      ListTile(
                          leading: Image.asset(
                            'assets/inves.png',
                            width: 48,
                            height: 48,
                          ),
                          title: Text(
                            'Return Investasi: RP. 500.000',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                      Divider(
                        height: 1,
                        color: Colors.blue,
                        thickness: 2,
                      ),
                      ListTile(
                          leading: Image.asset(
                            'assets/reward.png',
                            width: 48,
                            height: 48,
                          ),
                          title: Text(
                            'Reward: 70 Point',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                      Divider(
                        height: 1,
                        color: Colors.blue,
                        thickness: 2,
                      ),
                      ListTile(
                          leading: Image.asset(
                            'assets/faq.png',
                            width: 48,
                            height: 48,
                          ),
                          title: Text(
                            'FAQ',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                      Divider(
                        height: 1,
                        color: Colors.blue,
                        thickness: 2,
                      ),
                      ListTile(
                          leading: Image.asset(
                            'assets/bantuan.png',
                            width: 48,
                            height: 48,
                          ),
                          title: Text(
                            'Pusat Bantuan',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                      Divider(
                        height: 1,
                        color: Colors.blue,
                        thickness: 2,
                      ),
                      ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => changepin()),
                          );
                        },
                        leading: Image.asset(
                          'assets/pin.png',
                          width: 48,
                          height: 48,
                        ),
                        title: Text(
                          'Ubah Pin',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Divider(
                        height: 1,
                        color: Colors.blue,
                        thickness: 2,
                      ),
                      ListTile(
                          leading: Image.asset(
                            'assets/tanggal.png',
                            width: 48,
                            height: 48,
                          ),
                          title: Text(
                            'Dibuat Dari: 30 September 2023',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )),
                      Divider(
                        height: 1,
                        color: Colors.blue,
                        thickness: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}

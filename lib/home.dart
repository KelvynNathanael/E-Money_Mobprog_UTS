import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mobileapps/Finance.dart';
import 'package:mobileapps/GlobalVariabel.dart';
import 'package:mobileapps/History.dart';
import 'package:mobileapps/Profile.dart';
import 'package:mobileapps/Qris.dart';
import 'package:mobileapps/TopUP.dart';
import 'package:intl/intl.dart';
import 'package:mobileapps/transfer.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Historys myHistory = Historys();
  int _selectedIndex = 0; // Define the selected index for BottomNavigationBar

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Handle item selection
    });
    if (index == 0) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Finance()));
    } else if (index == 1) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Home()));
    } else if (index == 2) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Qris()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ECOM',
          style: TextStyle(
            color: Color(0xFF118EEA),
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 17.0),
            child: InkWell(
                onTap: () {
                  // Pindah ke halaman profile.dart
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => Profile()));
                },
                child: SvgPicture.asset(
                  'assets/icons/profile.svg',
                  width: 24,
                  height: 24,
                )),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Home
          Container(
            margin: EdgeInsets.only(left: 15.0),
            child: Text(
              'Home',
              style: TextStyle(
                color: Color(0xFF118EEA),
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // END Home

          //Hero
          Center(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24.0),
                  child: Image.asset(
                    'assets/images/background.png',
                    width: 350,
                    height: 150.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 23.0,
                  left: 25.0,
                  child: Opacity(
                    opacity: 0.7,
                    child: Text(
                      "Saldo Anda",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 25,
                  child: Text(
                    'Rp. ${NumberFormat('#,###', 'id_ID').format(Balance.balance)}',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //END Hero

          //Ide Figo
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) {
                          final topUpPageState =
                              TopUPpage(); // Create an instance of the state
                          return TopUP(state: topUpPageState);
                        }),
                      );
                    },
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        width: 137,
                        height: 84,
                        decoration: ShapeDecoration(
                          color: Color(0xFF118EEA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Top UP',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 254, 254),
                              fontSize: 24,
                              fontFamily: 'lato',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => Qris()));
                      print("yes My QR was clicked");
                    },
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        width: 137,
                        height: 84,
                        decoration: ShapeDecoration(
                          color: Color(0xFF118EEA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'My QR',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 254, 254),
                              fontSize: 24,
                              fontFamily: 'lato',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Transfer()),
                      );
                    },
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        width: 137,
                        height: 84,
                        decoration: ShapeDecoration(
                          color: Color(0xFF118EEA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'Transfer',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 254, 254),
                              fontSize: 24,
                              fontFamily: 'lato',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => History()));
                    },
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        width: 137,
                        height: 84,
                        decoration: ShapeDecoration(
                          color: Color(0xFF118EEA),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F000000),
                              blurRadius: 4,
                              offset: Offset(0, 4),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Center(
                          child: Text(
                            'History',
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 254, 254),
                              fontSize: 24,
                              fontFamily: 'lato',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          // END Ide Figo

          //lets start 98
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 20),
                child: Text(
                  'HISTORY',
                  style: TextStyle(
                    color: Color(0xFF118EEA),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(right: 20, top: 20),
                child: Icon(
                  Icons.arrow_drop_down,
                  color: Color(0xFF118EEA),
                  size: 24,
                ),
              ),
              SizedBox(width: 20),
            ],
          ),
          Container(
            width: 340,
            margin: EdgeInsets.only(left: 20),
            child: Divider(
              height: 4,
              color: Colors.black,
            ),
          ),

          //1 history
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 5),
                child: Text(
                  myHistory.nama[myHistory.nama.length - 1],
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(top: 5, right: 40),
                child: Text(
                  myHistory.money[myHistory.money.length - 1],
                  style: TextStyle(
                    fontSize: 12,
                    color: myHistory.money[myHistory.money.length - 1]
                            .startsWith("+")
                        ? Colors.green
                        : Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              myHistory.date[myHistory.date.length -
                  1], //dari global data getDate, globaldata DATE[globaldata.length-1]
              style: TextStyle(fontSize: 10, color: Color(0xFF808080)),
            ),
          ),
          //end 1 history

          //2 History
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 5),
                child: Text(
                  myHistory.nama[myHistory.nama.length -
                      2], //globaldata NAME[globaldata.length-2]
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(top: 5, right: 40),
                child: Text(
                  myHistory.money[myHistory.money.length -
                      2], //globaldata PRICE[globaldata.length-2]
                  style: TextStyle(
                      fontSize: 12,
                      color: myHistory.money[myHistory.money.length - 2]
                              .startsWith("+")
                          ? Colors.green
                          : Colors
                              .red, //warna = globaldata COLOR[globaldata.length-2].getcolor
                      //color : Color(warna),
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              myHistory.date[myHistory.date.length -
                  2], //dari global data getDate, globaldata DATE[globaldata.length-2]
              style: TextStyle(fontSize: 10, color: Color(0xFF808080)),
            ),
          ),
          //END 2 History

          //3 History
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 20, top: 5),
                child: Text(
                  myHistory.nama[myHistory.nama.length -
                      3], //globaldata NAME[globaldata.length-3]
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Spacer(),
              Container(
                margin: EdgeInsets.only(top: 5, right: 40),
                child: Text(
                  myHistory.money[myHistory.money.length -
                      3], //globaldata PRICE[globaldata.length-3]
                  style: TextStyle(
                      fontSize: 12,
                      color: myHistory.money[myHistory.money.length - 3]
                              .startsWith("+")
                          ? Colors.green
                          : Colors
                              .red, //warna = globaldata COLOR[globaldata.length-3].getcolor
                      //color : Color(warna),
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Text(
              myHistory.date[myHistory.date.length -
                  3], //dari global data getDate, globaldata DATE[globaldata.length-3]
              style: TextStyle(fontSize: 10, color: Color(0xFF808080)),
            ),
          ),
          // END 3 History
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.graphic_eq),
            label: 'Finance',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Qris',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 6, 112, 187),
        unselectedItemColor: Color(0xFF118EEA),
        onTap: _onItemTapped,
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
    );
  }
}

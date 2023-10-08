import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobileapps/Finance.dart';
import 'package:mobileapps/GlobalVariabel.dart';
import 'package:mobileapps/Profile.dart';
import 'package:mobileapps/Qris.dart';
import 'package:mobileapps/main.dart';
import 'home.dart';

void main() {
  runApp(const History());
}

class History extends StatefulWidget {
  const History({Key? key}) : super(key: key);

  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      home: Scaffold(
        body: Column(
          children: [
            Navbar(),
            Expanded(
              child: ListView.builder(
                itemCount: GlobalVariables.historys.nama.length,
                itemBuilder: (BuildContext context, int index) {
                  return Isi(
                    historys: GlobalVariables.historys,
                    index: index,
                  );
                },
              ),
            ),
          ],
        ),
        // bottomNavigationBar: BNBar(),
      ),
    );
  }
}

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
          ),
        ],
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
            ),
          ),
        ),
      ],
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false, // Untuk menghilangkan tombol "Back"
    );
  }
}

class Isi extends StatelessWidget {
  const Isi({Key? key, required this.historys, required this.index})
      : super(key: key);

  final Historys historys;
  final int index;

  @override
  Widget build(BuildContext context) {
    // Gunakan class Historys seperti biasa
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              width: double.infinity,
              height: 50,
              child: Stack(
                children: [
                  Positioned(
                    left: 1.15,
                    top: 0,
                    child: Container(
                      width: 357.85,
                      height: 50.21,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: SizedBox(
                              width: 116.59,
                              height: 28.91,
                              child: Text(
                                historys.nama[index],
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: 28.91,
                            child: SizedBox(
                              width: 165.07,
                              height: 21.30,
                              child: Text(
                                historys.date[index],
                                style: TextStyle(
                                  color: Color(0xFF808080),
                                  fontSize: 11,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            left: 279.35,
                            top: 16.73,
                            child: SizedBox(
                              width: 78.50,
                              height: 24.34,
                              child: Text(
                                historys.money[index],
                                style: TextStyle(
                                  color: historys.money[index].startsWith("+")
                                      ? Colors.green
                                      : Colors
                                          .red, // Ganti warna sesuai kebutuhan
                                  fontSize: 11,
                                  fontFamily: 'Lato',
                                  fontWeight: FontWeight.w600,
                                  height: 1,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BNBar extends StatefulWidget {
  @override
  _BNBarState createState() => _BNBarState();
}

class _BNBarState extends State<BNBar> {
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
          .push(MaterialPageRoute(builder: (context) => MyApp()));
    } else if (index == 2) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => Qris()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
    );
  }
}

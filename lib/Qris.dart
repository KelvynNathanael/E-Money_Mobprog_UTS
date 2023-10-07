import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobileapps/Finance.dart';
import 'package:mobileapps/Profile.dart';
import 'package:mobileapps/main.dart';

void main() {
  runApp(const Qris());
}

class Qris extends StatefulWidget {
  const Qris({Key? key}) : super(key: key);

  @override
  _QrisState createState() => _QrisState();
}

class _QrisState extends State<Qris> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      home: Scaffold(
        body: ListView(children: [
          const Navbar(),
          G(),
          Qr(),
        ]),
        bottomNavigationBar: BNBar(),
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
          Text(
            'ECOM',
            style: TextStyle(
              color: Color(0xFF118EEA),
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Qris',
            style: TextStyle(
              color: Color(0xFF118EEA),
              fontSize: 36,
              fontWeight: FontWeight.bold,
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

class G extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 80,
          height: 80,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 80,
                  height: 80,
                  decoration: const ShapeDecoration(
                    color: Colors.white,
                    shape: OvalBorder(
                      side: BorderSide(width: 1, color: Color(0xFF118EEA)),
                    ),
                  ),
                ),
              ),
              const Positioned(
                left: 22,
                top: 11,
                child: Text(
                  'G',
                  style: TextStyle(
                    color: Color(0xFF118EEA),
                    fontSize: 48,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Qr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 266,
          height: 319,
          clipBehavior: Clip.antiAlias,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  width: 319,
                  height: 319,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/cardbg.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Gregorio',
                      style: TextStyle(
                        color: Color(0xFFF1E3E3),
                        fontSize: 20,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    SizedBox(height: 10),
                    Image.asset(
                      'assets/qr.png',
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

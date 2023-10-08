import 'package:flutter/material.dart';
import 'package:mobileapps/Profile.dart';
import 'package:mobileapps/Qris.dart';
import 'package:mobileapps/GlobalVariabel.dart';
import 'package:mobileapps/main.dart';

void main() {
  runApp(const Finance());
}

final bitcoin = GlobalVariables.bitcoin;
final ethereum = GlobalVariables.ethereum;
final litecoin = GlobalVariables.litecoin;
final ripple = GlobalVariables.ripple;

double money = GlobalData.money;

class Finance extends StatefulWidget {
  const Finance({Key? key}) : super(key: key);

  @override
  _FinanceState createState() => _FinanceState();
}

class _FinanceState extends State<Finance> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              const Navbar(),
              Bitcoin(coin: bitcoin),
              BuySellButton(coin: bitcoin),
              ETH(coin: ethereum),
              BuySellButton(coin: ethereum),
              LTC(coin: litecoin),
              BuySellButton(coin: litecoin),
              XRP(coin: ripple),
              BuySellButton(coin: ripple),
            ],
          ),
        ),
        bottomNavigationBar: BNBar(),
      ),
    );
  }
}

class Navbar extends StatelessWidget {
  const Navbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 100,
      clipBehavior: Clip.antiAlias,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          const Positioned(
            left: 20,
            top: 75, // Mengatur top ke 0 agar tetap di atas
            child: Text(
              'Finance',
              style: TextStyle(
                color: Color(0xFF118EEA),
                fontSize: 36,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                height: 0.03,
                letterSpacing: 0.38,
              ),
            ),
          ),
          Positioned(
            left: 327,
            top: 25, // Mengatur top ke 9 agar tetap di atas
            child: InkWell(
              onTap: () {
                // Pindah ke halaman Profile.dart
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Profile()));
              },
              child: Container(
                width: 28,
                height: 28,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/profileicon.png'),
                  ),
                ),
              ),
            ),
          ),
          const Positioned(
            left: 20,
            top: 25, // Mengatur top ke 9 agar tetap di atas
            child: Text(
              'ECO-M',
              style: TextStyle(
                color: Color(0xFF118EEA),
                fontSize: 18,
                fontFamily: 'Lato',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuySellButton extends StatefulWidget {
  final Coin coin;

  BuySellButton({required this.coin});

  @override
  _BuySellButtonState createState() => _BuySellButtonState();
}

class _BuySellButtonState extends State<BuySellButton> {
  TextEditingController btcController = TextEditingController();
  double btcAmount = 0;

  void buyCoin() {
    double amountToBuy = double.parse(btcController.text);
    double cost = amountToBuy * widget.coin.harga;
    if (cost <= money) {
      setState(() {
        widget.coin.jumlah.value += amountToBuy;
        money -= cost;
        btcController.clear();
      });
    } else {
      // Handle insufficient funds.
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Insufficient Funds'),
            content: Text(
                'You do not have enough money to buy this amount of ${widget.coin.symbol}.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void sellCoin() {
    double amountToSell = double.parse(btcController.text);
    if (amountToSell <= widget.coin.jumlah.value) {
      setState(() {
        widget.coin.jumlah.value -= amountToSell;
        money += amountToSell * widget.coin.harga;
        btcController.clear();
      });
    } else {
      // Handle insufficient coin balance.
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Insufficient ${widget.coin.symbol} Balance'),
            content: Text(
                'You do not have enough ${widget.coin.symbol} to sell this amount.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(4),
        width: double.infinity,
        height: 30,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 8),
            Padding(
              padding: EdgeInsets.only(top: 0, bottom: 0, right: 4),
              child: ElevatedButton(
                onPressed: buyCoin,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                ),
                child: Text(
                  'Buy',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: EdgeInsets.only(
                  top: 0,
                  bottom: 0,
                  left: 4,
                  right: 4,
                ),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 150,
                  ),
                  child: TextField(
                    controller: btcController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Jumlah ${widget.coin.symbol}',
                      hintText: 'Masukkan jumlah ${widget.coin.symbol}',
                      labelStyle: TextStyle(
                        fontSize: 12,
                      ),
                      hintStyle: TextStyle(
                        fontSize: 12,
                      ),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8),
                      isDense: true,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 0, bottom: 0, left: 4),
              child: ElevatedButton(
                onPressed: sellCoin,
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                ),
                child: Text(
                  'Sell',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    );
  }
}

class Bitcoin extends StatelessWidget {
  final Coin coin;

  Bitcoin({required this.coin});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 52,
            height: 52,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Opacity(
                    opacity: 0.10,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF6533D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  top: 16,
                  child: Container(
                    width: 23,
                    height: 23,
                    padding: const EdgeInsets.symmetric(horizontal: 3.33),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Image.asset('assets/bitcoin-logo.png'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 36,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BTC',
                  style: TextStyle(
                    color: Color(0xFF17171A),
                    fontSize: 15,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    height: 0.08,
                    letterSpacing: -0.41,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    '+1.6%',
                    style: TextStyle(
                      color: Color(0xFF118EEA),
                      fontSize: 13,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      height: 0.09,
                      letterSpacing: -0.24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 22),
          Container(
            width: 90,
            height: 90,
            child: Stack(
              children: [
                Positioned(
                  left: -15,
                  top: -25,
                  child: Container(
                    width: 110,
                    height: 130,
                    padding: const EdgeInsets.symmetric(horizontal: 3.33),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Image.asset('assets/bitcoingraph.png'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 22),
          Container(
            width: 80,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Rp ${coin.harga.toStringAsFixed(0)}',
                  style: TextStyle(
                    color: Color(0xFF17171A),
                    fontSize: 17,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    height: 0.08,
                    letterSpacing: -0.41,
                  ),
                ),
                SizedBox(height: 15),
                ValueListenableBuilder<double>(
                  valueListenable: coin.jumlah,
                  builder: (context, value, child) {
                    return Text(
                      '${coin.jumlah.value} ${coin.symbol}',
                      style: TextStyle(
                        color: Color(0xFF118EEA),
                        fontSize: 15,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                        height: 0.09,
                        letterSpacing: -0.24,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ETH extends StatelessWidget {
  final Coin coin;

  ETH({required this.coin});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 52,
            height: 52,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Opacity(
                    opacity: 0.10,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF6533D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  top: 16,
                  child: Container(
                    width: 25,
                    height: 25,
                    padding: const EdgeInsets.symmetric(horizontal: 3.33),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Image.asset('assets/ethlogo.png'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 36,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'ETH',
                  style: TextStyle(
                    color: Color(0xFF17171A),
                    fontSize: 15,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    height: 0.08,
                    letterSpacing: -0.41,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    '+0.8%',
                    style: TextStyle(
                      color: Color(0xFF118EEA),
                      fontSize: 13,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      height: 0.09,
                      letterSpacing: -0.24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 22),
          Container(
            width: 90,
            height: 90,
            child: Stack(
              children: [
                Positioned(
                  left: -15,
                  top: -25,
                  child: Container(
                    width: 110,
                    height: 130,
                    padding: const EdgeInsets.symmetric(horizontal: 3.33),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Image.asset('assets/ethgraph.png'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 22),
          Container(
            width: 80,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Rp ${coin.harga.toStringAsFixed(0)}',
                  style: TextStyle(
                    color: Color(0xFF17171A),
                    fontSize: 17,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    height: 0.08,
                    letterSpacing: -0.41,
                  ),
                ),
                SizedBox(height: 15),
                ValueListenableBuilder<double>(
                  valueListenable: coin.jumlah,
                  builder: (context, value, child) {
                    return Text(
                      '${coin.jumlah.value} ${coin.symbol}',
                      style: TextStyle(
                        color: Color(0xFF118EEA),
                        fontSize: 15,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                        height: 0.09,
                        letterSpacing: -0.24,
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class LTC extends StatelessWidget {
  final Coin coin;

  LTC({required this.coin});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 52,
            height: 52,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Opacity(
                    opacity: 0.10,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF6533D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  top: 16,
                  child: Container(
                    width: 23,
                    height: 23,
                    padding: const EdgeInsets.symmetric(horizontal: 3.33),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Image.asset('assets/ltc.png'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 36,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'LTC',
                  style: TextStyle(
                    color: Color(0xFF17171A),
                    fontSize: 15,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    height: 0.08,
                    letterSpacing: -0.41,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    '+0.4%',
                    style: TextStyle(
                      color: Color(0xFF118EEA),
                      fontSize: 13,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      height: 0.09,
                      letterSpacing: -0.24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 22),
          Container(
            width: 90,
            height: 90,
            child: Stack(
              children: [
                Positioned(
                  left: -15,
                  top: -25,
                  child: Container(
                    width: 110,
                    height: 130,
                    padding: const EdgeInsets.symmetric(horizontal: 3.33),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Image.asset('assets/ltcgraph.png'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 22),
          Container(
            width: 80,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Rp ${coin.harga.toStringAsFixed(0)}',
                  style: TextStyle(
                    color: Color(0xFF17171A),
                    fontSize: 17,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    height: 0.08,
                    letterSpacing: -0.41,
                  ),
                ),
                SizedBox(height: 15),
                ValueListenableBuilder<double>(
                  valueListenable: coin.jumlah,
                  builder: (context, value, child) {
                    return Text(
                      '${coin.jumlah.value} ${coin.symbol}',
                      style: TextStyle(
                        color: Color(0xFF118EEA),
                        fontSize: 15,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                        height: 0.09,
                        letterSpacing: -0.24,
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class XRP extends StatelessWidget {
  final Coin coin;

  XRP({required this.coin});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 52,
            height: 52,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Opacity(
                    opacity: 0.10,
                    child: Container(
                      width: 80,
                      height: 80,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF6533D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 16,
                  top: 16,
                  child: Container(
                    width: 23,
                    height: 23,
                    padding: const EdgeInsets.symmetric(horizontal: 3.33),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Image.asset('assets/xrplogo.png'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Container(
            width: 36,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'XRP',
                  style: TextStyle(
                    color: Color(0xFF17171A),
                    fontSize: 15,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    height: 0.08,
                    letterSpacing: -0.41,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0),
                  child: Text(
                    '+0.1%',
                    style: TextStyle(
                      color: Color(0xFF118EEA),
                      fontSize: 13,
                      fontFamily: 'Lato',
                      fontWeight: FontWeight.w700,
                      height: 0.09,
                      letterSpacing: -0.24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 22),
          Container(
            width: 90,
            height: 90,
            child: Stack(
              children: [
                Positioned(
                  left: -15,
                  top: -25,
                  child: Container(
                    width: 110,
                    height: 130,
                    padding: const EdgeInsets.symmetric(horizontal: 3.33),
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(),
                    child: Image.asset('assets/xrpgraph.png'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 22),
          Container(
            width: 80,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  'Rp ${coin.harga.toStringAsFixed(0)}',
                  style: TextStyle(
                    color: Color(0xFF17171A),
                    fontSize: 17,
                    fontFamily: 'Lato',
                    fontWeight: FontWeight.w700,
                    height: 0.08,
                    letterSpacing: -0.41,
                  ),
                ),
                SizedBox(height: 15),
                ValueListenableBuilder<double>(
                  valueListenable: coin.jumlah,
                  builder: (context, value, child) {
                    return Text(
                      '${coin.jumlah.value} ${coin.symbol}',
                      style: TextStyle(
                        color: Color(0xFF118EEA),
                        fontSize: 15,
                        fontFamily: 'Lato',
                        fontWeight: FontWeight.w700,
                        height: 0.09,
                        letterSpacing: -0.24,
                      ),
                    );
                  },
                ),
              ],
            ),
          )
        ],
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

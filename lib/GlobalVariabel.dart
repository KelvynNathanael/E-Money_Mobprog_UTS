import 'package:flutter/foundation.dart'; 


class Historys {
  List<String> nama = ["TopUP","Transfer","TopUP"];
  List<String> money = ["+ Rp 69.277", "- Rp 77.989", "+ 46.233"];
  List<String> date = [
    "28 September 2023, 13:32",
    "29 September 2023, 13:31",
    "30 September 2023, 11:31"
  ];

  void addHistory(String newNama, String newMoney, String newDate) {
    nama.add(newNama);
    money.add(newMoney);
    date.add(newDate);
  }
}

class Balance {
  static double balance = 10000000;

  static void addMoney(double amount) {
    balance += amount;
  }

  static void deductMoney(double amount) {
    balance -= amount;
  }
}



class Coin {
  final ValueNotifier<double> jumlah;
  final double harga;
  final String symbol;

  Coin({required this.jumlah, required this.harga, required this.symbol});
}

class GlobalVariables {
  static final Coin bitcoin = Coin(
    symbol: 'BTC',
    harga: 29850.0,
    jumlah: ValueNotifier<double>(0),
  );

  static final Coin ethereum = Coin(
    symbol: 'ETH',
    harga: 10560.0,
    jumlah: ValueNotifier<double>(0),
  );

  static final Coin litecoin = Coin(
    symbol: 'LTC',
    harga: 3676.0,
    jumlah: ValueNotifier<double>(0),
  );

  static final Coin ripple = Coin(
    symbol: 'XRP',
    harga: 5240.0,
    jumlah: ValueNotifier<double>(0),
  );
}


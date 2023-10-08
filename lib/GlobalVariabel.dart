import 'package:flutter/foundation.dart';

class Historys {
  List<String> nama = ["TopUP", "Transfer", "TopUP"];
  List<String> money = ["+ Rp 69.277", "- Rp 77.989", "+ Rp 46.233"];
  List<String> date = [
    "2023-09-28, 13:32",
    "2023-09-29 13:31",
    "2023-09-30 11:31",
  ];

  void addHistory(String newNama, String newMoney, String newDate) {
    GlobalVariables.historys.nama = [newNama, ...GlobalVariables.historys.nama];
    GlobalVariables.historys.money = [
      newMoney,
      ...GlobalVariables.historys.money
    ];
    GlobalVariables.historys.date = [newDate, ...GlobalVariables.historys.date];

    for (var element in GlobalVariables.historys.nama) {
      print(element);
    }
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
  static final Historys historys = Historys();
}

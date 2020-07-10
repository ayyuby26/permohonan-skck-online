//agar bisa menggunakan kode warna dari hexadesimal
import 'main.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) hexColor = "FF" + hexColor;
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}

translateDate() {
  switch (DateFormat('EEEE').format(date).toString()) {
    case "Sunday":
      hari = 'Minggu';
      break;
    case "Monday":
      hari = 'Senin';
      break;
    case "Tuesday":
      hari = 'Selasa';
      break;
    case "Wednesday":
      hari = 'Rabu';
      break;
    case "Thursday":
      hari = 'kamis';
      break;
    case "Friday":
      hari = '''Jum'at''';
      break;
    case "Saturday":
      hari = '''Sabtu''';
      break;
  }
  switch (DateFormat('M').format(date).toString()) {
    case "1":
      bulan = 'Januari';
      break;
    case "2":
      bulan = 'Februari';
      break;
    case "3":
      bulan = 'Maret';
      break;
    case "4":
      bulan = 'April';
      break;
    case "5":
      bulan = 'Mei';
      break;
    case "6":
      bulan = 'Juni';
      break;
    case "7":
      bulan = 'Juli';
      break;
    case "8":
      bulan = 'Agusuts';
      break;
    case "9":
      bulan = 'September';
      break;
    case "10":
      bulan = 'Oktober';
      break;
    case "11":
      bulan = 'November';
      break;
    case "12":
      bulan = 'Desember';
      break;
  }
}

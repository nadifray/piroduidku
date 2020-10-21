import 'package:flutter/cupertino.dart';

class history{
  DateTime date;
  String kategori;
  String tabungan;
  int jumlah;
  Icon image;
  int total = 0;

  history({
    this.date,
    this.kategori,
    this.tabungan,
    this.jumlah,
    this.image
  });

  int get getJumlah{
    return jumlah;
  }
}
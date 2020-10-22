import 'package:flutter/cupertino.dart';

class Transaction{
  DateTime date;
  String kategori;
  String tabungan;
  int jumlah;
  Icon image;
  int expense;

  Transaction({
    this.date,
    this.kategori,
    this.tabungan,
    this.jumlah,
    this.image,
    this.expense,
  });

}
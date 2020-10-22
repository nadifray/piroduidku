import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piroduidku/Class/tabungan_list.dart';
import 'package:piroduidku/Class/transaction_list.dart';
import 'package:piroduidku/Page/home_page.dart';
import 'package:piroduidku/Page/tabungan_page.dart';
import 'package:piroduidku/config.dart';

class ExpenseInput extends StatefulWidget {
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<ExpenseInput> {
  card selectedTab;
  Kategori selectedCat;
  DateTime selectedDate = DateTime.now();
  int _jumlah;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _tambahPemasukkan() {
    return InkWell(
        onTap: () {
          if (!_formKey.currentState.validate()) return;
          _formKey.currentState.save();
          if (_formKey.currentState.validate()) {
            ListOfHistory.add(Transaction(
                date: selectedDate,
                kategori: selectedCat.name,
                jumlah: _jumlah,
                tabungan: selectedTab.name,
                image: selectedCat.icon,
                expense: 1));
            Navigator.pop(context);
          }
        },
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(vertical: 15),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    color: Colors.grey.shade200,
                    offset: Offset(2, 4),
                    blurRadius: 5,
                    spreadRadius: 2)
              ],
              gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [color_Submit_1, color_Submit_2])),
          child: Text(
            'Tambah Pemasukkan',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ));
  }

  Widget _buildJumlah() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Jumlah'),
      validator: (String value) {
        if (value == null) {
          return "Kolom jumlah harus diisi";
        }
      },
      onSaved: (String value) {
        _jumlah = int.parse(value);
        selectedTab.jumlah += int.parse(value);
      },
    );
  }

  Widget _buildKategori(){
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text("Kategori",textAlign: TextAlign.left, style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: DropdownButton<Kategori>(
              hint:  Text("Select item"),
              value: selectedCat,
              onChanged: (Kategori Value) {
                setState(() {
                  selectedCat = Value;
                });
              },
              items: cat.map((Kategori user) {
                return  DropdownMenuItem<Kategori>(
                  value: user,
                  child: Row(
                    children: <Widget>[
                      user.icon,
                      SizedBox(width: 10,),
                      Text(
                        user.name,
                        style:  TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabungan(){
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Text("Pilih Tabungan",textAlign: TextAlign.left, style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: DropdownButton<card>(
              hint:  Text("Select item"),
              value: selectedTab,
              onChanged: (card Value) {
                setState(() {
                  selectedTab = Value;
                });
              },
              items: ListOfCard.map((card user) {
                return  DropdownMenuItem<card>(
                  value: user,
                  child: Row(
                    children: <Widget>[
                      Text(
                        user.name,
                        style:  TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildDate(){
    return Column(
      children: [
        Row(
          children: [
            Text("Pilih Tanggal",textAlign: TextAlign.left, style: GoogleFonts.inter(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.black54,
            ),),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            RaisedButton(
              onPressed: () => _selectDate(context), // Refer step 3
              child: Text(
                'Pilih Tanggal',
                style:
                TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              color: Colors.greenAccent,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "${selectedDate.toLocal()}".split(' ')[0],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

          ],
        ),
      ],
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Row(
          children: <Widget>[
            IconButton(
              padding: EdgeInsets.only(right: 10),
              icon: Image.asset('assets/images/plus-red.png'),
            ),
            Text('Tambah Pemasukkan', style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w700)),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
//                  SizedBox(height: 10),
                    _buildJumlah(),
                    SizedBox(height: 30),
                    _buildKategori(),
                    SizedBox(height: 30),
                    _buildTabungan(),
                    SizedBox(height: 30),
                    _buildDate(),
                    SizedBox(height: 30),
                  ],
                ),
              ),
              SizedBox(height: height * .03),
              _tambahPemasukkan(),
            ],
          ),
        ),
      ),
    );
  }
}


class Kategori {
  const Kategori(this.name, this.icon);

  final String name;
  final Icon icon;
}

List<Kategori> cat = <Kategori>[
  const Kategori('Transfer Masuk',
      Icon(Icons.transit_enterexit, color: const Color(0xFF167F67),)),
  const Kategori('Pemberian Orang tua',
      Icon(Icons.attach_money, color: const Color(0xFF167F67),)),
  const Kategori(
      'Gaji bulanan', Icon(Icons.work, color: const Color(0xFF167F67),)),
];

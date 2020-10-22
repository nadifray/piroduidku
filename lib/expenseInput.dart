import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piroduidku/HomeScreen.dart';
import 'package:piroduidku/Tabungan.dart';
import 'package:piroduidku/TabunganList.dart';
import 'package:piroduidku/history_list.dart';

class ExpenseInput extends StatefulWidget{
  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<ExpenseInput> {
  card selectedTab;
  Kategori selectedCat;
  DateTime selectedDate = DateTime.now();
  String _date;
  String _kategori;
  String _tabungan;
  int _jumlah;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildJumlah(){
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: 'Jumlah'
      ),
      validator: (String value){
        if(value == null){
          return "Kolom jumlah harus diisi";
        }
      },
      onSaved: (String value){
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Pemasukkan"), centerTitle: true, backgroundColor: Colors.green,),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.grey,
                      width: 1.0,
                    )
                  )
                ),
                child: Text("Masukkan pemasukkan anda", style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w300,
                ),),
              ),
              _buildJumlah(),
              _buildKategori(),
              _buildTabungan(),
              _buildDate(),
              SizedBox(
                height: 100,
              ),
              RaisedButton(
                child: Text("Submit",),
                onPressed: () {
                  if(!_formKey.currentState.validate()){
                    return;
                  }




                  _formKey.currentState.save();
                  if (_formKey.currentState.validate()){
                    ListOfHistory.add(history(date: selectedDate, kategori: selectedCat.name, jumlah: _jumlah, tabungan: selectedTab.name, image: selectedCat.icon,expense: 1));
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return HomeScreen();
                    }));
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Kategori {
  const Kategori(this.name,this.icon);
  final String name;
  final Icon icon;
}

List<Kategori> cat = <Kategori>[
  const Kategori('Transfer Masuk',Icon(Icons.transit_enterexit,color:  const Color(0xFF167F67),)),
  const Kategori('Pemberian Orang tua',Icon(Icons.attach_money,color:  const Color(0xFF167F67),)),
  const Kategori('Gaji bulanan',Icon(Icons.work,color:  const Color(0xFF167F67),)),
];

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piroduidku/HomeScreen.dart';
import 'package:piroduidku/Tabungan.dart';
import 'package:piroduidku/TabunganList.dart';
import 'package:piroduidku/history_list.dart';

class AddTabungan extends StatefulWidget{
  @override
  _AddTabState createState() => _AddTabState();
}

class _AddTabState extends State<AddTabungan> {
  Tabungan selectedTab;
  String _name;
  String _kategori;
  String _tabungan;
  int _jumlah;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildNama(){
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Nama'
      ),
      validator: (String value){
        if(value.isEmpty){
          return "Kolom jumlah harus diisi";
        }
      },
      onSaved: (String value){
        _name = value;
      },
    );
  }

  Widget _buildJumlah(){
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: 'Jumlah'
      ),
      validator: (String value){
        if(value.isEmpty){
          return "Kolom jumlah harus diisi";
        }
      },
      onSaved: (String value){
        _jumlah = int.parse(value);
      },
    );
  }

  Widget _buildTipeTab(){
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                Text("Tipe Tabungan",textAlign: TextAlign.left, style: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54,
                ),),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: DropdownButton<Tabungan>(
              hint:  Text("Select item"),
              value: selectedTab,
              onChanged: (Tabungan Value) {
                setState(() {
                  selectedTab = Value;
                });
              },
              items: tab.map((Tabungan user) {
                return  DropdownMenuItem<Tabungan>(
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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: Text("Tambah Tabungan"), centerTitle: true,),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              _buildNama(),
              SizedBox(
                height: 20,
              ),
              _buildTipeTab(),
              _buildJumlah(),
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
                    ListOfCard.add(card(name: _name, jumlah: _jumlah, kategori: selectedTab.name));
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return TabunganScreen();
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

class Tabungan {
  const Tabungan(this.name);
  final String name;
}

List<Tabungan> tab = <Tabungan>[
  const Tabungan('Rekening'),
  const Tabungan('E-Money'),
];
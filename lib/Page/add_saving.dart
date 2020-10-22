import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piroduidku/Class/tabungan_list.dart';
import 'package:piroduidku/Page/tabungan_page.dart';
import 'package:piroduidku/config.dart';

class AddSaving extends StatefulWidget {
  @override
  _AddTabState createState() => _AddTabState();
}

class _AddTabState extends State<AddSaving> {
  Tabungan selectedTab;
  String _name;
  int _jumlah;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _tambahTabungan() {
    return InkWell(
        onTap: () {
          if (!_formKey.currentState.validate()) return;
          _formKey.currentState.save();
          if (_formKey.currentState.validate()) {
            ListOfCard.add(
                card(name: _name, jumlah: _jumlah, kategori: selectedTab.name));
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
            'Tambahkan Tabungan',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ));
  }

  Widget _buildNama() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Nama',
        labelStyle: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.black54,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Nama harus diisi";
        }
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildJumlah() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'Saldo sekarang',
        labelStyle: GoogleFonts.inter(
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.black54,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) {
          return "Saldo sekarang harus diisi";
        }
      },
      onSaved: (String value) {
        _jumlah = int.parse(value);
      },
    );
  }

  Widget _buildTipeTab() {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          Container(
            alignment: Alignment.centerLeft,
            child: Column(
              children: [
                Text(
                  "Tipe Tabungan",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.inter(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.centerLeft,
            child: DropdownButton<Tabungan>(
              hint: Text("Pilih kategori"),
              value: selectedTab,
              onChanged: (Tabungan Value) {
                setState(() {
                  selectedTab = Value;
                });
              },
              items: tab.map((Tabungan user) {
                return DropdownMenuItem<Tabungan>(
                  value: user,
                  child: Row(
                    children: <Widget>[
                      Text(
                        user.name,
                        style: TextStyle(color: Colors.black),
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
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          color: Colors.black,
          onPressed: () => Navigator.of(context).pop(),
          icon: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: Text('Tambah Tabungan',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700)),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
//                  SizedBox(height: 10),
                  _buildNama(),
                  SizedBox(height: 30),
                  _buildTipeTab(),
                  SizedBox(height: 30),
                  _buildJumlah(),
                ],
              ),
            ),
            SizedBox(height: height * .03),
            _tambahTabungan(),
          ],
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

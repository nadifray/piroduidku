import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piroduidku/HomeScreen.dart';
import 'package:piroduidku/ProfilePage.dart';
import 'package:piroduidku/TabunganList.dart';
import 'package:piroduidku/expenseInput.dart';
import 'package:piroduidku/addTabungan.dart';
import 'package:piroduidku/history_list.dart';
import 'package:intl/intl.dart';

class TabunganScreen extends StatefulWidget {
  @override
  _TabunganScreenState createState() => _TabunganScreenState();
}

class _TabunganScreenState extends State<TabunganScreen> {
  final oCcy = new NumberFormat("#,##0.00", "en_US");
  int _selectedTabIndex = 1;

  Widget _BuildCard(){
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: ListOfCard.length,
      padding: EdgeInsets.only(left: 16, right: 16),
      shrinkWrap: true,
      itemBuilder: (context, index){
        return Container(
          height: 120,
          margin: EdgeInsets.only(bottom: 30),
          padding: EdgeInsets.only(left: 24, top: 12, bottom: 12, right: 22),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 10,
                  spreadRadius: 5,
                  offset: Offset(8.0, 8.0),

                )
              ]
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(ListOfCard[index].name, style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Colors.black
                  ),),
                  Padding(
                    padding: const EdgeInsets.only(top:8.0, bottom: 8.0),
                    child: SizedBox(
                      height: 2,
                      width: 120,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(5, 250, 242,0.4),
                        ),
                      ),
                    ),
                  ),
                  Text(ListOfCard[index].kategori, style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey
                  ),),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Rp ${oCcy.format(ListOfCard[index].jumlah)}", style: GoogleFonts.inter(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey
                  ),),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  void _onTap(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
    if(_selectedTabIndex==0){
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomeScreen();
      }));
    }
    else if(_selectedTabIndex==1){
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return TabunganScreen();
      }));
    }
    else if(_selectedTabIndex==2){
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return ProfilePage();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTabIndex,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.account_balance_wallet),
            title: new Text('Tabunganku'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              title: Text('Profil')
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddTabungan();
          }));
        },
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
            children: <Widget>[
            Container(
            // margin: EdgeInsets.only(),
              height: 55,
              padding: EdgeInsets.only(left: 10, right: 10),
              decoration: BoxDecoration(
                color: Colors.green,
                border: Border(
                    bottom: BorderSide(
                        color: Colors.blueGrey,
                        width: 2.0
                    )
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.account_balance_wallet,
                    color: Colors.white,
                    size: 40,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text("Tabunganku", style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                  ),),
                ],
              ),
            //-------------------------------------End Container header-----------------------------------------
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Container(
                  child: Text("Daftar Tabunganku", style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                  ),),
                ),
              ),
              _BuildCard(),
            ]
          ),
        ),
      ),
    );
  }
}

class CustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, 390.0 - 200);
    path.quadraticBezierTo(size.width / 2, 280, size.width, 390.0-200);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}



List<card> ListOfCard = [
  card(
      name: "Gopay",
      kategori: "E-Money",
      jumlah: 0,
  ),
];
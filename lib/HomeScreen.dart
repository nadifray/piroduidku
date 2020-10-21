import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:piroduidku/ProfilePage.dart';
import 'package:piroduidku/Tabungan.dart';
import 'package:piroduidku/addTabungan.dart';
import 'package:piroduidku/expenseInput.dart';
import 'package:piroduidku/history_list.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final oCcy = new NumberFormat("#,##0.00", "en_US");
  int _selectedTabIndex = 0;

  final List<Widget> _children = [];

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
        currentIndex: 0,
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
      body: SafeArea(
        child: Container(
          // padding: EdgeInsets.only(bottom: 30),
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Total Tabungan : ", style: GoogleFonts.inter(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white
                    ),),
                    Text("IDR 0,00", style: GoogleFonts.inter(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white
                    ),),
                  ],
                ),
                //-------------------------------------End Container header-----------------------------------------
              ),
              Stack(
                children: <Widget>[
                  ClipPath(
                    clipper: CustomShape(),
                    child: Container(
                      height: 320,
                      decoration: BoxDecoration(color: Colors.green),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Halo,", style: GoogleFonts.inter(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white
                        ),),
                        Text("Nadif Rayhan", style: GoogleFonts.inter(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                        ),),
                      ],
                    ),
                  ),
                  //---------------------------END HALO-------------------------------------

                  //--------------------------INPUT BOX-----------------------------------
                  Center(
                    child: Container(
                      height: 200,
                      padding: EdgeInsets.only(top: 5),
                      margin: EdgeInsets.only(left: 20, right: 20, top: 100),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                            spreadRadius: 5,
                            offset: Offset(1.5, 1.5),
                          )
                        ]
                      ),
                      child: Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Pengeluaran", style: GoogleFonts.inter(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black
                                      ),),
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.grey.withOpacity(0.4),
                                  width: 1,
                                  height: 20,
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Pemasukkan", style: GoogleFonts.inter(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black
                                      ),),
                                    ],
                                  ),
                                ),

                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 20,top: 10, right: 20,bottom: 25),
                              color: Colors.grey.withOpacity(0.4),
                              height: 1,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Text("RP 0,00", style: GoogleFonts.inter(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.red
                                      ),),
                                      IconButton(
                                        icon: Image.asset('assets/images/plus-red.png'),
                                        iconSize: 50,
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                                            return ExpenseInput();
                                          }));
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  color: Colors.grey.withOpacity(0.4),
                                  width: 1,
                                  height: 120,
                                ), // THE DIVIDER. CHANGE THIS TO ACCOMMODATE YOUR NEEDS
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [

                                      Text("RP 0,00", style: GoogleFonts.inter(
                                          fontSize: 28,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.lightGreen
                                      ),),
                                      IconButton(
                                        icon: Image.asset('assets/images/plus.png'),
                                        iconSize: 50,
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) {
                                            return ExpenseInput();
                                          }));
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  //------------------------------------------------END INPUT BOX-------------------------------------------------------------
                ],
              ),

              Padding(
                padding: EdgeInsets.only(left: 20,bottom: 20),
                child: Text("Rekap", style: GoogleFonts.inter(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Colors.black
                        ),),
              ),
              //--------------------------------LIST VIEW REKAP---------------------------------------------------------
              ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: ListOfHistory.length,
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
                        Row(
                          children: <Widget>[
                            Transform.scale(
                              scale: 2,
                              child: ListOfHistory[index].image
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(ListOfHistory[index].kategori,style: GoogleFonts.inter(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black
                                ),),
                                Text(DateFormat('yyyy-MM-dd').format(ListOfHistory[index].date), style: GoogleFonts.inter(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),)
                              ],
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text("Rp ${oCcy.format(int.parse(ListOfHistory[index].jumlah))}", style: GoogleFonts.inter(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: Colors.blueGrey,
                            ),),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
              //-----------------------------------------Listview REKAP-------------------------------------------------
            ],
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



List<history> ListOfHistory = [
  history(
    date: DateTime.now(),
    kategori: "Transportasi",
    jumlah: "100000",
    tabungan: "Rekening BCA",
    image: Icon(Icons.directions_bus,color:  const Color(0xFF167F67),)
  ),
];
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:piroduidku/Class/tabungan_list.dart';
import 'package:piroduidku/Page/add_saving.dart';
import 'package:piroduidku/config.dart';
import 'package:piroduidku/customShape.dart';

class TabunganScreen extends StatefulWidget {
  @override
  _TabunganScreenState createState() => _TabunganScreenState();
}

class _TabunganScreenState extends State<TabunganScreen> {
  final oCcy = new NumberFormat("#,##0.00", "en_US");

  Widget _BuildCard() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: ListOfCard.length,
      padding: EdgeInsets.only(left: 16, right: 16),
      shrinkWrap: true,
      itemBuilder: (context, index) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          backgroundColor: color_addTabunganku,
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AddSaving()))
                .then((value) {
              setState(() {});
            });
          },
        ),
        body: Stack(
          children: <Widget>[
            CustomPaint(
              child: Container(
                height: 300.0,
              ),
              painter: CurvePainter(),
            ),
            Positioned(
              bottom: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            SafeArea(
              child: Container(
                child: ListView(children: <Widget>[
                  Container(
                    // margin: EdgeInsets.only(),
                    height: 55,
                    padding: EdgeInsets.only(left: 10, right: 10),
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
                        Text(
                          "Daftar Tabunganku",
                          style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    //-------------------------------------End Container header-----------------------------------------
                  ),
                  SizedBox(height: 20),
                  _BuildCard(),
                ]),
              ),
            ),
          ],
        ));
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
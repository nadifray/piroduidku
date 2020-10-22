import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:piroduidku/customShape.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<ProfilePage> {
  Widget _BuildCard() {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: ListOfProfile.length,
      padding: EdgeInsets.only(left: 16, right: 16),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 21.0,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: ListOfProfile[index].iconimg,
                  ),
                  SizedBox(width: 24.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        ListOfProfile[index].act,
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 4.0),
                      Text(
                        ListOfProfile[index].desc,
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            StackContainer(),
            _BuildCard(),
          ],
        ),
      ),
    );
  }
}

class StackContainer extends StatelessWidget {
  const StackContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          top: -MediaQuery
              .of(context)
              .size
              .height * .15,
          left: -MediaQuery
              .of(context)
              .size
              .width * .4,
          child: BeszContainer(),
        ),
        Container(
            height: 300.0,
            child: Stack(children: <Widget>[
              Container(),
              Align(
                alignment: Alignment(0, 1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    CircularProfileAvatar(
                      "",
                      child: Image.asset("assets/images/profile.jpg"),
                      borderWidth: 4.0,
                      radius: 60.0,
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      "PiroDuidku",
                      style: TextStyle(
                        fontSize: 26.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ]))
      ],
    );
  }
}


class profile{
  String act;
  String desc;
  Icon iconimg;

  profile({
    this.act,
    this.desc,
    this.iconimg,
  });
}

List<profile> ListOfProfile = [
  profile(
    act: "Joined Date",
    desc: "21 Oktober 2020",
    iconimg: Icon(
      Icons.access_time,
      size: 40.0,
      color: Colors.green,
    ),
  ),
  profile(
    act: "Umur",
    desc: "20",
    iconimg: Icon(
      Icons.perm_contact_calendar,
      size: 40.0,
      color: Colors.green,
    ),
  ),
  profile(
    act: "Nomor Ponsel",
    desc: "087882766053",
    iconimg: Icon(
      Icons.phone,
      size: 40.0,
      color: Colors.green,
    ),
  ),
  profile(
    act: "Email",
    desc: "PiroDuidKu@gmail.com",
    iconimg: Icon(
      Icons.email,
      size: 40.0,
      color: Colors.green,
    ),
  ),
];

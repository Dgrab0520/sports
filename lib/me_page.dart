import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports/table_page.dart';

import 'main_page.dart';


class MePage extends StatefulWidget{
  @override
  _MePage_State createState() => _MePage_State();
}

class _MePage_State extends State<MePage>{

  late Widget top;




  @override
  Widget build(BuildContext context) {
    top = Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 15, right: 15),
              width: 350,
              height: 43,
              decoration: BoxDecoration(
                color: Color(0xFFF9F9F9),
                border: Border.all(
                  width: 1.0,
                  color: Color(0xFFcccccc),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                keyboardType: TextInputType.text,
                onChanged: (text) {},
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                      bottom: 8, // HERE THE IMPORTANT PART
                    ),
                    icon: Padding(
                        padding: EdgeInsets.only(left: 13),
                        child: Icon(Icons.search))),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: 85,
                height: 43,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Color(0xFF025595),
                ),
                child: Center(
                  child: Text(
                    'search',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 19,
                      fontFamily: 'NanumSquareB',
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 50.0,),
            InkWell(
              onTap: (){
                Get.to(TablePage());
              },
              child: Container(
                padding: EdgeInsets.all(5.0),
                decoration: BoxDecoration(
                    border: Border.all(width: 2.0, color: Color(0xFF537364)),
                    borderRadius: BorderRadius.circular(5.0)
                ),
                child: Row(
                  children: [
                    Icon(Icons.sports_tennis, color: Color(0xFF537364)),
                    Text('Restring Service', style: TextStyle(
                      color: Color(0xFF537364),
                      fontSize: 19,
                      fontFamily: 'NanumSquareEB',
                    ),)
                  ],
                ),
              ),
            )


          ],
        ),
      ],
    );
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child:
          MediaQuery.of(context).size.width > 900 ?
          Container(
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 30,
                      right: MediaQuery.of(context).size.width / 30),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: InkWell(
                            onTap: () {
                              Get.to(MainPage());
                            },
                            child: Text(
                              'Boston Sports Second Hand',
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'NanumSquareEB'
                              ),
                            )
                          )),
                      Expanded(
                        flex: 0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            top,
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 200),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 100.0),
                  width: 1400,
                  color: Color(0xFFE2E6EB),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('About Us',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'NanumSquareB'
                        ),
                      ),
                      SizedBox(height: 50.0,),
                      Text('Welcome to my site! My name is Jason Kim and I am a junior in a high school called Phillips Academy Andover located in Massachusetts. To talk a bit about me, I started getting into sports, particularly squash, at the age of 9. Since then, my passion for the sport has only grown. Currently, I play competitive squash individually through USSquash tournaments and with my school. Other sports I play are football and lacrosse, both participating competitively with my school teams.\n\n'
                        "\n\nI remember the first time I was looking into buying my own racquet. I was pumped. To finally have my own racquet was such a special thing to me. But after looking at some racquets, my excitement was a bit dropped after looking at the price range of the racquets. The prices of racquets, especially the ones made with high quality material, forced players and families of players to commit at an extreme level to the sport. Furthermore, even the players that play squash for the sole purpose of fun exercise without any competitive goals were required to pay the price in order to participate in the sport. Then I thought, why can’t we make the racquets cheaper? That was the spark that motivated me to create this site."
                        "\n\nIn the site, you can find gently used or new squash racquets at an extremely friendly price. Currently, the racquets listed are my personal racquets from previous years and some donated from my teammates. My goal that I wish to achieve through the site is to create simple and affordable exposure to the sport, allowing beginners to pick up the sport without as much financial commitment to the sport. I strongly believe that a player should feel as if they are fully capable of developing themselves to such a degree without any hindrances, such as financial stress."
                        "\n\nAlong with selling racquets, I also offer a restring service. More details are on the restring service tab, feel free to check it out! If you have any further questions or comments, contact me with the information below. For now, please enjoy my site!",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'NanumSquareB'
                        ),
                      ),
                      SizedBox(height: 100.0,)
                    ],
                  ),
                ),
              ],
            ),
          )
              :
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 30,
                      right: MediaQuery.of(context).size.width / 30),
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: InkWell(
                              onTap: () {
                                Get.to(MainPage());
                              },
                              child: Text(
                                'Boston Sports Second Hand',
                                style: TextStyle(
                                    fontSize: 27,
                                    fontFamily: 'NanumSquareEB'
                                ),
                              )
                          )),
                      Expanded(
                        flex: 0,
                        child: Container(
                          margin: EdgeInsets.only(bottom: 8.0),
                          child: Center(
                            child: Builder(
                              builder: (context) => IconButton(
                                icon: Icon(
                                  Icons.menu,
                                  size: 35,
                                  color: Colors.black,
                                ), // 햄버거버튼 아이콘 생성
                                onPressed: () {
                                  Scaffold.of(context).openEndDrawer();
                                  print('menu button is clicked');
                                },
                              ),
                            ),
                          ),
                        )
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 200),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 100.0),
                  width: 1400,
                  color: Color(0xFFE2E6EB),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('About Us',
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'NanumSquareB'
                        ),
                      ),
                      SizedBox(height: 50.0,),
                      Text('Welcome to my site! My name is Jason Kim and I am a junior in a high school called Phillips Academy Andover located in Massachusetts. To talk a bit about me, I started getting into sports, particularly squash, at the age of 9. Since then, my passion for the sport has only grown. Currently, I play competitive squash individually through USSquash tournaments and with my school. Other sports I play are football and lacrosse, both participating competitively with my school teams.\n\n'
                          "\n\nI remember the first time I was looking into buying my own racquet. I was pumped. To finally have my own racquet was such a special thing to me. But after looking at some racquets, my excitement was a bit dropped after looking at the price range of the racquets. The prices of racquets, especially the ones made with high quality material, forced players and families of players to commit at an extreme level to the sport. Furthermore, even the players that play squash for the sole purpose of fun exercise without any competitive goals were required to pay the price in order to participate in the sport. Then I thought, why can’t we make the racquets cheaper? That was the spark that motivated me to create this site."
                          "\n\nIn the site, you can find gently used or new squash racquets at an extremely friendly price. Currently, the racquets listed are my personal racquets from previous years and some donated from my teammates. My goal that I wish to achieve through the site is to create simple and affordable exposure to the sport, allowing beginners to pick up the sport without as much financial commitment to the sport. I strongly believe that a player should feel as if they are fully capable of developing themselves to such a degree without any hindrances, such as financial stress."
                          "\n\nAlong with selling racquets, I also offer a restring service. More details are on the restring service tab, feel free to check it out! If you have any further questions or comments, contact me with the information below. For now, please enjoy my site!",
                        style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'NanumSquareB'
                        ),
                      ),
                      SizedBox(height: 100.0,)
                    ],
                  ),
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
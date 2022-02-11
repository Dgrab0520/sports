import "dart:ui";

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selectable/selectable.dart';
import 'package:sports/datas/racquet_data.dart';
import 'package:sports/me_page.dart';
import 'package:sports/models/recquet_model.dart';
import 'package:sports/request_detail.dart';
import 'package:sports/request_page.dart';
// import 'package:get/get_table.dart';
import 'package:sports/writting.dart';

import 'main_page.dart';

class TablePage extends StatefulWidget {
  const TablePage({Key? key}) : super(key: key);

  @override
  _TablePageState createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  String? selectedValue;
  String request_id = '';
  String condition = '';
  bool _isLoading = false;

  final formKey = GlobalKey<FormState>();

  List<Racquet> request = [];

  TextEditingController passwordController = TextEditingController();

  getRequest() {
    RacquetRequest_Data.getRequest(condition).then((value) {
      setState(() {
        request = value;
      });
      if (value.length == 0) {
        setState(() {
          _isLoading = false;
        });
      } else {
        setState(() {
          _isLoading = true;
        });
      }
    });
  }

  @override
  void initState() {
    getRequest();
    super.initState();
  }

  var _showSelection = true;

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 1000) {
      top = Container(
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
      );
    } else {
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
    }

    //print(_controller.offset);
    return Scaffold(
      key: formKey,
      body: SafeArea(
          child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 20),
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
                    child: Selectable(
                      child: Text(
                        'Boston Sports Second Hand',
                        style: TextStyle(
                            fontSize: 27,
                            fontFamily: 'NanumSquareEB'
                        ),
                      )
                    ),
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
            Expanded(
              flex: 9,
              child: SingleChildScrollView(
                child: MediaQuery.of(context).size.width > 1000 ?
                Container(
                  width: 2000,
                  padding: EdgeInsets.only(
                    left: 300,
                    right: 300,
                    top: 200,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Restring Service Request List',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(Request_Page());
                            },
                            child: Text(
                              'Request',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.only(left: 17.0, right: 17),
                        width: Get.width,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              // POINT
                              color: Color(0xFFCCCCCC),
                              width: 2.0,
                            ),
                            bottom: BorderSide(
                              // POINT
                              color: Color(0xFFCCCCCC),
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Selectable(
                                showSelection: true,
                                selectWordOnDoubleTap: true,
                                child: Text('Title'),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Selectable(
                                showSelection: _showSelection,
                                selectWordOnDoubleTap: true,
                                child: Center(child: Text('Counts')),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Center(child: Text('Date')),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 17.0, right: 17),
                        width: Get.width,
                        height: 700.0,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              // POINT
                              color: Color(0xFFCCCCCC),
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: _isLoading
                            ? ListView.builder(
                                itemCount: request.length,
                                itemBuilder: (_, int index) {
                                  return InkWell(
                                      onTap: () {
                                        Get.defaultDialog(
                                            title: "Racquet String",
                                            content: Container(
                                              width: 500,
                                              child: Column(
                                                children: [
                                                  SizedBox(
                                                    height: 30.0,
                                                  ),
                                                  SizedBox(
                                                    width: 400.0,
                                                    child: TextField(
                                                      textAlignVertical:
                                                          TextAlignVertical
                                                              .center,
                                                      controller:
                                                          passwordController,
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                      ),
                                                      decoration:
                                                          InputDecoration(
                                                              prefixIcon: Icon(
                                                                  Icons
                                                                      .vpn_key),
                                                              border:
                                                                  InputBorder
                                                                      .none,
                                                              hintText:
                                                                  "Enter your passwords or admin passwords",
                                                              hintStyle:
                                                                  TextStyle(
                                                                fontSize: 12,
                                                              ),
                                                              fillColor: Color(
                                                                  0xffe8e8e8),
                                                              filled: true,
                                                              contentPadding:
                                                                  EdgeInsets.symmetric(
                                                                      horizontal:
                                                                          8.0)),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 20.0,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Expanded(
                                                        child: Container(),
                                                      ),
                                                      Expanded(
                                                          child: InkWell(
                                                        onTap: () {
                                                          Get.back();
                                                        },
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 40.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0xffe6e6e6),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              'Cancel',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                      )),
                                                      SizedBox(
                                                        width: 10.0,
                                                      ),
                                                      Expanded(
                                                        child: InkWell(
                                                          onTap: () {
                                                            print('aaa');
                                                            if (passwordController
                                                                        .text ==
                                                                    request[index]
                                                                        .request_password ||
                                                                passwordController
                                                                        .text ==
                                                                    'admin2580') {
                                                              print('aaaa');
                                                              Get.to(
                                                                  () =>
                                                                      DetailPage(),
                                                                  arguments:
                                                                      '${request[index].request_id}');
                                                            } else {
                                                              print('aaaaa');
                                                              Get.snackbar("실패",
                                                                  "비밀번호가 일치하지 않습니다");
                                                              Get.back();
                                                            }
                                                          },
                                                          child: Container(
                                                            width: 100.0,
                                                            height: 40.0,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color(
                                                                  0xffd48787),
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                'Check',
                                                                style: TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        child: Container(),
                                                      ),
                                                    ],
                                                  )
                                                ],
                                              ),
                                            ));
                                      },
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Expanded(
                                                  flex: 4,
                                                  child: Text(
                                                    '${request[index].request_title}',
                                                    softWrap: false,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    maxLines: 1,
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Center(
                                                      child: Text(
                                                          '${request[index].request_count}')),
                                                ),
                                                Expanded(
                                                  flex: 2,
                                                  child: Center(
                                                      child: Text(
                                                          '${request[index].request_date}'
                                                              .split(" ")[0])),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Divider(
                                            height: 0.1,
                                            thickness: 0.6,
                                            color: Color(0xFFe6e6e6),
                                          )
                                        ],
                                      ));
                                })
                            : Center(
                                child: Text('요청이 없습니다'),
                              ),
                      ),
                    ],
                  ),
                )
                    :
                Container(
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 200,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Restring Service Request List',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(Request_Page());
                            },
                            child: Text(
                              'Request',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.w700),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.only(left: 17.0, right: 17),
                        width: Get.width,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                              // POINT
                              color: Color(0xFFCCCCCC),
                              width: 2.0,
                            ),
                            bottom: BorderSide(
                              // POINT
                              color: Color(0xFFCCCCCC),
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 4,
                              child: Selectable(
                                showSelection: true,
                                selectWordOnDoubleTap: true,
                                child: Text('Title'),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Selectable(
                                showSelection: _showSelection,
                                selectWordOnDoubleTap: true,
                                child: Center(child: Text('Counts')),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Center(child: Text('Date')),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 17.0, right: 17),
                        width: Get.width,
                        height: 700.0,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              // POINT
                              color: Color(0xFFCCCCCC),
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: _isLoading
                            ? ListView.builder(
                            itemCount: request.length,
                            itemBuilder: (_, int index) {
                              return InkWell(
                                  onTap: () {
                                    Get.defaultDialog(
                                        title: "Racquet String",
                                        content: Container(
                                          width: 500,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 30.0,
                                              ),
                                              SizedBox(
                                                width: 400.0,
                                                child: TextField(
                                                  textAlignVertical:
                                                  TextAlignVertical
                                                      .center,
                                                  controller:
                                                  passwordController,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                  decoration:
                                                  InputDecoration(
                                                      prefixIcon: Icon(
                                                          Icons
                                                              .vpn_key),
                                                      border:
                                                      InputBorder
                                                          .none,
                                                      hintText:
                                                      "Enter your passwords or admin passwords",
                                                      hintStyle:
                                                      TextStyle(
                                                        fontSize: 12,
                                                      ),
                                                      fillColor: Color(
                                                          0xffe8e8e8),
                                                      filled: true,
                                                      contentPadding:
                                                      EdgeInsets.symmetric(
                                                          horizontal:
                                                          8.0)),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20.0,
                                              ),
                                              Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(),
                                                  ),
                                                  Expanded(
                                                      child: InkWell(
                                                        onTap: () {
                                                          Get.back();
                                                        },
                                                        child: Container(
                                                          width: 100.0,
                                                          height: 40.0,
                                                          decoration:
                                                          BoxDecoration(
                                                            color: Color(
                                                                0xffe6e6e6),
                                                          ),
                                                          child: Center(
                                                            child: Text(
                                                              'Cancel',
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ),
                                                        ),
                                                      )),
                                                  SizedBox(
                                                    width: 10.0,
                                                  ),
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () {
                                                        print('aaa');
                                                        if (passwordController
                                                            .text ==
                                                            request[index]
                                                                .request_password ||
                                                            passwordController
                                                                .text ==
                                                                'admin2580') {
                                                          print('aaaa');
                                                          Get.to(
                                                                  () =>
                                                                  DetailPage(),
                                                              arguments:
                                                              '${request[index].request_id}');
                                                        } else {
                                                          print('aaaaa');
                                                          Get.snackbar("실패",
                                                              "비밀번호가 일치하지 않습니다");
                                                          Get.back();
                                                        }
                                                      },
                                                      child: Container(
                                                        width: 100.0,
                                                        height: 40.0,
                                                        decoration:
                                                        BoxDecoration(
                                                          color: Color(
                                                              0xffd48787),
                                                        ),
                                                        child: Center(
                                                          child: Text(
                                                            'Check',
                                                            style: TextStyle(
                                                                fontWeight:
                                                                FontWeight
                                                                    .w600,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ));
                                  },
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            vertical: 10.0),
                                        child: Row(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              flex: 4,
                                              child: Text(
                                                '${request[index].request_title}',
                                                softWrap: false,
                                                overflow:
                                                TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                            ),
                                            Expanded(
                                              flex: 3,
                                              child: Center(
                                                  child: Text(
                                                      '${request[index].request_count}')),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Center(
                                                  child: Text(
                                                      '${request[index].request_date}'
                                                          .split(" ")[0])),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Divider(
                                        height: 0.1,
                                        thickness: 0.6,
                                        color: Color(0xFFe6e6e6),
                                      )
                                    ],
                                  ));
                            })
                            : Center(
                          child: Text('요청이 없습니다'),
                        ),
                      ),
                    ],
                  ),
                )
              ),
            ),
          ],
        ),
      )),
      endDrawer: new Drawer(
        child: Drawer(
          child: Container(
            child: ListView(
              children: <Widget>[
                ListTile(
                  tileColor: Color(0xFF0d3949),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.close),
                        onPressed: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(builder: (context) => MainPage()),
                          );
                          print('success');
                        },
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  child: Card(
                      child: InkWell(
                        onTap: () {
                          Get.offAll(MainPage());
                        },
                        child: ListTile(
                          title: Text(
                            'Main',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )),
                ),
                InkWell(
                  child: Card(
                      child: InkWell(
                        onTap: () {
                          Get.to(TablePage());
                        },
                        child: ListTile(
                          title: Text(
                            'Restring Service',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      )),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(MePage());
                    print('success');
                  },
                  child: Card(
                      child: ListTile(
                        title: Text(
                          'About Us',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

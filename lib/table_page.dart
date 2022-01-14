import "dart:ui";

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 920) {
      top = Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: Row(
          children: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(
                  Icons.menu,
                  size: 45,
                  color: Colors.white,
                ), // 햄버거버튼 아이콘 생성
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                  print('menu button is clicked');
                },
              ),
            ),
          ],
        ),
      );
    } else {
      top = Row(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
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
                      icon: Padding(
                          padding: EdgeInsets.only(left: 13),
                          child: Icon(Icons.search))),
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  width: 70,
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
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 50),
          Container(
            width: 120,
            height: 43,
            child: Form(
              key: _formKey,
              child: DropdownButtonFormField2(
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  //Add more decoration as you want here
                  //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                ),
                isExpanded: true,
                hint: Row(
                  children: [
                    Text(
                      '글쓰기',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black45,
                ),
                iconSize: 30,
                buttonHeight: 45,
                buttonPadding: const EdgeInsets.only(left: 20, right: 10),
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                items: map
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 13,
                            ),
                          ),
                        ))
                    .toList(),
                validator: (value) {
                  if (value == null) {
                    return '지역을 골라주세요.';
                  }
                },
                onChanged: (value) {
                  print(value);
                  if (value == "글쓰기") {
                    Get.to(const WritingPage());
                  } else if (value == "구독정보") {
                    Get.to(const TablePage());
                  }
                  //Do something when changing the item if you want.
                },
                onSaved: (value) {
                  selectedValue = value.toString();
                },
              ),
            ),
          ),
        ],
      );
    }

    //print(_controller.offset);
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20),
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
                  const Expanded(
                      child: Text(
                    'Boston Sports Second Hand Market',
                    style: TextStyle(
                      fontSize: 20,
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
                child: Container(
                  width: Get.width,
                  padding: EdgeInsets.only(
                    left: 300,
                    right: 300,
                    top: 200,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width,
                        child: Text(
                          '내 구독정보',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'NanumSquareB',
                          ),
                        ),
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
                              child: Text('합계'),
                            ),
                            Expanded(
                              flex: 3,
                              child: Center(child: Text('내역')),
                            ),
                            Expanded(
                              flex: 2,
                              child: Center(child: Text('날짜')),
                            ),
                            Expanded(
                              flex: 1,
                              child: Center(child: Text('영수증')),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                          shrinkWrap: true,
                          itemCount: 10,
                          itemBuilder: (BuildContext context, int index) {
                            return InkWell(
                              onTap: () {
                                Get.dialog(
                                  AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                      Radius.circular(32),
                                    )),
                                    backgroundColor: Colors.white,
                                    content: SizedBox(
                                      height: 350,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              InkWell(
                                                  onTap: () {
                                                    Get.back();
                                                  },
                                                  child: Icon(Icons.close)),
                                            ],
                                          ),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              width: 200,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF025595),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Stringing Service Price',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                    fontFamily: 'NanumSquareB',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              padding: EdgeInsets.only(
                                                  left: 10, right: 10),
                                              width: 290,
                                              height: 40,
                                              decoration: BoxDecoration(
                                                color: Color(0xFF025595),
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Any types of Tennis or Squash Racket',
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white,
                                                    fontFamily: 'NanumSquareB',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: 15, bottom: 15),
                                                width: 290,
                                                height: 43,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF9F9F9),
                                                  border: Border.all(
                                                    width: 1.0,
                                                    color: Color(0xFFcccccc),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: TextField(
                                                  keyboardType:
                                                      TextInputType.text,
                                                  onChanged: (text) {},
                                                  decoration: InputDecoration(
                                                    hintText: '1 Rocket',
                                                    hintStyle: TextStyle(
                                                      fontSize: 13,
                                                    ),
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      left: 8, right: 8),
                                                  width: 100,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF025595),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '15 USD',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white,
                                                        fontFamily:
                                                            'NanumSquareB',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 20),
                                          Row(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.only(
                                                    left: 15, bottom: 15),
                                                width: 290,
                                                height: 43,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFF9F9F9),
                                                  border: Border.all(
                                                    width: 1.0,
                                                    color: Color(0xFFcccccc),
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: TextField(
                                                  keyboardType:
                                                      TextInputType.text,
                                                  onChanged: (text) {},
                                                  decoration: InputDecoration(
                                                    hintText: '3 Rocket',
                                                    hintStyle: TextStyle(
                                                      fontSize: 13,
                                                    ),
                                                    border: InputBorder.none,
                                                  ),
                                                ),
                                              ),
                                              InkWell(
                                                onTap: () {},
                                                child: Container(
                                                  margin: EdgeInsets.only(
                                                      left: 8, right: 8),
                                                  width: 100,
                                                  height: 40,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFF025595),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      '40 USD',
                                                      style: TextStyle(
                                                        fontSize: 15,
                                                        color: Colors.white,
                                                        fontFamily:
                                                            'NanumSquareB',
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 40),
                                          Center(
                                            child: InkWell(
                                              onTap: () {},
                                              child: Container(
                                                margin: EdgeInsets.only(
                                                    left: 8, right: 8),
                                                padding: EdgeInsets.only(
                                                    left: 10, right: 10),
                                                width: 290,
                                                height: 40,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFF025595),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                ),
                                                child: Center(
                                                  child: Text(
                                                    '저장',
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Colors.white,
                                                      fontFamily:
                                                          'NanumSquareB',
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                padding: EdgeInsets.only(left: 17.0, right: 17),
                                width: Get.width,
                                height: 40,
                                decoration: BoxDecoration(
                                  border: Border(
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
                                      child: Text('\$10'),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Center(child: Text('멤버십 PRO')),
                                    ),
                                    Expanded(
                                      flex: 2,
                                      child: Center(child: Text('2021.10.14')),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Center(child: Text('인보이스')),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

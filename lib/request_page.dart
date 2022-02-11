import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports/datas/racquet_data.dart';
import 'package:sports/main_page.dart';
import 'package:sports/me_page.dart';
import 'package:sports/table_page.dart';
import 'package:sports/writting.dart';

class Request_Page extends StatefulWidget {
  @override
  _Request_PageState createState() => _Request_PageState();
}

class _Request_PageState extends State<Request_Page> {
  String? selectedValue;
  String request_id = '';

  final formKey = GlobalKey<FormState>();

  TextEditingController titleController = TextEditingController();
  TextEditingController countController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  insertRequest() {
    RacquetRequest_Data.insertRequest(
            request_id,
            titleController.text,
            phoneController.text,
            countController.text,
            contentController.text,
            passwordController.text)
        .then((value) {
      if (value == 'success') {
        print('insert request success');
        Get.off(TablePage());
      } else {
        print('insert request fail');
        Get.snackbar("Request Fail", 'Request Fail. Retry please');
      }
    });
  }

  @override
  void initState() {
    request_id = generateRandomString(8);
    print(request_id);
    super.initState();
  }

  String generateRandomString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 1170) {
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
                      Get.off(MainPage());
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
                child: MediaQuery.of(context).size.width > 1170 ?
                Container(
                  width: 1300,
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
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Restring Service Request',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 70),
                      Container(
                        width: Get.width,
                        child: TextField(
                          maxLength: 30,
                          controller: titleController,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Title",
                              hintStyle: TextStyle(
                                fontSize: 12,
                              ),
                              fillColor: Color(0xffe8e8e8),
                              filled: true,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8.0)),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 4,
                            child: TextField(
                              controller: phoneController,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Phone Number",
                                  hintStyle: TextStyle(
                                    fontSize: 12,
                                  ),
                                  fillColor: Color(0xffe8e8e8),
                                  filled: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 8.0)),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            flex: 4,
                            child: TextField(
                              controller: countController,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                  suffix: Text(
                                    '1 Racquet = 15USD',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  border: InputBorder.none,
                                  hintText: "# of Rackets",
                                  hintStyle: TextStyle(
                                    fontSize: 12,
                                  ),
                                  fillColor: Color(0xffe8e8e8),
                                  filled: true,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 8.0)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.only(left: 15, bottom: 10),
                        width: Get.width,
                        height: 400,
                        decoration: BoxDecoration(
                          color: Color(0xFFF9F9F9),
                          border: Border.all(
                            width: 1.0,
                            color: Color(0xFFcccccc),
                          ),
                        ),
                        child: TextField(
                          controller: contentController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          onChanged: (text) {},
                          decoration: InputDecoration(
                            hintText: 'Request details',
                            hintStyle: TextStyle(
                              fontSize: 13,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: TextField(
                                textAlignVertical: TextAlignVertical.center,
                                controller: passwordController,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.vpn_key),
                                    border: InputBorder.none,
                                    hintText: "passwords",
                                    hintStyle: TextStyle(
                                      fontSize: 12,
                                    ),
                                    fillColor: Color(0xffe8e8e8),
                                    filled: true,
                                    contentPadding:
                                        EdgeInsets.symmetric(horizontal: 8.0)),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: Get.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                      width: 90,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFFD9D9D9),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      if (titleController.text != '' &&
                                          contentController.text != '' &&
                                          passwordController.text != '' &&
                                          phoneController.text != '' &&
                                          countController.text != '') {
                                        insertRequest();
                                      } else {
                                        Get.snackbar(
                                            'Fail', 'empty!!');
                                      }
                                    },
                                    child: Container(
                                      width: 90,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFF025595),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Done',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 100.0,
                      )
                    ],
                  ),
                )
                    :
                Container(
                  width: 500,
                  padding: EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 200,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Restring Service Request',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 70),
                      Container(
                        width: Get.width,
                        child: TextField(
                          maxLength: 30,
                          controller: titleController,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "Title",
                              hintStyle: TextStyle(
                                fontSize: 12,
                              ),
                              fillColor: Color(0xffe8e8e8),
                              filled: true,
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 8.0)),
                        ),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 4,
                            child: TextField(
                              controller: phoneController,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Phone Number",
                                  hintStyle: TextStyle(
                                    fontSize: 12,
                                  ),
                                  fillColor: Color(0xffe8e8e8),
                                  filled: true,
                                  contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8.0)),
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                            flex: 4,
                            child: TextField(
                              controller: countController,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                  suffix: Text(
                                    '1 Racquet = 15USD',
                                    style:
                                    TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  border: InputBorder.none,
                                  hintText: "# of Rackets",
                                  hintStyle: TextStyle(
                                    fontSize: 12,
                                  ),
                                  fillColor: Color(0xffe8e8e8),
                                  filled: true,
                                  contentPadding:
                                  EdgeInsets.symmetric(horizontal: 8.0)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.only(left: 15, bottom: 10),
                        width: Get.width,
                        height: 400,
                        decoration: BoxDecoration(
                          color: Color(0xFFF9F9F9),
                          border: Border.all(
                            width: 1.0,
                            color: Color(0xFFcccccc),
                          ),
                        ),
                        child: TextField(
                          controller: contentController,
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          onChanged: (text) {},
                          decoration: InputDecoration(
                            hintText: 'Request details',
                            hintStyle: TextStyle(
                              fontSize: 13,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        child: TextField(
                          textAlignVertical: TextAlignVertical.center,
                          controller: passwordController,
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.vpn_key),
                              border: InputBorder.none,
                              hintText: "passwords",
                              hintStyle: TextStyle(
                                fontSize: 12,
                              ),
                              fillColor: Color(0xffe8e8e8),
                              filled: true,
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 8.0)),
                        ),
                      ),
                      SizedBox(height: 20),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: SizedBox(
                              width: Get.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                      width: 90,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFFD9D9D9),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Cancel',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  InkWell(
                                    onTap: () {
                                      if (titleController.text != '' &&
                                          contentController.text != '' &&
                                          passwordController.text != '' &&
                                          phoneController.text != '' &&
                                          countController.text != '') {
                                        insertRequest();
                                      } else {
                                        Get.snackbar(
                                            'Fail', 'empty!!');
                                      }
                                    },
                                    child: Container(
                                      width: 90,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFF025595),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Done',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 100.0,
                      )
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

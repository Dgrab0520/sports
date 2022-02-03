import 'dart:math';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports/datas/racquet_data.dart';
import 'package:sports/main_page.dart';
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
              key: formKey,
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
                  if (value == "글쓰기") {
                    Get.off(WritingPage());
                  } else if (value == "구독정보") {
                    Get.off(TablePage());
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
                      'Boston Sports Second Hand Market',
                      style: TextStyle(
                        fontSize: 20,
                      ),
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
                              'Rqcquet String Request',
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
                              hintText: "제목을 입력해주세요",
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
                                  hintText: "연락처를 입력해주세요",
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
                                  hintText: "라켓 수량을 입력해주세요",
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
                            hintText: '라켓 종류, 사이즈 등 상세한 내용을 입력해주세요',
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
                                    hintText: "비밀번호를 설정해주세요(6글자)",
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
                                          '취소',
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
                                            '요청 실패', '입력되지 않은 항목이 있습니다');
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
                                          '등록',
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
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

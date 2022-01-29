import "dart:ui";

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports/table_page.dart';

import 'main_page.dart';

class WritingPage extends StatefulWidget {
  const WritingPage({Key? key}) : super(key: key);

  @override
  _WritingPageState createState() => _WritingPageState();
}

class _WritingPageState extends State<WritingPage> {
  String? selectedValue;
  String _selectedValue = '카테고리를 선택하세요';

  TextEditingController itemController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController addressController = TextEditingController();

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
                  if (value == "글쓰기") {
                    Get.to(WritingPage());
                  } else if (value == "구독정보") {
                    Get.to(TablePage());
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
                      Get.to(MainPage());
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
              child: MediaQuery.of(context).size.width < 1500
                  ? SingleChildScrollView(
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
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '포럼 글쓰기',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: 70,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(5),
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
                                  onTap: () {},
                                  child: Container(
                                    width: 70,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(5),
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
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.only(left: 15, bottom: 10),
                        width: Get.width,
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
                            hintText: '제목을 입력해주세요.',
                            hintStyle: TextStyle(
                              fontSize: 13,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
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
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          onChanged: (text) {},
                          decoration: InputDecoration(
                            hintText: '내용을 입력해주세요.',
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
                          Container(
                            padding:
                            EdgeInsets.only(left: 15, bottom: 10),
                            width: 200,
                            height: 43,
                            decoration: BoxDecoration(
                              color: Color(0xFFF9F9F9),
                              border: Border.all(
                                width: 1.0,
                                color: Color(0xFFcccccc),
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          SizedBox(width: 10),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 100,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Color(0xFFD9D9D9),
                              ),
                              child: Center(
                                child: Text(
                                  '파일열기',
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
                  : SingleChildScrollView(
                child: Container(
                  width: 1400,
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
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '상품 등록하기',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'NanumSquareB',
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 70),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 4,
                            child: Container(
                              child: TextField(
                                maxLength: 30,
                                controller: itemController,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: "상품명을 입력해주세요",
                                    hintStyle: TextStyle(
                                      fontSize: 12,
                                    ),
                                    fillColor: Color(0xffe8e8e8),
                                    filled: true,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0)
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0,),
                          Expanded(
                              flex: 1,
                              child: DropdownButtonFormField<String>(
                                value: _selectedValue,
                                onChanged: (String? newValue){
                                  setState(() {
                                    _selectedValue = newValue!;
                                  });
                                  print(_selectedValue);
                                },
                                items: <String>[
                                  '카테고리를 선택하세요',
                                  '여성의류', '남성의류', '신발', '가방', '시계/쥬얼리', '악세사리', '디지털',
                                  '가전', '스포츠/레저', '굿즈', '키덜트', '예술작품/수집품', '음반/악기', '도서/티켓/문구',
                                  '뷰티/미용', '가구/인테리어', '생활/가공식품', '유아동/출산', '반려동물', '기타'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text('$value', style: TextStyle(fontSize: 12.0, color: Colors.grey),),
                                  );
                                }).toList(),
                              )
                          ),
                        ],
                      ),

                      SizedBox(height: 10.0,),
                      Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: TextField(
                                textAlignVertical: TextAlignVertical.center,
                                controller: priceController,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                decoration: InputDecoration(
                                    prefixIcon: Icon(CupertinoIcons.money_dollar),
                                    border: InputBorder.none,
                                    hintText: "상품 가격을 입력해주세요",
                                    hintStyle: TextStyle(
                                      fontSize: 12,
                                    ),
                                    fillColor: Color(0xffe8e8e8),
                                    filled: true,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0)
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 20.0,),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: TextField(
                                textAlignVertical: TextAlignVertical.center,
                                controller: addressController,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                                decoration: InputDecoration(
                                    prefixIcon: Icon(CupertinoIcons.home),
                                    border: InputBorder.none,
                                    hintText: "판매 지역을 입력해주세요",
                                    hintStyle: TextStyle(
                                      fontSize: 12,
                                    ),
                                    fillColor: Color(0xffe8e8e8),
                                    filled: true,
                                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0)
                                ),
                              ),
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
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          onChanged: (text) {},
                          decoration: InputDecoration(
                            hintText: '상세 내용을 입력해주세요',
                            hintStyle: TextStyle(
                              fontSize: 13,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        '상품 이미지',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'NanumSquareR',
                          color: Colors.black87
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: Get.width,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                padding:
                                EdgeInsets.only(left: 15, bottom: 10),
                                width: 200,
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
                                  enabled: false,
                                  keyboardType: TextInputType.text,
                                  onChanged: (text) {},
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                      fontSize: 13,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(5),
                                    color: Color(0xFFD9D9D9),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '파일열기',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: Get.width,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                padding:
                                EdgeInsets.only(left: 15, bottom: 10),
                                width: 200,
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
                                  enabled: false,
                                  keyboardType: TextInputType.text,
                                  onChanged: (text) {},
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                      fontSize: 13,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(5),
                                    color: Color(0xFFD9D9D9),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '파일열기',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: Get.width,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                padding:
                                EdgeInsets.only(left: 15, bottom: 10),
                                width: 200,
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
                                  enabled: false,
                                  keyboardType: TextInputType.text,
                                  onChanged: (text) {},
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                      fontSize: 13,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(5),
                                    color: Color(0xFFD9D9D9),
                                  ),
                                  child: Center(
                                    child: Text(
                                      '파일열기',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 50),
                      SizedBox(
                        width: Get.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {Get.back();},
                              child: Container(
                                width: 90,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(5),
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
                              onTap: () {},
                              child: Container(
                                width: 90,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(5),
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
                      SizedBox(height: 100.0,)

                    ],
                  ),
                ),
              )

            ),
          ],
        ),
      )),
    );
  }
}

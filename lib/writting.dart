import 'dart:convert';
import 'dart:js';
import "dart:ui";
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports/sub_page.dart';
import 'package:sports/table_page.dart';

import 'main_page.dart';


List<Widget> slide = [
  Container(
    width:Get.width,
    padding: EdgeInsets.only(left:300,right:300,top:200,),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            width:Get.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('포럼 글쓰기',
                  style:TextStyle(
                    fontSize:20,
                    fontFamily: 'NanumSquareB',
                  ),
                ),
                Row(
                  children: [
                    InkWell(
                      onTap:(){
                      },
                      child: Container(
                        width:70,
                        height:30,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color:Color(0xFFD9D9D9),
                        ),
                        child: Center(
                          child: Text('취소',
                            style:TextStyle(
                              fontSize:16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width:10),
                    InkWell(
                      onTap:(){
                      },
                      child: Container(
                        width:70,
                        height:30,
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color:Color(0xFF025595),
                        ),
                        child: Center(
                          child: Text('등록',
                            style:TextStyle(
                              color:Colors.white,
                              fontSize:16,
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
        SizedBox(height:30),
        Container(
          padding: EdgeInsets.only(left:15,bottom:10),
          width:Get.width,
          height:43,
          decoration:BoxDecoration(
            color: Colors.white,
            border: Border.all(
              width: 1.0,
              color: Color(0xFFcccccc),
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            keyboardType: TextInputType.text,
            onChanged: (text){
            },
            decoration: InputDecoration(
              hintText: '제목을 입력해주세요.',
                hintStyle: TextStyle(
                  fontSize:13,
                ),
                border: InputBorder.none,
               ),
          ),
        ),
        SizedBox(height:30),
        Container(
          padding: EdgeInsets.only(left:15,bottom:10),
          width:Get.width,
          height:400,
          decoration:BoxDecoration(
            color: Color(0xFFF9F9F9),
            border: Border.all(
              width: 1.0,
              color: Color(0xFFcccccc),
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          child: TextField(
            keyboardType: TextInputType.text,
            onChanged: (text){
            },
            decoration: InputDecoration(
              hintText: '제목을 입력해주세요.',
              hintStyle: TextStyle(
                fontSize:13,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
        SizedBox(height:30),
        Row(
          children: [
            Container(
              padding: EdgeInsets.only(left:15,bottom:10),
              width:200,
              height:43,
              decoration:BoxDecoration(
                color: Color(0xFFF9F9F9),
                border: Border.all(
                  width: 1.0,
                  color: Color(0xFFcccccc),
                ),
                borderRadius: BorderRadius.circular(5),
              ),
              child: TextField(
                keyboardType: TextInputType.text,
                onChanged: (text){
                },
                decoration: InputDecoration(
                  hintStyle: TextStyle(
                    fontSize:13,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(width:10),
            InkWell(
              onTap:(){
              },
              child: Container(
                width:100,
                height:40,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color:Color(0xFFD9D9D9),
                ),
                child: Center(
                  child: Text('파일열기',
                    style:TextStyle(
                      fontSize:16,
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
    ];



List<Widget> slide2 = [
  Container(
    child: Text('xxxx'),
  ),
];

late Widget top;

class WritingPage extends StatefulWidget {
  @override
  _WritingPageState createState() => _WritingPageState();
}

class _WritingPageState extends State<WritingPage> {
  List<String> map = [
    '글쓰기',
    '구독정보',
  ];

  String? selectedValue;

  final _formKey = GlobalKey<FormState>();
  PageController _controller = PageController(initialPage: 490);
  double i = 0;

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
                  color:Colors.white,
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
                margin: EdgeInsets.only(left:15,right:15),
                width:350,
                height:43,
                decoration:BoxDecoration(
                  color: Color(0xFFF9F9F9),
                  border: Border.all(
                    width: 1.0,
                    color: Color(0xFFcccccc),
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  keyboardType: TextInputType.text,
                  onChanged: (text){
                  },
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      icon: Padding(
                          padding: EdgeInsets.only(left: 13),
                          child: Icon(Icons.search))),
                ),
              ),
              InkWell(
                onTap:(){

                },
                child: Container(
                  width:70,
                  height:43,
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color:Color(0xFF025595),
                  ),
                  child: Center(
                    child: Text('search',
                      style: TextStyle(
                        color:Colors.white,
                        fontSize:18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width:50),
          Container(
            width:120,
            height:43,
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
                    .map((item) =>
                    DropdownMenuItem<String>(
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
                  if (value == "글쓰기"){
                    Get.to(WritingPage());
                  }else if (value == "구독정보"){
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
            color:Colors.white,
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
                      Expanded(
                          child: Row(
                            children: [
                              Text('Boston Sports Second Hand Market',
                                style:TextStyle(
                                  fontSize:20,
                                ),
                              ),
                            ],
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
                  flex:9,
                 child: SingleChildScrollView(
                   child: Container(
                      width:Get.width,
                      padding: EdgeInsets.only(left:300,right:300,top:200,),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width:Get.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('포럼 글쓰기',
                                  style:TextStyle(
                                    fontSize:20,
                                    fontFamily: 'NanumSquareB',
                                  ),
                                ),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap:(){
                                      },
                                      child: Container(
                                        width:70,
                                        height:30,
                                        decoration:BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color:Color(0xFFD9D9D9),
                                        ),
                                        child: Center(
                                          child: Text('취소',
                                            style:TextStyle(
                                              fontSize:16,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width:10),
                                    InkWell(
                                      onTap:(){
                                      },
                                      child: Container(
                                        width:70,
                                        height:30,
                                        decoration:BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color:Color(0xFF025595),
                                        ),
                                        child: Center(
                                          child: Text('등록',
                                            style:TextStyle(
                                              color:Colors.white,
                                              fontSize:16,
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
                          SizedBox(height:30),
                          Container(
                            padding: EdgeInsets.only(left:15,bottom:10),
                            width:Get.width,
                            height:43,
                            decoration:BoxDecoration(
                              color: Color(0xFFF9F9F9),
                              border: Border.all(
                                width: 1.0,
                                color: Color(0xFFcccccc),
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              onChanged: (text){
                              },
                              decoration: InputDecoration(
                                hintText: '제목을 입력해주세요.',
                                hintStyle: TextStyle(
                                  fontSize:13,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(height:30),
                          Container(
                            padding: EdgeInsets.only(left:15,bottom:10),
                            width:Get.width,
                            height:400,
                            decoration:BoxDecoration(
                              color: Color(0xFFF9F9F9),
                              border: Border.all(
                                width: 1.0,
                                color: Color(0xFFcccccc),
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: TextField(
                              keyboardType: TextInputType.text,
                              onChanged: (text){
                              },
                              decoration: InputDecoration(
                                hintText: '제목을 입력해주세요.',
                                hintStyle: TextStyle(
                                  fontSize:13,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          SizedBox(height:30),
                          Row(
                            children: [
                              Container(
                                padding: EdgeInsets.only(left:15,bottom:10),
                                width:200,
                                height:43,
                                decoration:BoxDecoration(
                                  color: Color(0xFFF9F9F9),
                                  border: Border.all(
                                    width: 1.0,
                                    color: Color(0xFFcccccc),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: TextField(
                                  keyboardType: TextInputType.text,
                                  onChanged: (text){
                                  },
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                      fontSize:13,
                                    ),
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                              SizedBox(width:10),
                              InkWell(
                                onTap:(){
                                },
                                child: Container(
                                  width:100,
                                  height:40,
                                  decoration:BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color:Color(0xFFD9D9D9),
                                  ),
                                  child: Center(
                                    child: Text('파일열기',
                                      style:TextStyle(
                                        fontSize:16,
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
                  tileColor: Color(0xFFf1892c),
                  leading: IconButton(
                    icon: Icon(Icons.home_filled),
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => MainPage()),
                      );
                      print('success');
                    },
                    color: Colors.white,
                  ),
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

                        },
                        child: ListTile(
                          title: Text(
                            'EMDR',
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


                        },
                        child: ListTile(
                          title: Text(
                            'BRAIN EXERCISE',
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainPage()),
                    );
                    print('success');
                  },
                  child: Card(
                      child: ListTile(
                        title: Text(
                          'COMPANY',
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

class DetailScreen extends StatelessWidget {
  DetailScreen(this.i, {Key? key}) : super(key: key);
  int i;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        child: Center(
          child: Hero(
            tag: 'patent_$i',
            child: Image.asset("assets/patent_$i.jpg"),
          ),
        ),
        onTap: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}

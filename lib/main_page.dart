import 'dart:convert';
import "dart:ui";
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports/sub_page.dart';
import 'package:sports/table_page.dart';
import 'package:sports/writting.dart';



TextEditingController nameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController commentController = TextEditingController();
TextEditingController urlController = TextEditingController();

List<Widget> slide = [
  ListView(
        children: [
          SizedBox(height:200),
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment:Alignment.center,
                  child: InkWell(
                    onTap:(){
                      Get.to(SubPage());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/img1.png", width:200, height:200),
                        SizedBox(height:5),
                        Text('우드선반',
                          style: TextStyle(
                              fontSize:14,
                              fontFamily:'NanumSquareR'
                          ),
                        ),
                        SizedBox(height:5),
                        Text('2,000원',
                          style: TextStyle(
                              fontSize:15,
                              fontFamily:'NanumSquareB'
                          ),
                        ),
                        SizedBox(height:5),
                        Text('서울 송파구 가락동',
                          style: TextStyle(
                              fontSize:12,
                              fontFamily:'NanumSquareR'
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment:Alignment.center,
                  child: InkWell(
                    onTap:(){
                      Get.to(WritingPage());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/img2.png", width:200, height:200),
                        SizedBox(height:5),
                        Text('우드선반',
                          style: TextStyle(
                              fontSize:14,
                              fontFamily:'NanumSquareR'
                          ),
                        ),
                        SizedBox(height:5),
                        Text('2,000원',
                          style: TextStyle(
                              fontSize:15,
                              fontFamily:'NanumSquareB'
                          ),
                        ),
                        SizedBox(height:5),
                        Text('서울 송파구 가락동',
                          style: TextStyle(
                              fontSize:12,
                              fontFamily:'NanumSquareR'
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment:Alignment.center,
                  child: InkWell(
                    onTap:(){
                      Get.to(TablePage());
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset("assets/img3.png", width:200, height:200),
                        SizedBox(height:5),
                        Text('우드선반',
                          style: TextStyle(
                              fontSize:14,
                              fontFamily:'NanumSquareR'
                          ),
                        ),
                        SizedBox(height:5),
                        Text('2,000원',
                          style: TextStyle(
                              fontSize:15,
                              fontFamily:'NanumSquareB'
                          ),
                        ),
                        SizedBox(height:5),
                        Text('서울 송파구 가락동',
                          style: TextStyle(
                              fontSize:12,
                              fontFamily:'NanumSquareR'
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment:Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/img4.png", width:200, height:200),
                      SizedBox(height:5),
                      Text('우드선반',
                        style: TextStyle(
                            fontSize:14,
                            fontFamily:'NanumSquareR'
                        ),
                      ),
                      SizedBox(height:5),
                      Text('2,000원',
                        style: TextStyle(
                            fontSize:15,
                            fontFamily:'NanumSquareB'
                        ),
                      ),
                      SizedBox(height:5),
                      Text('서울 송파구 가락동',
                        style: TextStyle(
                            fontSize:12,
                            fontFamily:'NanumSquareR'
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment:Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/img1.png", width:200, height:200),
                      SizedBox(height:5),
                      Text('우드선반',
                        style: TextStyle(
                            fontSize:14,
                            fontFamily:'NanumSquareR'
                        ),
                      ),
                      SizedBox(height:5),
                      Text('2,000원',
                        style: TextStyle(
                            fontSize:15,
                            fontFamily:'NanumSquareB'
                        ),
                      ),
                      SizedBox(height:5),
                      Text('서울 송파구 가락동',
                        style: TextStyle(
                            fontSize:12,
                            fontFamily:'NanumSquareR'
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height:50),
          Row(
            children: [
              Expanded(
                child: Align(
                  alignment:Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/img1.png", width:200, height:200),
                      SizedBox(height:5),
                      Text('우드선반',
                        style: TextStyle(
                            fontSize:14,
                            fontFamily:'NanumSquareR'
                        ),
                      ),
                      SizedBox(height:5),
                      Text('2,000원',
                        style: TextStyle(
                            fontSize:15,
                            fontFamily:'NanumSquareB'
                        ),
                      ),
                      SizedBox(height:5),
                      Text('서울 송파구 가락동',
                        style: TextStyle(
                            fontSize:12,
                            fontFamily:'NanumSquareR'
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment:Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/img2.png", width:200, height:200),
                      SizedBox(height:5),
                      Text('우드선반',
                        style: TextStyle(
                            fontSize:14,
                            fontFamily:'NanumSquareR'
                        ),
                      ),
                      SizedBox(height:5),
                      Text('2,000원',
                        style: TextStyle(
                            fontSize:15,
                            fontFamily:'NanumSquareB'
                        ),
                      ),
                      SizedBox(height:5),
                      Text('서울 송파구 가락동',
                        style: TextStyle(
                            fontSize:12,
                            fontFamily:'NanumSquareR'
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment:Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/img3.png", width:200, height:200),
                      SizedBox(height:5),
                      Text('우드선반',
                        style: TextStyle(
                            fontSize:14,
                            fontFamily:'NanumSquareR'
                        ),
                      ),
                      SizedBox(height:5),
                      Text('2,000원',
                        style: TextStyle(
                            fontSize:15,
                            fontFamily:'NanumSquareB'
                        ),
                      ),
                      SizedBox(height:5),
                      Text('서울 송파구 가락동',
                        style: TextStyle(
                            fontSize:12,
                            fontFamily:'NanumSquareR'
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment:Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/img4.png", width:200, height:200),
                      SizedBox(height:5),
                      Text('우드선반',
                        style: TextStyle(
                            fontSize:14,
                            fontFamily:'NanumSquareR'
                        ),
                      ),
                      SizedBox(height:5),
                      Text('2,000원',
                        style: TextStyle(
                            fontSize:15,
                            fontFamily:'NanumSquareB'
                        ),
                      ),
                      SizedBox(height:5),
                      Text('서울 송파구 가락동',
                        style: TextStyle(
                            fontSize:12,
                            fontFamily:'NanumSquareR'
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment:Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset("assets/img1.png", width:200, height:200),
                      SizedBox(height:5),
                      Text('우드선반',
                        style: TextStyle(
                            fontSize:14,
                            fontFamily:'NanumSquareR'
                        ),
                      ),
                      SizedBox(height:5),
                      Text('2,000원',
                        style: TextStyle(
                            fontSize:15,
                            fontFamily:'NanumSquareB'
                        ),
                      ),
                      SizedBox(height:5),
                      Text('서울 송파구 가락동',
                        style: TextStyle(
                            fontSize:12,
                            fontFamily:'NanumSquareR'
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
];

List<Widget> slide2 = [
  Container(
    child: Text('xxxx'),
  ),
];

late Widget top;

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
                SizedBox(height:200),
                Expanded(
                  flex: 9,
                  child:ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      itemBuilder: (BuildContext context, int index){
                        return   SizedBox(
                          height:400,
                          child: Row(
                            children: [
                              Expanded(
                                child: Align(
                                  alignment:Alignment.center,
                                  child: InkWell(
                                    onTap:(){
                                      Get.to(SubPage());
                                    },
                                    child: InkWell(
                                      onTap:(){
                                        Get.to(SubPage());
                                      },
                                      child: Container(

                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Image.asset("assets/img1.png", width:200, height:200),
                                            SizedBox(height:5),
                                            Text('우드선반',
                                              style: TextStyle(
                                                  fontSize:14,
                                                  fontFamily:'NanumSquareR'
                                              ),
                                            ),
                                            SizedBox(height:5),
                                            Text('2,000원',
                                              style: TextStyle(
                                                  fontSize:15,
                                                  fontFamily:'NanumSquareB'
                                              ),
                                            ),
                                            SizedBox(height:5),
                                            Text('서울 송파구 가락동',
                                              style: TextStyle(
                                                  fontSize:12,
                                                  fontFamily:'NanumSquareR'
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment:Alignment.center,
                                  child: InkWell(
                                    onTap:(){
                                      Get.to(SubPage());
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image.asset("assets/img2.png", width:200, height:200),
                                        SizedBox(height:5),
                                        Text('우드선반',
                                          style: TextStyle(
                                              fontSize:14,
                                              fontFamily:'NanumSquareR'
                                          ),
                                        ),
                                        SizedBox(height:5),
                                        Text('2,000원',
                                          style: TextStyle(
                                              fontSize:15,
                                              fontFamily:'NanumSquareB'
                                          ),
                                        ),
                                        SizedBox(height:5),
                                        Text('서울 송파구 가락동',
                                          style: TextStyle(
                                              fontSize:12,
                                              fontFamily:'NanumSquareR'
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment:Alignment.center,
                                  child: InkWell(
                                    onTap:(){
                                      Get.to(SubPage());
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image.asset("assets/img3.png", width:200, height:200),
                                        SizedBox(height:5),
                                        Text('우드선반',
                                          style: TextStyle(
                                              fontSize:14,
                                              fontFamily:'NanumSquareR'
                                          ),
                                        ),
                                        SizedBox(height:5),
                                        Text('2,000원',
                                          style: TextStyle(
                                              fontSize:15,
                                              fontFamily:'NanumSquareB'
                                          ),
                                        ),
                                        SizedBox(height:5),
                                        Text('서울 송파구 가락동',
                                          style: TextStyle(
                                              fontSize:12,
                                              fontFamily:'NanumSquareR'
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment:Alignment.center,
                                  child: InkWell(
                                    onTap:(){
                                      Get.to(SubPage());
                                    },
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Image.asset("assets/img4.png", width:200, height:200),
                                        SizedBox(height:5),
                                        Text('우드선반',
                                          style: TextStyle(
                                              fontSize:14,
                                              fontFamily:'NanumSquareR'
                                          ),
                                        ),
                                        SizedBox(height:5),
                                        Text('2,000원',
                                          style: TextStyle(
                                              fontSize:15,
                                              fontFamily:'NanumSquareB'
                                          ),
                                        ),
                                        SizedBox(height:5),
                                        Text('서울 송파구 가락동',
                                          style: TextStyle(
                                              fontSize:12,
                                              fontFamily:'NanumSquareR'
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),

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

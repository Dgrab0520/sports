import "dart:ui";

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports/datas/racquet_data.dart';
import 'package:sports/models/recquet_model.dart';
import 'package:sports/request_detail.dart';
import 'package:sports/request_page.dart';
// import 'package:get/get_table.dart';
import 'package:sports/writting.dart';
import 'package:selectable/selectable.dart';

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

  List<Racquet> request = [];

  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();






  getRequest(){
    RacquetRequest_Data.getRequest(condition).then((value){
      setState(() {
        request = value;
      });
      if(value.length == 0){
        setState(() {
          _isLoading = false;
        });
      }else{
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
                        bottom: 8,  // HERE THE IMPORTANT PART
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
                      'Racquet',
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
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
                  } else if (value == "Racquet String") {
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
        padding: EdgeInsets.only(top:20),
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
                        onTap:(){
                          Get.to(MainPage());
                        },
                        child: Selectable(
                          child: Text(
                            'Boston Sports Second Hand Market',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      )
                   ),
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Racquet String Request List',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'NanumSquareB',
                            ),
                          ),
                          TextButton(
                            onPressed: (){
                              Get.to(Request_Page());
                            },
                            child: Text(
                              'Request',
                              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
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
                        child: _isLoading ? ListView.builder(
                            itemCount: request.length,
                            itemBuilder: (_, int index){
                              return InkWell(
                                onTap: (){
                                  Get.defaultDialog(
                                      title: "Racquet String",
                                      content: Container(
                                        width: 500,
                                        child: Column(
                                          children: [
                                            Text('요청서를 확인하시겠습니?'),
                                            SizedBox(height: 30.0,),
                                            SizedBox(
                                              width: 400.0,
                                              child: TextField(
                                                textAlignVertical: TextAlignVertical.center,
                                                controller: passwordController,
                                                style: TextStyle(
                                                  fontSize: 15,
                                                ),
                                                decoration: InputDecoration(
                                                    prefixIcon: Icon(Icons.vpn_key),
                                                    border: InputBorder.none,
                                                    hintText: "비밀번호 또는 관리자 인증을 진행해주세요",
                                                    hintStyle: TextStyle(
                                                      fontSize: 12,
                                                    ),
                                                    fillColor: Color(0xffe8e8e8),
                                                    filled: true,
                                                    contentPadding: EdgeInsets.symmetric(horizontal: 8.0)
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 20.0,),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                  ),
                                                ),
                                                Expanded(
                                                  child: InkWell(
                                                    onTap: (){Get.back();},
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: Color(0xffe6e6e6),
                                                      ),
                                                      child: Center(
                                                        child: Text('Cancel', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),
                                                      ),
                                                    ),
                                                  )
                                                ),
                                                SizedBox(width: 10.0,),

                                                Expanded(
                                                  child: InkWell(
                                                    onTap: (){
                                                      print('aaa');
                                                      if(passwordController.text == request[index].request_password || passwordController.text == 'admin2580'){
                                                        print('aaaa');
                                                        Get.to(() => DetailPage(), arguments: '${request[index].request_id}');
                                                      }else{
                                                        print('aaaaa');
                                                        Get.snackbar("실패", "비밀번호가 일치하지 않습니다");
                                                        Get.back();
                                                      }
                                                    },
                                                    child: Container(
                                                      width: 100.0,
                                                      height: 40.0,
                                                      decoration: BoxDecoration(
                                                        color: Color(0xffd48787),
                                                      ),
                                                      child: Center(
                                                        child: Text('Check', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Container(
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                  );
                                },
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(vertical: 10.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 4,
                                            child: Text('${request[index].request_title}', softWrap: false, overflow: TextOverflow.ellipsis, maxLines: 1,),
                                          ),
                                          Expanded(
                                            flex: 3,
                                            child: Center(child: Text('${request[index].request_count}')),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Center(child: Text('${request[index].request_date}'.split(" ")[0])),
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
                                )
                              );
                            }
                        ) : Center(child: Text('요청이 없습니다'),),

                      ),
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

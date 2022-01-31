import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:sports/datas/racquet_data.dart';
import 'package:sports/main_page.dart';
import 'package:sports/models/recquet_model.dart';
import 'package:sports/table_page.dart';
import 'package:sports/writting.dart';

class DetailPage extends StatefulWidget{
  @override
  _DetailPage_State createState() => _DetailPage_State();
}

class _DetailPage_State extends State<DetailPage>{

  final _formKey = GlobalKey<FormState>();

  String? selectedValue;
  String request_id = '';
  String condition = '';
  bool _isLoading = false;

  List<Racquet> request = [];

  @override
  void initState(){
    request_id = Get.arguments;
    condition = "WHERE request_id = '$request_id'";
    print('condition : $condition');
    getRequest();
    super.initState();
  }

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
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
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
                            height: 40.0,
                            child: _isLoading ? Text('${request[0].request_title}') : Container(),
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 40.0,
                                  width: Get.width,
                                  child: Text('phone'),
                                )
                              ),
                              SizedBox(width: 10.0,),
                              Expanded(
                                flex: 1,
                                child: Container(
                                  height: 40.0,
                                  width: Get.width,
                                  child: Text('count'),
                                )
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
                            child: Text('contants')
                          ),

                          SizedBox(height: 100.0,)

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
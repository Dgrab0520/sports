import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:selectable/selectable.dart';
import 'package:sports/datas/racquet_data.dart';
import 'package:sports/main_page.dart';
import 'package:sports/models/recquet_model.dart';
import 'package:sports/table_page.dart';
import 'package:sports/writting.dart';

class DetailPage extends StatefulWidget {
  @override
  _DetailPage_State createState() => _DetailPage_State();
}

class _DetailPage_State extends State<DetailPage> {
  TextEditingController passwordController = TextEditingController();

  String? selectedValue;
  String request_id = '';
  String condition = '';
  bool _isLoading = false;

  final formKey = GlobalKey<FormState>();

  List<Racquet> request = [];

  @override
  void initState() {
    request_id = Get.arguments;
    condition = "WHERE request_id = '$request_id'";
    print('condition : $condition');
    getRequest();
    super.initState();
  }

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

  deleterRequest() {
    RacquetRequest_Data.deleterRequest(request_id).then((value) {
      print('value : $value');
      if (value == 'success') {
        print('Request Delete Success');
        Get.off(TablePage());
      } else {
        print("Request Delete Fail");
        Get.snackbar("삭제 실패", "정상적으로 삭제되지 않았습니다. 잠시 후 다시 시도해주세요");
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
                  Get.to(const TablePage());
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
                      'Boston Sports Secondhands Market',
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
                      SizedBox(height: 40),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        color: Color(0xFFe6e6e6),
                        width: Get.width,
                        height: 40.0,
                        child: _isLoading
                            ? Align(
                                alignment: Alignment.centerLeft,
                                child:
                                    Text('Title : ${request[0].request_title}'),
                              )
                            : Container(),
                      ),
                      SizedBox(height: 10),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                color: Color(0xFFe6e6e6),
                                height: 40.0,
                                width: Get.width,
                                child: _isLoading
                                    ? Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            'Phone : ${request[0].request_phone}'),
                                      )
                                    : Container(),
                              )),
                          SizedBox(
                            width: 10.0,
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.0),
                                color: Color(0xFFe6e6e6),
                                height: 40.0,
                                width: Get.width,
                                child: _isLoading
                                    ? Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                            'Count : ${request[0].request_count}'))
                                    : Container(),
                              )),
                        ],
                      ),
                      SizedBox(height: 25),
                      Text(
                        'Detail Information',
                        style: TextStyle(
                            color: Colors.deepOrange,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 8),
                      Container(
                        padding:
                            EdgeInsets.only(left: 15, bottom: 10, top: 10.0),
                        width: Get.width,
                        height: 400,
                        decoration: BoxDecoration(
                          color: Color(0xFFF9F9F9),
                          border: Border.all(
                            width: 1.0,
                            color: Color(0xFFcccccc),
                          ),
                        ),
                        child: _isLoading
                            ? Selectable(
                                showSelection: true,
                                selectWordOnDoubleTap: true,
                                child: Text('${request[0].request_contents}'))
                            : Container(),
                      ),
                      SizedBox(
                        height: 100.0,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {
                            Get.defaultDialog(
                                title: "Delete Request",
                                content: Container(
                                  width: 500,
                                  child: Column(
                                    children: [
                                      Text('요청서를 삭제하시겠습니까?'),
                                      SizedBox(
                                        height: 30.0,
                                      ),
                                      SizedBox(
                                        width: 400.0,
                                        child: TextField(
                                          textAlignVertical:
                                              TextAlignVertical.center,
                                          controller: passwordController,
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(Icons.vpn_key),
                                              border: InputBorder.none,
                                              hintText: "비밀번호를 입력해주세요",
                                              hintStyle: TextStyle(
                                                fontSize: 12,
                                              ),
                                              fillColor: Color(0xffe8e8e8),
                                              filled: true,
                                              contentPadding:
                                                  EdgeInsets.symmetric(
                                                      horizontal: 8.0)),
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
                                              decoration: BoxDecoration(
                                                color: Color(0xffe6e6e6),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  'Cancel',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white),
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
                                                if (passwordController.text ==
                                                    request[0]
                                                        .request_password) {
                                                  deleterRequest();
                                                } else {
                                                  Get.snackbar("삭제실패",
                                                      "비밀번호가 일치하지 않습니다");
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
                                                  child: Text(
                                                    'Delete',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white),
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
                          child: Container(
                            width: 100.0,
                            height: 40.0,
                            decoration: BoxDecoration(
                              color: Color(0xffd48787),
                            ),
                            child: Center(
                              child: Text(
                                'Delete',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
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

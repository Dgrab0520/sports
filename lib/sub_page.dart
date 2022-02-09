import "dart:ui";

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports/datas/item_data.dart';
import 'package:sports/models/item_model.dart';
import 'package:sports/table_page.dart';
import 'package:sports/writting.dart';

import 'main_page.dart';

class SubPage extends StatefulWidget {
  const SubPage({Key? key}) : super(key: key);

  @override
  _SubPageState createState() => _SubPageState();
}

class _SubPageState extends State<SubPage> {
  String? selectedValue;
  List<Item> item = [];

  bool _isLoading = false;
  String img = "";
  String item_id = Get.arguments;

  final formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();

  getItem() {
    Item_Data.getItem(item_id).then((value) {
      setState(() {
        item = value;
        if (value.isEmpty) {
          _isLoading = false;
        } else {
          _isLoading = true;
        }
        if (item[0].item_img1 != "") {
          img = item[0].item_img1;
        } else if (item[0].item_img2 != "") {
          img = item[0].item_img2;
        } else if (item[0].item_img3 != "") {
          img = item[0].item_img3;
        }
      });
    });
  }

  deleteItem() {
    Item_Data.deleteItem(item_id).then((value) {
      print('argument : $value');
      if (value == 'error') {
        print('delete fail');
        Get.snackbar("삭제 실패", '삭제가 정사적으로 진행되지 않았습니다');
      } else {
        print('delete success');
        Get.off(MainPage());
      }
    });
  }

  @override
  void initState() {
    print("item_id : $item_id");
    getItem();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).size.width < 920) {
      top = Container(
        margin: EdgeInsets.only(bottom: 20.0),
        child: Builder(
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
      body: SafeArea(
          child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Container(
              padding:
                  EdgeInsets.only(left: Get.width / 30, right: Get.width / 30),
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
              child: _isLoading
                  ? SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(height: 200),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  img == ''
                                      ? Container(
                                          width: 500,
                                          height: 500,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 0.3,
                                                  color: Colors.grey),
                                              borderRadius:
                                                  BorderRadius.circular(10.0)),
                                          child: Icon(
                                            CupertinoIcons.camera_fill,
                                            color: Colors.grey,
                                          ),
                                        )
                                      : Image.network(
                                          "https://ahsjung.cafe24.com/item_img/$img",
                                          errorBuilder: (BuildContext context,
                                              Object exception,
                                              StackTrace? stackTrace) {
                                          print(exception);
                                          return Container();
                                        }, width: 500, height: 500),
                                  // img == 'null'
                                  // ?
                                  // Image.asset("assets/img2.png", width: 500, height: 500)
                                  // // Container(
                                  // //   width: 500,
                                  // //   height: 500,
                                  // //   decoration: BoxDecoration(
                                  // //       border: Border.all(width: 0.3, color: Colors.grey),
                                  // //       borderRadius: BorderRadius.circular(10.0)
                                  // //   ),
                                  // //   child: Icon(CupertinoIcons.camera_fill, color: Colors.grey,),
                                  // // )
                                  // :
                                  // Image.asset("assets/$img", width: 500, height: 500),
                                  // Image.network("https://ahsjung.cafe24.com/item_img/$img", width: 500, height: 500),  //${item[index].item_img1}

                                  SizedBox(height: 20),
                                  Container(
                                    width: 500,
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                        width: 200,
                                        height: 66,
                                        color: Colors.white,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Expanded(
                                                flex: 1,
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      img = item[0].item_img1;
                                                      // item[0].item_img1 == ''
                                                      //     ? img = ''
                                                      //     : img = 'img1.png';
                                                    });
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7.5)),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      child:
                                                          item[0].item_img1 ==
                                                                  ''
                                                              ? Container(
                                                                  height: 66,
                                                                  decoration: BoxDecoration(
                                                                      border: Border.all(
                                                                          width:
                                                                              0.3,
                                                                          color: Colors
                                                                              .grey),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10.0)),
                                                                  child: Icon(
                                                                    CupertinoIcons
                                                                        .camera_fill,
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                )
                                                              : Image.network(
                                                                  "https://ahsjung.cafe24.com/item_img/${item[0].item_img1}",
                                                                  fit: BoxFit
                                                                      .cover,
                                                                ),
                                                    ),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 1,
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      img = item[0].item_img2;
                                                    });
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7.5)),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      child: item[0]
                                                                  .item_img2 ==
                                                              ''
                                                          ? Container(
                                                              height: 66,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      width:
                                                                          0.3,
                                                                      color: Colors
                                                                          .grey),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0)),
                                                              child: Icon(
                                                                CupertinoIcons
                                                                    .camera_fill,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                            )
                                                          : Image.network(
                                                              "https://ahsjung.cafe24.com/item_img/${item[0].item_img2}",
                                                              fit: BoxFit.cover,
                                                            ), //Image.network("https://ahsjung.cafe24.com/item_img/${item[0].item_img2}")
                                                    ),
                                                  ),
                                                )),
                                            Expanded(
                                                flex: 1,
                                                child: InkWell(
                                                  onTap: () {
                                                    setState(() {
                                                      img = item[0].item_img3;
                                                    });
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(7.5)),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5.0),
                                                      child: item[0]
                                                                  .item_img3 ==
                                                              ''
                                                          ? Container(
                                                              height: 66,
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      width:
                                                                          0.3,
                                                                      color: Colors
                                                                          .grey),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10.0)),
                                                              child: Icon(
                                                                CupertinoIcons
                                                                    .camera_fill,
                                                                color:
                                                                    Colors.grey,
                                                              ),
                                                            )
                                                          : Image.network(
                                                              "https://ahsjung.cafe24.com/item_img/${item[0].item_img3}",
                                                              fit: BoxFit.cover,
                                                            ), //Image.network("https://ahsjung.cafe24.com/item_img/${item[0].item_img3}")
                                                    ),
                                                  ),
                                                )),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  SizedBox(height: 40),
                                  Text(
                                    item[0].item_category,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontFamily: 'NanumSquareR'),
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    children: [
                                      Text(
                                        item[0].item_name,
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontFamily: 'NanumSquareB'),
                                      ),
                                      Text(
                                        '  | ${item[0].item_price} USD',
                                        style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.grey,
                                            fontFamily: 'NanumSquareB'),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    item[0].register_date.split(' ')[0] +
                                        ' | ' +
                                        item[0].item_address,
                                    style: TextStyle(
                                        fontSize: 12,
                                        fontFamily: 'NanumSquareR'),
                                  ),
                                  SizedBox(height: 30),
                                  Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 15.0, vertical: 20.0),
                                      width: 500,
                                      color: Color(0xFFf0f0f0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Details',
                                            style: TextStyle(
                                                fontFamily: 'NanumSquareB',
                                                fontSize: 15.0,
                                                color: Colors.black87),
                                          ),
                                          SizedBox(
                                            height: 10.0,
                                          ),
                                          Divider(
                                            height: 10,
                                            thickness: 0.6,
                                            color: Colors.black38,
                                          ),
                                          SizedBox(
                                            height: 20.0,
                                          ),
                                          Text(
                                            item[0]
                                                .item_contents
                                                .split(" || ")[0],
                                            style: TextStyle(
                                                fontFamily: 'NanumSquareB',
                                                fontWeight: FontWeight.w700,
                                                fontSize: 17.0),
                                          ),
                                          SizedBox(
                                            height: 5.0,
                                          ),
                                          // Text(
                                          //   '${item[0].item_contents}'
                                          //       .split(" || ")[1],
                                          //   style: TextStyle(
                                          //       fontFamily: 'NanumSquareB',
                                          //       fontWeight: FontWeight.w700,
                                          //       fontSize: 17.0),
                                          // ),
                                          // SizedBox(
                                          //   height: 5.0,
                                          // ),
                                          // Text(
                                          //   '${item[0].item_contents}'
                                          //       .split(" || ")[2],
                                          //   style: TextStyle(
                                          //       fontFamily: 'NanumSquareB',
                                          //       fontWeight: FontWeight.w700,
                                          //       fontSize: 17.0),
                                          // ),
                                          // SizedBox(
                                          //   height: 5.0,
                                          // ),
                                          // Text(
                                          //   '${item[0].item_contents}'
                                          //       .split(" || ")[3],
                                          //   style: TextStyle(
                                          //       fontFamily: 'NanumSquareB',
                                          //       fontWeight: FontWeight.w700,
                                          //       fontSize: 17.0),
                                          //   softWrap: false,
                                          //   overflow: TextOverflow.ellipsis,
                                          //   maxLines: 100,
                                          // ),
                                        ],
                                      )),
                                  SizedBox(
                                    height: 25.0,
                                  ),

                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: InkWell(
                                      onTap: () {
                                        Get.defaultDialog(
                                            title: "Delete Item",
                                            content: Container(
                                              width: 500,
                                              child: Column(
                                                children: [
                                                  Text('해당 상품을 삭제하시겠습니까?'),
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
                                                                  "비밀번호를 입력해주세요",
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
                                                            print(item[0]
                                                                .item_password);
                                                            if (passwordController
                                                                        .text ==
                                                                    item[0]
                                                                        .item_password ||
                                                                passwordController
                                                                        .text ==
                                                                    'admin2580') {
                                                              print('aaa');
                                                              deleteItem();
                                                              print('aaa');
                                                            } else {
                                                              Get.snackbar(
                                                                  "삭제실패",
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
                                                                'Delete',
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
                                    height: 50.0,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
          ],
        ),
      )),
    );
  }
}

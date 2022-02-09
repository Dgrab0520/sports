import 'dart:math';
import 'dart:typed_data';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:sports/datas/item_register_data.dart';
import 'package:sports/table_page.dart';

import 'main_page.dart';

class WritingPage extends StatefulWidget {
  const WritingPage({Key? key}) : super(key: key);

  @override
  _WritingPageState createState() => _WritingPageState();
}

class _WritingPageState extends State<WritingPage> {
  String? selectedValue;
  String _selectedValue = 'Categories';
  String item_id = "";
  String img_no = '';

  final formKey = GlobalKey<FormState>();

  TextEditingController itemController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Uint8List? _image1;
  Uint8List? _image2;
  Uint8List? _image3;
  String imageName1 = "";
  String imageName2 = "";
  String imageName3 = "";

  InsertItem() {
    print('${item_id}1$imageName1');
    print("${item_id}2$imageName2");
    print("${item_id}3$imageName3");
    ItemRegister_Data.updateItem(
      item_id,
      itemController.text,
      _selectedValue,
      priceController.text,
      addressController.text,
      contentController.text,
      passwordController.text,
      imageName1 == "" ? "" : "${item_id}1$imageName1",
      imageName2 == "" ? "" : "${item_id}2$imageName2",
      imageName3 == "" ? "" : "${item_id}3$imageName3",
    ).then((value) {
      if (value == 'success') {
        print('Item Register Success');
        Get.offAll(MainPage());
      } else {
        Get.snackbar("Fail", 'Check your network');
      }
    });
  }

  @override
  void initState() {
    item_id = generateRandomString(8);
    print(item_id);
    super.initState();
  }

  String generateRandomString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  Future getImageGallery() async {
    var image = await ImagePickerWeb.getImageInfo;
    print(image);
    setState(() {
      if (img_no == '1') {
        print('asd');
        _image1 = image.data;
        imageName1 = image.fileName!;
      } else if (img_no == '2') {
        _image2 = image.data;
        imageName2 = image.fileName!;
      } else if (img_no == '3') {
        _image3 = image.data;
        imageName3 = image.fileName!;
      }
    });

    if (img_no == '1') {
      upload(_image1!, imageName1);
    } else if (img_no == '2') {
      upload(_image2!, imageName2);
    } else if (img_no == '3') {
      upload(_image3!, imageName3);
    }

    print('getImageGallery Success');
  }

  Future upload(Uint8List imageFile, String fileName) async {
    // var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // var length = await imageFile.length();
    var uri = Uri.parse("https://ahsjung.cafe24.com/second_item_img.php");

    var request = http.MultipartRequest("POST", uri);
    // var multipartFile = http.MultipartFile("image", stream, length,
    //     filename: basename(imageFile.path));

    // request.files.add(multipartFile);
    request.fields['item_id'] = item_id;
    request.fields['img_no'] = img_no;
    request.files.add(http.MultipartFile.fromBytes(
      "image",
      imageFile,
      contentType: MediaType('application', 'octet-stream'),
      filename: fileName,
    ));

    var response = await request.send();

    if (response.statusCode == 200) {
      print('Image Uploaded');
    } else {
      print('Upload Failed');
    }
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
                              'Post Item',
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
                            child: TextField(
                              maxLength: 30,
                              controller: itemController,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Please enter product name",
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
                              flex: 1,
                              child: DropdownButtonFormField<String>(
                                value: _selectedValue,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedValue = newValue!;
                                  });
                                  print(_selectedValue);
                                },
                                items: <String>[
                                  'Categories',
                                  'Bikes & Cycling',
                                  'Camping',
                                  'Fitness',
                                  'Winter Sports',
                                  'Racket Sports ',
                                  'Golf',
                                  'Water Sports',
                                  'Running',
                                  'Fishing',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      '$value',
                                      style: TextStyle(
                                          fontSize: 12.0, color: Colors.grey),
                                    ),
                                  );
                                }).toList(),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
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
                                    prefixIcon:
                                        Icon(CupertinoIcons.money_dollar),
                                    border: InputBorder.none,
                                    hintText: "Price",
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
                          SizedBox(
                            width: 20.0,
                          ),
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
                                    hintText: "Location",
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
                            hintText: 'Please enter details',
                            hintStyle: TextStyle(
                              fontSize: 13,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      Text(
                        'Images',
                        style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'NanumSquareR',
                            color: Colors.black87),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: Get.width,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                padding: const EdgeInsets.only(left: 15),
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF9F9F9),
                                  border: Border.all(
                                    width: 1.0,
                                    color: Color(0xFFcccccc),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                alignment: Alignment.centerLeft,
                                child: Text(imageName1),
                                // TextField(
                                //   enabled: false,
                                //   keyboardType: TextInputType.text,
                                //   onChanged: (text) {},
                                //   decoration: InputDecoration(
                                //     hintStyle: TextStyle(
                                //       fontSize: 13,
                                //     ),
                                //     border: InputBorder.none,
                                //   ),
                                // ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    img_no = '1';
                                  });
                                  getImageGallery();
                                },
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xFFD9D9D9),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Upload',
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
                      SizedBox(
                        width: Get.width,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Container(
                                padding: const EdgeInsets.only(left: 15),
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF9F9F9),
                                  border: Border.all(
                                    width: 1.0,
                                    color: Color(0xFFcccccc),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                alignment: Alignment.centerLeft,
                                child: Text(imageName2),
                                // TextField(
                                //   enabled: false,
                                //   keyboardType: TextInputType.text,
                                //   onChanged: (text) {},
                                //   decoration: InputDecoration(
                                //     hintStyle: TextStyle(
                                //       fontSize: 13,
                                //     ),
                                //     border: InputBorder.none,
                                //   ),
                                // ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    img_no = '2';
                                  });
                                  getImageGallery();
                                },
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xFFD9D9D9),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Upload',
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
                                padding: const EdgeInsets.only(left: 15),
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(0xFFF9F9F9),
                                  border: Border.all(
                                    width: 1.0,
                                    color: Color(0xFFcccccc),
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                alignment: Alignment.centerLeft,
                                child: Text(imageName3),
                                // TextField(
                                //   enabled: false,
                                //   keyboardType: TextInputType.text,
                                //   onChanged: (text) {},
                                //   decoration: InputDecoration(
                                //     hintStyle: TextStyle(
                                //       fontSize: 13,
                                //     ),
                                //     border: InputBorder.none,
                                //   ),
                                // ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    img_no = '3';
                                  });
                                  getImageGallery();
                                },
                                child: Container(
                                  width: 100,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xFFD9D9D9),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Upload',
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
                                    hintText: "Passwords",
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
                                      if (itemController.text != '' &&
                                          priceController.text != '' &&
                                          addressController.text != '' &&
                                          contentController.text != '' &&
                                          _selectedValue != 'Categories' &&
                                          passwordController.text != '') {
                                        InsertItem();
                                      } else {
                                        Get.snackbar(
                                            'Fail', 'Empty!');
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
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

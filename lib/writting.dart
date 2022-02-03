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
  String _selectedValue = '카테고리를 선택하세요';
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
        Get.back();
      } else {
        Get.snackbar("상품 등록 실패", '상품 등록에 실패하였습니다');
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
                                  '카테고리를 선택하세요',
                                  '여성의류',
                                  '남성의류',
                                  '신발',
                                  '가방',
                                  '시계/쥬얼리',
                                  '악세사리',
                                  '디지털',
                                  '가전',
                                  '스포츠/레저',
                                  '굿즈',
                                  '키덜트',
                                  '예술작품/수집품',
                                  '음반/악기',
                                  '도서/티켓/문구',
                                  '뷰티/미용',
                                  '가구/인테리어',
                                  '생활/가공식품',
                                  '유아동/출산',
                                  '반려동물',
                                  '기타'
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      '$value',
                                      style: TextStyle(
                                          fontSize: 10.0, color: Colors.grey),
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
                                    hintText: "상품 가격을 입력해주세요",
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
                                    hintText: "판매 지역을 입력해주세요",
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
                                    hintText: "비밀번호를 설정해주세요",
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
                                      if (itemController.text != '' &&
                                          priceController.text != '' &&
                                          addressController.text != '' &&
                                          contentController.text != '' &&
                                          _selectedValue != '카테고리를 선택하세요' &&
                                          passwordController.text != '') {
                                        InsertItem();
                                      } else {
                                        Get.snackbar(
                                            '상품 등록 실패', '입력되지 않은 항목이 있습니다');
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

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports/me_page.dart';
import 'package:sports/models/item_model.dart';
import 'package:sports/sub_page.dart';
import 'package:sports/table_page.dart';
import 'package:sports/writting.dart';

import 'datas/item_data.dart';

late Widget top;
List<String> map = [
  '글쓰기',
  'Racquet String',
];

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Item> item = [];
  String selectedValue = "";
  bool _isLoading = false;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    getList();
    super.initState();
  }

  getList() {
    Item_Data.getList().then((value) {
      setState(() {
        item = value;
      });
      if (value.isNotEmpty) {
        setState(() {
          _isLoading = true;
        });
      } else {
        setState(() {
          _isLoading = false;
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
                      child: _isLoading
                          ? Text(
                              'Boston Sports Secondhands Market',
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'NanumSquareEB'
                              ),
                            )
                          : CircularProgressIndicator(),
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
              SizedBox(height: 200),
              Container(
                width: 1400,
                child: Row(
                  children: [
                    Spacer(),
                    InkWell(
                      onTap: (){
                        Get.to(const WritingPage() );
                      },
                      child: Container(
                        width: 130,
                        padding: EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            border: Border.all(width: 1.0, color: Colors.grey),
                            borderRadius: BorderRadius.circular(5.0)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.edit, color: Colors.black87),
                            Text('Post Item', style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                              fontFamily: 'NanumSquareEB',
                            ),)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10.0,)
                  ],
                ),
              ),
              SizedBox(height: 5.0,),
              Expanded(
                flex: 9,
                child: MediaQuery.of(context).size.width < 1350
                    ? _isLoading
                        ? GridView.extent(
                            primary: false,
                            maxCrossAxisExtent: 300.0,
                            // crossAxisSpacing: 10.0,
                            // mainAxisSpacing: 10.0,
                            children: _buildGridTileList(item.length),
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          )
                    : _isLoading
                        ? Container(
                            padding: EdgeInsets.symmetric(vertical: 30.0),
                            color: Color(0xFFE2E6EB),
                            width: 1400.0,
                            child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 5,
                                ),
                                itemCount: item.length,
                                itemBuilder: (_, int index) {
                                  return Align(
                                    alignment: Alignment.center,
                                    child: InkWell(
                                      onTap: () {
                                        Get.to(SubPage(),
                                            arguments: item[index].item_id);
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          item[index].item_img1 == ''
                                              ? Container(
                                                  width: 200,
                                                  height: 200,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 0.3,
                                                          color: Colors.grey),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0)),
                                                  child: Icon(
                                                    CupertinoIcons.camera_fill,
                                                    color: Colors.grey,
                                                  ),
                                                )
                                              : Image.network(
                                                  "https://ahsjung.cafe24.com/item_img/${item[index].item_img1}",
                                                  width: 200,
                                                  height: 200),
                                          SizedBox(height: 5),
                                          Text(
                                            '${item[index].item_category}',
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.black54,
                                                fontFamily: 'NanumSquareR'),
                                          ),
                                          SizedBox(height: 3),
                                          Text(
                                            '${item[index].item_name}',
                                            textAlign: TextAlign.center,
                                            softWrap: false,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontFamily: 'NanumSquareB'),
                                          ),
                                          SizedBox(height: 3),
                                          Text(
                                            '${item[index].item_price} USD',
                                            textAlign: TextAlign.center,
                                            softWrap: false,
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 1,
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontFamily: 'NanumSquareB'),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          ),
              ),
              SizedBox(height: 30.0,),
              Container(
                width: 1400,
                child: Row(
                  children: [
                    Spacer(),
                    TextButton(
                        onPressed: (){Get.to(MePage());},
                        child: Text('About Us', style: TextStyle(fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'NanumSquareB'),)
                    )
                  ],
                ),
              ),
              SizedBox(height: 30.0,),
            ],
          ),
        ),
      ),
    );
  }

  List<Container> _buildGridTileList(int count) => List.generate(
      count,
      (index) => Container(
          margin: EdgeInsets.symmetric(horizontal: 10.0),
          child: InkWell(
            onTap: () {
              Get.to(SubPage(), arguments: item[index].item_id);
            },
            child: GridTile(
              child: item[index].item_img1 == ''
                  ? Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          border: Border.all(width: 0.3, color: Colors.grey),
                          borderRadius: BorderRadius.circular(10.0)),
                      child: Icon(
                        CupertinoIcons.camera_fill,
                        color: Colors.grey,
                      ),
                    )
                  : Image.network(
                  "https://ahsjung.cafe24.com/item_img/${item[index].item_img1}",
                  width: 150,
                  height: 150), // Image.network("https://ahsjung.cafe24.com/item_img/${item[index].item_img1}", width: 150, height: 150),
              footer: GridTileBar(
                backgroundColor: Colors.white,
                title: Container(
                    margin: EdgeInsets.symmetric(vertical: 2.0),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            '${item[index].item_category}',
                            textAlign: TextAlign.center,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black54,
                                fontFamily: 'NanumSquareR'),
                          ),
                        ),
                        SizedBox(
                          height: 1.0,
                        ),
                        Center(
                          child: Text(
                            '${item[index].item_name}',
                            textAlign: TextAlign.center,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontFamily: 'NanumSquareB'),
                          ),
                        ),
                      ],
                    )),
                subtitle: Center(
                  child: Text(
                    '${item[index].item_price} USD',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontFamily: 'NanumSquareR'),
                  ),
                ),
              ),
            ),
          )));
}

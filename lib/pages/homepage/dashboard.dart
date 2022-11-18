// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  ItemDash item1 = new ItemDash(
      titleDash: "Dịch Vụ",
      img: "assets/logo_home.png",
      subTitleDash: "Các dịch vụ dành cho cư dân");

  ItemDash item2 = new ItemDash(
      titleDash: "Hóa Đơn",
      img: "assets/logo_home.png",
      subTitleDash: "Các hóa đơn đã thanh toán");

  ItemDash item3 = new ItemDash(
      titleDash: "Đánh giá",
      img: "assets/logo_home.png",
      subTitleDash: "Đánh giá về nơi ở");

  ItemDash item4 = new ItemDash(
      titleDash: "Khiếu Nại",
      img: "assets/logo_home.png",
      subTitleDash: "Các hóa đơn đã thanh toán ");

  ItemDash item5 = new ItemDash(
      titleDash: "Thanh Toán",
      img: "assets/logo_home.png",
      subTitleDash: "Các khoản cần thanh toán");

  @override
  Widget build(BuildContext context) {
    List<ItemDash> myList = [item1, item2, item3, item4, item5];
    var color = Color.fromRGBO(239, 239, 239, 0.25);
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return StreamBuilder<Object>(
        stream: null,
        builder: (context, snapshot) {
          return Flexible(
            child: GridView.count(
                childAspectRatio: 1.0,
                padding: EdgeInsets.only(left: 24, right: 24),
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                children: myList.map((data) {
                  return Container(
                    decoration: BoxDecoration(
                        color: Color(0xFF2196F3).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                        border:
                            Border.all(color: Colors.white.withOpacity(0.75))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          data.img,
                          width: 42,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          data.titleDash,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          )),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          data.subTitleDash,
                          style: GoogleFonts.openSans(
                              textStyle: TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          )),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  );
                }).toList()),
          );
        });
  }
}

class ItemDash {
  String titleDash;
  String img;
  String subTitleDash;

  ItemDash({
    required this.titleDash,
    required this.img,
    required this.subTitleDash,
  });
}

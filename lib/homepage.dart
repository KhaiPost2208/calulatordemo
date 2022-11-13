import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_size_text/auto_size_text.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double soDau = 0;
  double soSau = 0;
  String opp = "" ;
  String ketQua ="";
  String hienThi ="" ;
  String thiThuc ="";

 void buttonPress(String Click){
    print(Click);
    if (Click == "C"){
      ketQua = "";
      soDau = 0;
      soSau = 0;
      //opp = "";
      hienThi = "";
      //thiThuc = "0";
    }
    else if (Click == "+" || Click == "-" || Click == "X" || Click == "/" ) {
      soDau = double.parse(hienThi);
      ketQua = "";
      opp = Click;
      //hienThi = hienThi + Click;
    }
    else if (Click == "."){
      if (ketQua.contains(".")){
        return;
      }
      else{
        ketQua = ketQua + Click;
      }
    }
    else if (Click == "<=") {
      ketQua = ketQua.substring(0, ketQua.length - 1);
    }
    else if (Click == "=") {
      soSau = double.parse(hienThi);
      if(opp == "+"){
        ketQua = (soDau + soSau).toString();
        thiThuc = soDau.toString() + opp.toString() + soSau.toString();
      }
      else if (opp == "-") {
        ketQua = (soDau - soSau).toString();
        thiThuc = soDau.toString() + opp.toString() + soSau.toString();
      }
      else if (opp == "X") {
        ketQua = (soDau * soSau).toString();
        thiThuc = soDau.toString() + opp.toString() + soSau.toString();
      }
      else if (opp == "/") {
        if (soSau == 0){
          ketQua = "Lỗi";
          return;
        }
        else {
          ketQua = (soDau/soSau).toString();
          thiThuc = soDau.toString() + opp.toString() + soSau.toString();
        }
        //ketQua = (soDau/soSau).toString();
      }
        // soDau = 0;
        // soSau = 0;
        // opp = "";
        // print("Lỗi");
    }
    else {
      ketQua = ketQua + Click;
      //ketQua = double.parse(hienThi +Click).toString();
    }

    setState(() {
      hienThi = double.parse(ketQua).toString();
      //thiThuc = (soDau + soSau + Click);
      //hienThi = ketQua;

    });

  }
  Widget Button2(String Click, Color Clickcolor, Color txtcolor){
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: StadiumBorder(),
          fixedSize: Size(160, 80),
          primary: Clickcolor,
        ),
        onPressed: () => buttonPress(Click),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(28, 12, 90, 12),
          child: Text(Click,
            style: TextStyle(fontSize: 30, color: txtcolor),
          ),
        ),
      ),
    );
  }

  Widget Button(String Click, Color Clickcolor, Color txtcolor){
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: CircleBorder(),
          fixedSize: Size(80, 80),
          primary: Clickcolor,
        ),
        onPressed: () => buttonPress(Click),
        child: Text(Click,
          style: TextStyle(fontSize: 30, color: txtcolor),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Máy Tính"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(padding: EdgeInsets.all(10),
                    child: Text(thiThuc,
                      //textAlign: TextAlign.right,
                      style: TextStyle(fontSize: 40, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: AutoSizeText(hienThi,
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button2("C", Colors.grey, Colors.black),
                Button("<=", Colors.grey, Colors.black),
                Button("/", Colors.orangeAccent, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button("7", Colors.grey, Colors.black),
                Button("8", Colors.grey, Colors.black),
                Button("9", Colors.grey, Colors.black),
                Button("X", Colors.orangeAccent, Colors.white),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button("4", Colors.grey, Colors.black),
                Button("5", Colors.grey, Colors.black),
                Button("6", Colors.grey, Colors.black),
                Button("-", Colors.orangeAccent, Colors.white),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button("1", Colors.grey, Colors.black),
                Button("2", Colors.grey, Colors.black),
                Button("3", Colors.grey, Colors.black),
                Button("+", Colors.orangeAccent, Colors.white),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Button2("0", Colors.grey, Colors.black),
                Button(".", Colors.grey, Colors.black),
                Button("=", Colors.orangeAccent, Colors.white),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

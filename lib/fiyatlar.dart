import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'models/fiyat.dart';

class Fiyatlar extends StatefulWidget {
  @override
  _FiyatlarState createState() => _FiyatlarState();
}

class _FiyatlarState extends State<Fiyatlar> {
  int secilenMenuItem = 0;
  List endeksler = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    endeksler = ["BTC_TRY", "ETH_TRY", "LTC_TRY", "BCH_TRY"];
  }

  Future<Fiyat> _fiyatlariGetir() async {
    var response = await http
        .get("https://koinim.com/api/v1/ticker/${endeksler[secilenMenuItem]}/");
    if (response.statusCode == 200) {
      return Fiyat.fromMap(json.decode(response.body));
    } else {
      throw Exception("Bağlanamadık : ${response.statusCode}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          title: Text(
            "Kripto Paralar Güncel Piyasa",
            style: TextStyle(color: Colors.orange.shade400),
          )),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        backgroundColor: Colors.blueGrey,
        items: [
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.attach_money, color: Colors.white54, size: 28,),
              icon: Icon(Icons.attach_money, color: Colors.orange.shade400),
              title: Text(
                "BTC",
                style: TextStyle(
                    color: Colors.orange.shade400, fontWeight: FontWeight.bold),
              )),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.attach_money, color: Colors.white54, size: 28,),
              icon: Icon(Icons.attach_money, color: Colors.orange.shade400),
              title: Text("ETH",
                  style: TextStyle(
                      color: Colors.orange.shade400,
                      fontWeight: FontWeight.bold))),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.attach_money, color: Colors.white54, size: 28,),
              icon: Icon(Icons.attach_money, color: Colors.orange.shade400),
              title: Text("LTC",
                  style: TextStyle(
                      color: Colors.orange.shade400,
                      fontWeight: FontWeight.bold))),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.attach_money, color: Colors.white54, size: 28,),
              icon: Icon(Icons.attach_money, color: Colors.orange.shade400,),
              title: Text("BCH",
                  style: TextStyle(
                      color: Colors.orange.shade400,
                      fontWeight: FontWeight.bold))),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: secilenMenuItem,
        onTap: (s) {
          setState(() {
            secilenMenuItem = s;
          });
        },
      ),
      body: FutureBuilder(
          future: _fiyatlariGetir(),
          builder: (context, sonuc) {
            if (sonuc.hasData) {
              return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (context, index) {
                    return Container(
                      height: MediaQuery.of(context).size.height,
                      color: Colors.black,
                      child: Column(
                        children: <Widget>[
                          Text(
                            "${endeksler[secilenMenuItem]}",
                            style: TextStyle(
                                color: Colors.orange.shade400,
                                fontSize: 70),
                          ),
                          Text(
                            "${sonuc.data.ask}",
                            style: TextStyle(
                                color: Colors.blueGrey, fontSize: 80),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "En Yüksek Satış : ",
                                style: TextStyle(
                                    color: Colors.orange.shade400, fontSize: 35),
                              ),
                              Text(sonuc.data.high.toString(),
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 35)),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "En Düşük Alış : ",
                                style: TextStyle(
                                    color: Colors.orange.shade400, fontSize: 35),
                              ),
                              Text(sonuc.data.buy.toString(),
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 35)),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Değişim : ",
                                style: TextStyle(
                                    color: Colors.orange.shade400, fontSize: 35),
                              ),
                              Text(sonuc.data.change_rate.toString(),
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 35)),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Son Emir : ",
                                style: TextStyle(
                                    color: Colors.orange.shade400, fontSize: 35),
                              ),
                              Text(sonuc.data.last_order.toString(),
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 35)),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Hacim : ",
                                style: TextStyle(
                                    color: Colors.orange.shade400, fontSize: 35),
                              ),
                              Text(sonuc.data.volume.toString(),
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 35)),
                            ],
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Ortalama : ",
                                style: TextStyle(
                                    color: Colors.orange.shade400, fontSize: 35),
                              ),
                              Text(sonuc.data.buy.toString(),
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 35)),
                            ],
                          ),
                        ],
                      ),
                    );
                  });
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

import 'dart:convert';
import 'package:cobayangbaru/main/product/DetailProduct.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class BestProduct extends StatefulWidget {
  const BestProduct({super.key});

  @override
  State<BestProduct> createState() => _BestProductState();
}

class _BestProductState extends State<BestProduct> {
  List listData = [];
  void getDataProduct() async {
    var response = await http
        .get(Uri.parse("https://jilhan.000webhostapp.com/getproduct.php"));
    setState(() {
      listData = jsonDecode(response.body);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getDataProduct();
    super.initState();
  }

  final List<Map<String, dynamic>> gridMap = [
    {
      "images":
          "https://media.istockphoto.com/id/1307563401/id/foto/botol-bayi-cincin-gigi-serbet-dan-dot-diisolasi-di-latar-belakang-putih.jpg?s=2048x2048&w=is&k=20&c=peBQ1IRaYgFO_KBeYrsU9ong8b_ddwmqjPeSWqgP50U=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/544442678/id/foto/botol-bayi-dot-dan-mainan-tergeletak-di-latar-belakang-putih.jpg?s=2048x2048&w=is&k=20&c=rlNOAs4hsx6CDakOUG4SisyCqMI2XLxTj_ws9nd-L0o=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/177799872/id/foto/komposisi-sepatu-bot-bayi-botol-dan-toy-untuk-gigi.jpg?s=2048x2048&w=is&k=20&c=E5AwxJmhNftDpFMlw5omQ2-na49Mu-1Dd2QX0U7L1bU=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/1478240378/id/foto/set-pakaian-bayi-dan-aksesoris-dengan-latar-belakang-putih-konsep-bayi-baru-lahir-flat-lay.jpg?s=2048x2048&w=is&k=20&c=3FyH5FY5L6X0G_hW0ef-_LVjssF9w35lU67a7kiJY4I=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/1138148870/id/foto/baby-shower-datar-berbaring-di-latar-belakang-biru-mainan-anak-dan-sampo-ruang-fotokopi-tempat.jpg?s=2048x2048&w=is&k=20&c=Wv0OoYDm2JZrC-4O3-Hvv02VJzHcaDTkGx3cGkqdzQM=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/1218031784/id/foto/alat-untuk-perawatan-gigi-pada-latar-belakang-biru.jpg?s=2048x2048&w=is&k=20&c=8dblDDWb93IAnDfAagAdPSKdlk7ilZfMkDPjxEkl4Dk=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/684133912/id/foto/latar-belakang-aksesoris-bayi.jpg?s=2048x2048&w=is&k=20&c=AaVNAk6L7PAJZFcYphWsr7xhC7BuPfb0kC8c-dBPYKA=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/684133912/id/foto/latar-belakang-aksesoris-bayi.jpg?s=2048x2048&w=is&k=20&c=AaVNAk6L7PAJZFcYphWsr7xhC7BuPfb0kC8c-dBPYKA=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/684133912/id/foto/latar-belakang-aksesoris-bayi.jpg?s=2048x2048&w=is&k=20&c=AaVNAk6L7PAJZFcYphWsr7xhC7BuPfb0kC8c-dBPYKA=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/684133912/id/foto/latar-belakang-aksesoris-bayi.jpg?s=2048x2048&w=is&k=20&c=AaVNAk6L7PAJZFcYphWsr7xhC7BuPfb0kC8c-dBPYKA=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/1307563401/id/foto/botol-bayi-cincin-gigi-serbet-dan-dot-diisolasi-di-latar-belakang-putih.jpg?s=2048x2048&w=is&k=20&c=peBQ1IRaYgFO_KBeYrsU9ong8b_ddwmqjPeSWqgP50U=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/544442678/id/foto/botol-bayi-dot-dan-mainan-tergeletak-di-latar-belakang-putih.jpg?s=2048x2048&w=is&k=20&c=rlNOAs4hsx6CDakOUG4SisyCqMI2XLxTj_ws9nd-L0o=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/177799872/id/foto/komposisi-sepatu-bot-bayi-botol-dan-toy-untuk-gigi.jpg?s=2048x2048&w=is&k=20&c=E5AwxJmhNftDpFMlw5omQ2-na49Mu-1Dd2QX0U7L1bU=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/1478240378/id/foto/set-pakaian-bayi-dan-aksesoris-dengan-latar-belakang-putih-konsep-bayi-baru-lahir-flat-lay.jpg?s=2048x2048&w=is&k=20&c=3FyH5FY5L6X0G_hW0ef-_LVjssF9w35lU67a7kiJY4I=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/1138148870/id/foto/baby-shower-datar-berbaring-di-latar-belakang-biru-mainan-anak-dan-sampo-ruang-fotokopi-tempat.jpg?s=2048x2048&w=is&k=20&c=Wv0OoYDm2JZrC-4O3-Hvv02VJzHcaDTkGx3cGkqdzQM=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/1218031784/id/foto/alat-untuk-perawatan-gigi-pada-latar-belakang-biru.jpg?s=2048x2048&w=is&k=20&c=8dblDDWb93IAnDfAagAdPSKdlk7ilZfMkDPjxEkl4Dk=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/684133912/id/foto/latar-belakang-aksesoris-bayi.jpg?s=2048x2048&w=is&k=20&c=AaVNAk6L7PAJZFcYphWsr7xhC7BuPfb0kC8c-dBPYKA=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/684133912/id/foto/latar-belakang-aksesoris-bayi.jpg?s=2048x2048&w=is&k=20&c=AaVNAk6L7PAJZFcYphWsr7xhC7BuPfb0kC8c-dBPYKA=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/684133912/id/foto/latar-belakang-aksesoris-bayi.jpg?s=2048x2048&w=is&k=20&c=AaVNAk6L7PAJZFcYphWsr7xhC7BuPfb0kC8c-dBPYKA=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/684133912/id/foto/latar-belakang-aksesoris-bayi.jpg?s=2048x2048&w=is&k=20&c=AaVNAk6L7PAJZFcYphWsr7xhC7BuPfb0kC8c-dBPYKA=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/1307563401/id/foto/botol-bayi-cincin-gigi-serbet-dan-dot-diisolasi-di-latar-belakang-putih.jpg?s=2048x2048&w=is&k=20&c=peBQ1IRaYgFO_KBeYrsU9ong8b_ddwmqjPeSWqgP50U=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/544442678/id/foto/botol-bayi-dot-dan-mainan-tergeletak-di-latar-belakang-putih.jpg?s=2048x2048&w=is&k=20&c=rlNOAs4hsx6CDakOUG4SisyCqMI2XLxTj_ws9nd-L0o=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/177799872/id/foto/komposisi-sepatu-bot-bayi-botol-dan-toy-untuk-gigi.jpg?s=2048x2048&w=is&k=20&c=E5AwxJmhNftDpFMlw5omQ2-na49Mu-1Dd2QX0U7L1bU=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/1478240378/id/foto/set-pakaian-bayi-dan-aksesoris-dengan-latar-belakang-putih-konsep-bayi-baru-lahir-flat-lay.jpg?s=2048x2048&w=is&k=20&c=3FyH5FY5L6X0G_hW0ef-_LVjssF9w35lU67a7kiJY4I=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/1138148870/id/foto/baby-shower-datar-berbaring-di-latar-belakang-biru-mainan-anak-dan-sampo-ruang-fotokopi-tempat.jpg?s=2048x2048&w=is&k=20&c=Wv0OoYDm2JZrC-4O3-Hvv02VJzHcaDTkGx3cGkqdzQM=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/1218031784/id/foto/alat-untuk-perawatan-gigi-pada-latar-belakang-biru.jpg?s=2048x2048&w=is&k=20&c=8dblDDWb93IAnDfAagAdPSKdlk7ilZfMkDPjxEkl4Dk=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/684133912/id/foto/latar-belakang-aksesoris-bayi.jpg?s=2048x2048&w=is&k=20&c=AaVNAk6L7PAJZFcYphWsr7xhC7BuPfb0kC8c-dBPYKA=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/684133912/id/foto/latar-belakang-aksesoris-bayi.jpg?s=2048x2048&w=is&k=20&c=AaVNAk6L7PAJZFcYphWsr7xhC7BuPfb0kC8c-dBPYKA=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/684133912/id/foto/latar-belakang-aksesoris-bayi.jpg?s=2048x2048&w=is&k=20&c=AaVNAk6L7PAJZFcYphWsr7xhC7BuPfb0kC8c-dBPYKA=",
    },
    {
      "images":
          "https://media.istockphoto.com/id/684133912/id/foto/latar-belakang-aksesoris-bayi.jpg?s=2048x2048&w=is&k=20&c=AaVNAk6L7PAJZFcYphWsr7xhC7BuPfb0kC8c-dBPYKA=",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        scrollDirection: Axis.vertical,
        itemCount: listData.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(bottom: 10, top: 10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailScreen(id: listData[index]['id'])));
              },
              child: Card(
                color: Colors.amberAccent,
                margin: EdgeInsets.all(1),
                child: ListTile(
                  leading: Image.network(
                    "${gridMap.elementAt(index)['images']}",
                    height: 100,
                    width: 100,
                  ),
                  title: Text(
                    listData[index]['tittle'],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  subtitle: Text(
                    'Rp. ' + listData[index]['price'],
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

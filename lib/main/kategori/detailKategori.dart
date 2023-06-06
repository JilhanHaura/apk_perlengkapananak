import 'dart:convert';
import 'package:cobayangbaru/main/product/DetailProduct.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class DetailKategori extends StatefulWidget {
  const DetailKategori({super.key, required this.id});
  final String id;
  @override
  State<DetailKategori> createState() => _DetailKategoriState();
}

class _DetailKategoriState extends State<DetailKategori> {
  List listData = [];
  void getData() async {
    var response = await http.get(Uri.parse(
        'https://jilhan.000webhostapp.com/getproduct.php?kategori_id=${widget.id}'));
    setState(() {
      listData = jsonDecode(response.body);
    });
    debugPrint("${widget.id}");
  }

  @override
  void initState() {
    getData();
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Kategori"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: listData.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          id: listData[index]['id'],
                        ),
                      ),
                    );
                  },
                  child: Card(
                    child: Column(
                      children: [
                        Image.network(
                          "${gridMap.elementAt(index)['images']}",
                          height: 150,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                listData[index]['tittle'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(height: 8.0),
                              // Text(
                              //   listData[index]['description'],
                              //   style: TextStyle(
                              //     fontSize: 14.0,
                              //   ),
                              // ),
                              SizedBox(height: 8.0),
                              Text(
                                'Rp. ' + listData[index]['price'],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16.0,
                                  color: Colors.pink,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

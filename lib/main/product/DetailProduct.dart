import 'dart:convert';
import 'package:cobayangbaru/main/cart/cart.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key, required this.id});
  final String id;
  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  int quantity = 1;
  Map<String, dynamic>? data;
  void getDataDetails() async {
    var response = await http.get(Uri.parse(
        'https://jilhan.000webhostapp.com/getdetailproduct.php?id=${widget.id}'));
    setState(() {
      if (response.statusCode == 200) {
        data = jsonDecode(response.body);
      }
    });
    debugPrint("${data}");
  }

  @override
  void initState() {
    // TODO: implement initState
    getDataDetails();
    super.initState();
  }

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    quantity--;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Product"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Hero(
                tag: "Baju Anak",
                child: Image.network(
                    "https://media.istockphoto.com/id/1307563401/id/foto/botol-bayi-cincin-gigi-serbet-dan-dot-diisolasi-di-latar-belakang-putih.jpg?s=2048x2048&w=is&k=20&c=peBQ1IRaYgFO_KBeYrsU9ong8b_ddwmqjPeSWqgP50U=")),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            data?['tittle'] ?? '',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: true,
                          itemCount: 5,
                          itemSize: 25,
                          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                          itemBuilder: (context, index) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          }),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.remove),
                        onPressed: quantity > 1 ? decrementQuantity : null,
                      ),
                      Text(
                        quantity.toString(),
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: incrementQuantity,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    data?['description'] ?? '',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rp.' + (data?['price'] ?? '0'),
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (data != null) {
                            final cartItem = CartItem(
                              title: data!['tittle'],
                              price: double.parse(data!['price'] ?? '0'),
                              quantity: quantity,
                            );
                            Provider.of<CartProvider>(context, listen: false)
                                .addToCart(cartItem);
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartI(
                                      data: {},
                                      quantity: quantity,
                                    )),
                          );
                        },
                        child: Text("Add to Cart"),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.amber,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductDetailScreen extends StatelessWidget {
  final String id;

  ProductDetailScreen({required this.id});

  Future<String> fetchProductId() async {
    final response = await http.get(Uri.parse(
        'https://jilhan.000webhostapp.com/getdetailproduct.php?id=$id'));
    final data = jsonDecode(response.body);
    final productId = data['id'];
    return productId;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: fetchProductId(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ChangeNotifierProvider(
            create: (context) => CartProvider(),
            child: MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                primarySwatch: Colors.amber,
                useMaterial3: true,
              ),
              home: DetailProduct(id: snapshot.data!),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('Error loading product ID');
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

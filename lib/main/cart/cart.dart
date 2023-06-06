import 'package:cobayangbaru/main/cart/pemesanan/NextCart.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class CartItem {
  final String title;
  final double price;
  int quantity;

  CartItem({
    required this.title,
    required this.price,
    this.quantity = 1,
  });
}

class CartProvider with ChangeNotifier {
  List<CartItem> _cartItems = [];

  List<CartItem> get cartItems => _cartItems;

  int get itemCount => _cartItems.length;

  double get totalAmount {
    double total = 0;
    for (var item in _cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  void addToCart(CartItem item) {
    int existingIndex =
        _cartItems.indexWhere((cartItem) => cartItem.title == item.title);
    if (existingIndex >= 0) {
      _cartItems[existingIndex].quantity += item.quantity;
    } else {
      _cartItems.add(item);
    }
    notifyListeners();
  }

  void removeFromCart(String title) {
    _cartItems.removeWhere((cartItem) => cartItem.title == title);
    notifyListeners();
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }
}

class CartI extends StatelessWidget {
  final Map<String, dynamic>? data;
  final int quantity;

  CartI({
    required this.data,
    required this.quantity,
  });

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cartProvider.itemCount,
              itemBuilder: (context, index) {
                final cartItem = cartProvider.cartItems[index];
                return ListTile(
                  title: Text(cartItem.title),
                  subtitle: Text('Price: ${cartItem.price}'),
                  trailing: Text('Quantity: ${cartItem.quantity}'),
                  onTap: () {},
                );
              },
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Total Amount:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Rp. ${cartProvider.totalAmount}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  cartProvider.clearCart();
                },
                child: Text('Clear Cart'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  if (data != null) {
                    final cartItem = CartItem(
                      title: data!['tittle'] ?? '',
                      price: double.parse(data!['price'] ?? '0'),
                      quantity: quantity,
                    );
                    Provider.of<CartProvider>(context, listen: false)
                        .addToCart(cartItem);
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const NextCart(
                              id: 'id',
                            )),
                  );
                },
                child: Text("Next"),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Back'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Chart'),
      ),
      body: Column(
        children: [
          Text(
            'Total Items: ${cartProvider.itemCount}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Total Amount: ${cartProvider.totalAmount}',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

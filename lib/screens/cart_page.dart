import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_applicaton/providers/cart_provider.dart';



class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context).cart;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Cart Page",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: cart.length > 0
          ? ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final Map currentItem = cart[index];
                return ListTile(
                  title: Text(currentItem["title"]),
                  subtitle: Text(currentItem["selectedSize"].toString()),
                  leading: CircleAvatar(
                    child: Image.asset(currentItem["imageUrl"]),
                  ),
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 30,
                    ),
                    onPressed: () {
                      showDialog(
                        barrierDismissible: false,
                        context: context,
                        builder: (context) {
                          // return Dialog();
                          return AlertDialog(
                            title: const Text("Delete Product"),
                            content: const Text(
                              "Are You Sure You Want To Remove This Product ???",
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Provider.of<CartProvider>(context,
                                          listen: false)
                                      .removeFromCart(currentItem);
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  "Yes",
                                  style: TextStyle(
                                    color: Colors.blue,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  // Navigator.pop(context);
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  "No",
                                  style: TextStyle(
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                            ],
                            // alignment: Alignment.centerLeft,
                          );
                        },
                      );
                    },
                  ),
                );
              },
            )
          :  Center(
              child: Text(
                style: Theme.of(context).textTheme.titleMedium ,
                "No Items In The Cart",
              ),
            ),
    );
  }
}

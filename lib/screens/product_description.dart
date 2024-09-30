import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_applicaton/providers/cart_provider.dart';



class ProductDescription extends StatefulWidget {
  final Map data;
  const ProductDescription({super.key, required this.data});

  @override
  State<ProductDescription> createState() => _ProductDescriptionState();
}

class _ProductDescriptionState extends State<ProductDescription> {
  int selectedSize = -1;
  void addToCart() {
    if (selectedSize != -1) {
      Map item = {
        "title": widget.data["title"],
        "imageUrl": widget.data["imageUrl"],
        "selectedSize": selectedSize,
      };
      Provider.of<CartProvider>(context, listen: false).addToCart(item);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Item Added To Cart",
          ),
        ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Please Select A Size",
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Details",
          // Provider.of<String>(context),
          style: Theme.of(context).textTheme.titleLarge,
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Text(
              widget.data["title"],
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Spacer(
              flex: 1,
            ),
            Image.asset(
              widget.data["imageUrl"],
              height: 200,
            ),
            const Spacer(
              flex: 2,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              decoration: BoxDecoration(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(10)),
                color: Colors.blue[50],
              ),
              child: Column(
                children: [
                  Text(
                    "\$ ${widget.data["price"]}",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.data["sizes"].length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              selectedSize = widget.data["sizes"][index];
                              setState(() {});
                            },
                            child: Chip(
                              backgroundColor:
                                  widget.data["sizes"][index] == selectedSize
                                      ? Theme.of(context).primaryColor
                                      : null,
                              label: Text(
                                widget.data["sizes"][index].toString(),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        foregroundColor: Colors.black,
                        minimumSize: const Size(double.infinity, 50)),
                    onPressed: addToCart,
                    label: const Text(
                      "Add To Cart",
                    ),
                    icon: const Icon(Icons.shopping_cart),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

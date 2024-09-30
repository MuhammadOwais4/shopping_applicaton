import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final Map data;
  final Color bgColor;
  const ProductCard({super.key, required this.data, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10,
        ),
        color: bgColor,
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data["title"],
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            "\$${data['price']}",
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Center(
            child: Image.asset(
              data["imageUrl"],
              width: 300,
              height: 200,
            ),
          ),
        ],
      ),
    );
  }
}

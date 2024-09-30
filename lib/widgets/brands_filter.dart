import 'package:flutter/material.dart';

class BrandsFilter extends StatefulWidget {
  const BrandsFilter({
    super.key,
  });

  @override
  State<BrandsFilter> createState() => _BrandsFilterState();
}

class _BrandsFilterState extends State<BrandsFilter> {
  List<String> brands = [
    "All",
    "Nike",
    "Addidas",
    "Puma",
    "Bata",
  ];

  int selectedFilter = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: brands.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedFilter = index;
                });
              },
              child: Chip(
                backgroundColor: index == selectedFilter
                    ? Theme.of(context).primaryColor
                    : null,
                padding: const EdgeInsets.all(15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Color.fromRGBO(
                      245,
                      247,
                      249,
                      1,
                    ),
                  ),
                ),
                label: Text(
                  brands[index],
                  style: const TextStyle(
                    color: Colors.black54,
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

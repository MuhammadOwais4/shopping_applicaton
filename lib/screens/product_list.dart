import 'package:flutter/cupertino.dart';
import 'package:shopping_applicaton/Data/global_variables.dart';
import 'package:shopping_applicaton/screens/product_description.dart';
import 'package:shopping_applicaton/widgets/brands_filter.dart';
import 'package:shopping_applicaton/widgets/custom_appbar.dart';
import 'package:shopping_applicaton/widgets/product_card.dart';

class ProductsList extends StatelessWidget {
  const ProductsList({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: Column(
          children: [
            const CustomAppBar(),
            // Brands

            const BrandsFilter(),

            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  // print("constraints.minHeight ${constraints.minHeight}");
                  // print("constraints.maxHeight ${constraints.maxHeight}");
                  // print("constraints.minWidth ${constraints.minWidth}");
                  // print("constraints.maxWidth ${constraints.maxWidth}");

                  if (constraints.maxWidth >= 1050) {
                    return GridView.builder(
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.75,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (context) {
                            //     return const ProductDescription();
                            //   },
                            // )
                            // );
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (context) => ProductDescription(
                                  data: products[index],
                                ),
                              ),
                            );
                          },
                          child: ProductCard(
                            data: products[index],
                            bgColor: index.isEven
                                ? const Color.fromRGBO(216, 240, 253, 1)
                                : const Color.fromRGBO(245, 247, 249, 1),
                          ),
                        );
                      },
                    );
                  } else {
                    return ListView.builder(
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        // return InkWell(
                        return GestureDetector(
                          onTap: () {
                            // Navigator.of(context).push(MaterialPageRoute(
                            //   builder: (context) {
                            //     return const ProductDescription();
                            //   },
                            // )
                            // );
                            Navigator.of(context).push(
                              CupertinoPageRoute(
                                builder: (context) => ProductDescription(
                                  data: products[index],
                                ),
                              ),
                            );
                          },
                          child: ProductCard(
                            data: products[index],
                            bgColor: index.isEven
                                ? const Color.fromRGBO(216, 240, 253, 1)
                                : const Color.fromRGBO(245, 247, 249, 1),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

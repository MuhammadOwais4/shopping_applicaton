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
    // var size = MediaQuery.of(context).size;
    var size = MediaQuery.sizeOf(context);

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
            size.width <= 900
                ? Expanded(
                    child: ListView.builder(
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
                    ),
                  )
                : Expanded(
                    child: GridView.builder(
                      itemCount: products.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 1.75,
                        crossAxisCount: 2,
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
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

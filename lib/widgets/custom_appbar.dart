import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(
          255,
          255,
          255,
          1,
        ),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(
          20,
        ),
      ),
    );
    return Row(
      children: [
        Text(
          "Shopping \nApp😎",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(
          width: 12,
        ),
        const Expanded(
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
              ),
              hintText: "Search",
              enabledBorder: border,
              focusedBorder: border,
            ),
          ),
        ),
      ],
    );
  }
}

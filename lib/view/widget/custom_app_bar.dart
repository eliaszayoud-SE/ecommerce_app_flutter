import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final String titleAppBar;
  final void Function()? onPressedSearch;
  final void Function()? onPressedIconFavorite;
  final TextEditingController textEditingController;
  final void Function(String)? onChanged;
  const CustomAppBar({super.key, required this.titleAppBar, required this.onPressedSearch,required this.onPressedIconFavorite, required this.textEditingController,required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Expanded(
              child: TextFormField(
                onChanged: onChanged,
                controller: textEditingController,
                decoration: InputDecoration(
                    prefixIcon: IconButton(icon: Icon(
                      Icons.search_outlined,
                      size: 25,
                      color: Colors.grey[600],
                    ), onPressed: onPressedSearch,),

                    filled: true,
                    hintText: titleAppBar,
                    hintStyle:const TextStyle(fontSize: 18),
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(20))),
              )),
          const SizedBox(width: 15),
          Container(
            padding:const EdgeInsets.all(6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey[200]),
            child: IconButton(
              onPressed: onPressedIconFavorite,
              icon: Icon(
                Icons.favorite_border_outlined,
                size: 30,
                color: Colors.grey[600],
              ),
            ),
          )
        ],
      ),
    );
  }
}

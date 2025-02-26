import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShoeStoreSearchBar extends StatelessWidget {
  const ShoeStoreSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(15.0),
      child: SearchBar(
        hintText: 'What boots are you looking for?',
        hintStyle: MaterialStatePropertyAll(
            TextStyle(
                color:  Colors.grey
            )),
        trailing: [
          Icon(Icons.search)
        ],
        elevation: MaterialStatePropertyAll(1),
      ),
    );
  }
}

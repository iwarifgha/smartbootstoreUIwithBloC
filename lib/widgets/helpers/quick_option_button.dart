import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class QuickOptionButton extends StatelessWidget {
  const QuickOptionButton({super.key, required this.imageLink, required this.name, required this.onTap});

  final String imageLink;
  final String name;
  final VoidCallback onTap;
  final bool isSelected = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: isSelected ? Colors.grey : Colors.greenAccent.shade100,
        borderRadius: BorderRadius.circular(15)
      ),
      width: 100,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(imageLink),
          ),
          Text(
            name,
            style: const TextStyle(
              fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }
}

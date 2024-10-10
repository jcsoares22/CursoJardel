import 'package:flutter/material.dart';

class TextboxWidget extends StatelessWidget {
  final String label;
  const TextboxWidget({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 6,
                  spreadRadius: 0,
                  offset: Offset(0, 1),
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(12),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

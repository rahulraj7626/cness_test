import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(10),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundColor: Colors.black,
            child: Icon(Icons.person, size: 24, color: Colors.white),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              'What would you like to do Sri?',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 15),
            ),
          ),
          const Text(
            'Ariven AI',
            style: TextStyle(
              color: Color(0xFF5E60CE),
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const SizedBox(width: 4),
          const Icon(Icons.auto_awesome, color: Color(0xFF5E60CE), size: 20),
          const SizedBox(width: 8),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class VaniStatusBarWidget extends StatelessWidget {
  const VaniStatusBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          final isMe = index == 0;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                // فتح حالة الشخص عند النقر
              },
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: isMe ? Colors.grey.shade400 : const Color(0xFF075E54),
                            width: 2,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 24,
                          backgroundColor: Colors.teal.shade100,
                          child: Text(isMe ? "أنت" : "C$index", style: const TextStyle(fontSize: 12)),
                        ),
                      ),
                      if (isMe)
                        const CircleAvatar(
                          radius: 9,
                          backgroundColor: Color(0xFF075E54),
                          child: Icon(Icons.add, size: 12, color: Colors.white),
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isMe ? "حالتك" : "جهة $index",
                    style: const TextStyle(fontSize: 11),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

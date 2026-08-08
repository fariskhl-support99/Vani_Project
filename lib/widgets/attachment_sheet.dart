import 'package:flutter/material.dart';

class VaniAttachmentSheet extends StatelessWidget {
  final Function(String choice) onOptionSelected;

  const VaniAttachmentSheet({Key? key, required this.onOptionSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> options = [
      {'title': 'المعرض', 'icon': Icons.image, 'color': Colors.purple},
      {'title': 'الصوتيات', 'icon': Icons.audiotrack, 'color': Colors.orange},
      {'title': 'الملفات', 'icon': Icons.insert_drive_file, 'color': Colors.blue},
      {'title': 'جهة اتصال', 'icon': Icons.person, 'color': Colors.teal},
      {'title': 'استطلاع رأي', 'icon': Icons.poll, 'color': Colors.amber},
      {'title': 'الكاميرا', 'icon': Icons.camera_alt, 'color': Colors.red},
      {'title': 'الموقع', 'icon': Icons.location_on, 'color': Colors.green},
      {'title': 'ترجمة', 'icon': Icons.translate, 'color': Colors.indigo},
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      height: 280,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        itemCount: options.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          final item = options[index];
          return InkWell(
            onTap: () {
              Navigator.pop(context);
              onOptionSelected(item['title']);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 26,
                  backgroundColor: item['color'],
                  child: Icon(item['icon'], color: Colors.white, size: 24),
                ),
                const SizedBox(height: 6),
                Text(item['title'], style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500)),
              ],
            ),
          );
        },
      ),
    );
  }
}

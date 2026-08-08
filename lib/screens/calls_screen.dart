import 'package:flutter/material.dart';

class VaniCallsScreen extends StatelessWidget {
  const VaniCallsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> calls = [
      {'name': 'أحمد', 'type': 'صادرة', 'time': 'اليوم 12:00 م'},
      {'name': 'سارة', 'type': 'واردة', 'time': 'أمس 04:15 م'},
      {'name': 'محمد', 'type': 'فائتة', 'time': 'أمس 09:30 ص'},
      {'name': 'محمود', 'type': 'لم يتم الرد عليها', 'time': 'منذ 3 أيام'},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("المكالمات")),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF075E54),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                onPressed: () {
                  // فتح جهات الاتصال للاختيار بين مكالمة صوتية أو فيديو
                },
                icon: const Icon(Icons.add_call),
                label: const Text("بدء مكالمة", style: TextStyle(fontSize: 16)),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: calls.length,
              itemBuilder: (context, index) {
                final call = calls[index];
                final isMissed = call['type'] == 'فائتة' || call['type'] == 'لم يتم الرد عليها';
                return ListTile(
                  leading: const CircleAvatar(child: Icon(Icons.person)),
                  title: Text(call['name']!),
                  subtitle: Row(
                    children: [
                      Icon(
                        call['type'] == 'صادرة' ? Icons.call_made : Icons.call_received,
                        size: 16,
                        color: isMissed ? Colors.red : Colors.green,
                      ),
                      const SizedBox(width: 4),
                      Text("${call['type']} • ${call['time']}"),
                    ],
                  ),
                  trailing: const Icon(Icons.call, color: Color(0xFF075E54)),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

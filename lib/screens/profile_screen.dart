import 'package:flutter/material.dart';

class VaniProfileScreen extends StatelessWidget {
  const VaniProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الملف الشخصي")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // الغلاف والصورة الشخصية
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.teal.shade200, borderRadius: BorderRadius.circular(8)),
                  child: const Center(child: Text("صورة الغلاف (اختيارية)")),
                ),
                const CircleAvatar(radius: 40, backgroundColor: Colors.white, child: CircleAvatar(radius: 38, child: Icon(Icons.person, size: 40))),
              ],
            ),
            const SizedBox(height: 16),
            TextField(decoration: const InputDecoration(labelText: "الاسم (إجباري - حتى 30 حرف)")),
            TextField(decoration: const InputDecoration(labelText: "اسم المستخدم (@ - إجباري)")),
            TextField(maxLength: 65, decoration: const InputDecoration(labelText: "النبذة (فقاعة فوق الصورة - حتى 65 حرف)")),
            TextField(maxLength: 550, maxLines: 3, decoration: const InputDecoration(labelText: "حول (وصف - حتى 550 حرف)")),
            const Divider(),
            const Align(alignment: Alignment.centerRight, child: Text("الروابط المضافة (فيسبوك، انستجرام، تيكتوك، القناة، موقع)", style: TextStyle(fontWeight: FontWeight.bold))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(Icons.facebook, color: Colors.blue),
                Icon(Icons.camera_alt, color: Colors.purple),
                Icon(Icons.video_library, color: Colors.black),
                Icon(Icons.campaign, color: Colors.teal),
                Text("🌐", style: TextStyle(fontSize: 24)),
              ],
            ),
            const SizedBox(height: 16),
            const ListTile(
              title: Text("الـ ID الخاص بك (ثابت)"),
              subtitle: Text("VANI_88492011"),
              trailing: Icon(Icons.copy),
            ),
          ],
        ),
      ),
    );
  }
}

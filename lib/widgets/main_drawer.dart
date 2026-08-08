import 'package:flutter/material.dart';

class VaniMainDrawer extends StatelessWidget {
  const VaniMainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> drawerItems = [
      {'title': 'الملف الشخصي', 'icon': Icons.account_circle_outlined},
      {'title': 'الحساب', 'icon': Icons.manage_accounts_outlined},
      {'title': 'الدردشات', 'icon': Icons.chat_outlined},
      {'title': 'الخصوصية', 'icon': Icons.lock_outline},
      {'title': 'الرسائل المحفوظة', 'icon': Icons.bookmark_outline},
      {'title': 'ربط جهاز مصاحب', 'icon': Icons.qr_code_scanner},
      {'title': 'رسالة جماعية', 'icon': Icons.campaign_outlined},
      {'title': 'قائمة المحظورين', 'icon': Icons.block_outlined},
      {'title': 'جهات الاتصال', 'icon': Icons.contacts_outlined},
      {'title': 'الوضع', 'icon': Icons.dark_mode_outlined},
      {'title': 'اللغة', 'icon': Icons.language_outlined},
      {'title': 'الوسائط و الملفات', 'icon': Icons.perm_media_outlined},
    ];

    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(color: Color(0xFF075E54)),
            accountName: const Text("Faris", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            accountEmail: const Text("@faris_username"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Text("F", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.teal.shade800)),
            ),
          ),
          Expanded(
            child: ListView.separated(
              itemCount: drawerItems.length,
              separatorBuilder: (context, index) => const Divider(height: 1, indent: 50),
              itemBuilder: (context, index) {
                final item = drawerItems[index];
                return ListTile(
                  leading: Icon(item['icon'], color: const Color(0xFF075E54)),
                  title: Text(item['title'], style: const TextStyle(fontSize: 15)),
                  onTap: () {
                    Navigator.pop(context);
                    // هنا يتم فتح الشاشة المناسبة للخيارات
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

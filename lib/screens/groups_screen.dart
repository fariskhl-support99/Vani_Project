import 'package:flutter/material.dart';

class VaniGroupsScreen extends StatefulWidget {
  const VaniGroupsScreen({Key? key}) : super(key: key);

  @override
  State<VaniGroupsScreen> createState() => _VaniGroupsScreenState();
}

class _VaniGroupsScreenState extends State<VaniGroupsScreen> with SingleTickerProviderStateMixin {
  late TabController _groupFolderController;
  final List<String> _groupFolders = ['الكل', 'غير مقروءة', 'عامة', 'خاصة', 'اشراف'];

  @override
  void initState() {
    super.initState();
    _groupFolderController = TabController(length: _groupFolders.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("المجموعات"),
        bottom: TabBar(
          controller: _groupFolderController,
          isScrollable: true,
          tabs: _groupFolders.map((folder) => Tab(text: folder)).toList(),
        ),
      ),
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
                onPressed: () {},
                icon: const Icon(Icons.group_add),
                label: const Text("إنشاء مجموعة", style: TextStyle(fontSize: 16)),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _groupFolderController,
              children: _groupFolders.map((folder) {
                return ListView.builder(
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const CircleAvatar(backgroundColor: Colors.teal, child: Icon(Icons.group, color: Colors.white)),
                      title: Text("مجموعة ${index + 1}"),
                      subtitle: Text("قسم: $folder"),
                      trailing: const Icon(Icons.more_vert),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

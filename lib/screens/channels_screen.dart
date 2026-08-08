import 'package:flutter/material.dart';

class VaniChannelsScreen extends StatefulWidget {
  const VaniChannelsScreen({Key? key}) : super(key: key);

  @override
  State<VaniChannelsScreen> createState() => _VaniChannelsScreenState();
}

class _VaniChannelsScreenState extends State<VaniChannelsScreen> with SingleTickerProviderStateMixin {
  late TabController _channelFolderController;
  final List<String> _channelFolders = ['الكل', 'غير مقروءة', 'العامة', 'الخاصة', 'الاشراف'];

  @override
  void initState() {
    super.initState();
    _channelFolderController = TabController(length: _channelFolders.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("القنوات"),
        bottom: TabBar(
          controller: _channelFolderController,
          isScrollable: true,
          tabs: _channelFolders.map((folder) => Tab(text: folder)).toList(),
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
                icon: const Icon(Icons.add_broadcast),
                label: const Text("إنشاء قناة", style: TextStyle(fontSize: 16)),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _channelFolderController,
              children: _channelFolders.map((folder) {
                return ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const CircleAvatar(backgroundColor: Colors.deepOrange, child: Icon(Icons.campaign, color: Colors.white)),
                      title: Text("قناة Vani الرسمية ${index + 1}"),
                      subtitle: Text("متابعة • مجلد $folder"),
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

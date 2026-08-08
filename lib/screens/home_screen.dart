import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';
import '../widgets/status_bar_widget.dart';

class VaniHomeScreen extends StatefulWidget {
  const VaniHomeScreen({Key? key}) : super(key: key);

  @override
  State<VaniHomeScreen> createState() => _VaniHomeScreenState();
}

class _VaniHomeScreenState extends State<VaniHomeScreen> with SingleTickerProviderStateMixin {
  int _bottomIndex = 0;
  late TabController _folderTabController;
  final List<String> _chatFolders = ['الكل', 'غير مقروءة', 'العادية', 'الانشطة التجارية'];

  @override
  void initState() {
    super.initState();
    _folderTabController = TabController(length: _chatFolders.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const VaniMainDrawer(),
      appBar: AppBar(
        titleSpacing: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),
        title: Row(
          children: [
            IconButton(icon: const Icon(Icons.search), onPressed: () {}),
            const Spacer(),
            const Text("Vani", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
            const SizedBox(width: 16),
          ],
        ),
        bottom: TabBar(
          controller: _folderTabController,
          isScrollable: true,
          tabs: _chatFolders.map((folder) => Tab(text: folder)).toList(),
        ),
      ),
      body: Column(
        children: [
          const VaniStatusBarWidget(),
          const Divider(height: 1),
          Expanded(
            child: TabBarView(
              controller: _folderTabController,
              children: _chatFolders.map((folder) {
                return ListView.builder(
                  itemCount: 6,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.person)),
                      title: Text("محادثة خاصة ${index + 1}"),
                      subtitle: Text("رسالة تجريبية في مجلد ($folder)"),
                      trailing: const Text("10:30 ص", style: TextStyle(fontSize: 11)),
                    );
                  },
                );
              }).toList(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _bottomIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index) => setState(() => _bottomIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'الدردشات'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'المجموعات'),
          BottomNavigationBarItem(icon: Icon(Icons.campaign), label: 'القنوات'),
          BottomNavigationBarItem(icon: Icon(Icons.call), label: 'المكالمات'),
        ],
      ),
    );
  }
}

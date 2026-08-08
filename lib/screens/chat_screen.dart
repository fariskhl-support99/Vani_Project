import 'package:flutter/material.dart';
import '../widgets/attachment_sheet.dart';
import '../utils/vani_markdown.dart';

class VaniChatScreen extends StatefulWidget {
  final String chatName;
  const VaniChatScreen({Key? key, required this.chatName}) : super(key: key);

  @override
  State<VaniChatScreen> createState() => _VaniChatScreenState();
}

class _VaniChatScreenState extends State<VaniChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<String> _messages = ["مرحباً بك في Vani!", "*رسالة عريضة* تجريبية"];

  void _sendMessage() {
    if (_messageController.text.trim().isNotEmpty) {
      setState(() {
        _messages.add(_messageController.text.trim());
        _messageController.clear();
      });
    }
  }

  void _showAttachmentMenu() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) => VaniAttachmentSheet(
        onOptionSelected: (choice) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('تم اختيار: $choice')),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.chatName),
        actions: [
          IconButton(icon: const Icon(Icons.call), onPressed: () {}),
          IconButton(icon: const Icon(Icons.videocam), onPressed: () {}),
          IconButton(icon: const Icon(Icons.more_vert), onPressed: () {}),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return Align(
                  alignment: index % 2 == 0 ? Alignment.centerLeft : Alignment.centerRight,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: index % 2 == 0 ? Colors.white : const Color(0xFFDCF8C6),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: VaniMarkdownText(text: _messages[index]),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            color: Colors.white,
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.attach_file, color: Color(0xFF075E54)),
                  onPressed: _showAttachmentMenu,
                ),
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: "اكتب رسالة...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Color(0xFF075E54)),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

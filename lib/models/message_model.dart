enum MessageType { text, image, audio, file, contact, poll, location }

class VaniMessageModel {
  final String messageId;
  final String senderId;
  final String chatId;
  final String textContent;
  final MessageType type;
  final String? mediaUrl;
  final DateTime timestamp;
  final bool isSavedMessage; // هل هي رسالة محفوظة
  final List<String> readByUsers; // مؤشرات قراءة الرسائل

  VaniMessageModel({
    required this.messageId,
    required this.senderId,
    required this.chatId,
    required this.textContent,
    required this.type,
    this.mediaUrl,
    required this.timestamp,
    this.isSavedMessage = false,
    this.readByUsers = const [],
  });

  Map<String, dynamic> toMap() {
    return {
      'message_id': messageId,
      'sender_id': senderId,
      'chat_id': chatId,
      'text_content': textContent,
      'type': type.name,
      'media_url': mediaUrl,
      'timestamp': timestamp.toIso8601String(),
      'is_saved_message': isSavedMessage,
      'read_by_users': readByUsers,
    };
  }

  factory VaniMessageModel.fromMap(Map<String, dynamic> map) {
    return VaniMessageModel(
      messageId: map['message_id'] ?? '',
      senderId: map['sender_id'] ?? '',
      chatId: map['chat_id'] ?? '',
      textContent: map['text_content'] ?? '',
      type: MessageType.values.firstWhere((e) => e.name == map['type'], orElse: () => MessageType.text),
      mediaUrl: map['media_url'],
      timestamp: DateTime.parse(map['timestamp']),
      isSavedMessage: map['is_saved_message'] ?? false,
      readByUsers: List<String>.from(map['read_by_users'] ?? []),
    );
  }
}

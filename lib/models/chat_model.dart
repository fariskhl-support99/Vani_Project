class VaniPrivateChatModel {
  final String chatId; // معرف المحادثة
  final String participantId; // معرف الطرف الآخر
  final String participantName; // اسم الطرف الآخر
  final String? participantImage; // صورة البروفايل للطرف الآخر
  final String lastMessage; // النص الأخير للرسالة
  final DateTime lastMessageTime; // وقت آخر رسالة
  final int unreadCount; // عدد الرسائل غير المقروءة
  
  // تخصيصات وتفضيلات الدردشة الخاصة
  final bool isMuted; // مكتومة أم لا
  final bool isLocked; // مقفلة ببصمة/رمز أم لا
  final bool isArchived; // مؤرشفة أم لا
  final String? customTheme; // السمة المخصصة لهذه المحادثة
  final String? customBubble; // فقاعة الرسائل المخصصة
  final int messageTimerDays; // مؤقت اختفاء الرسائل (0 = إيقاف، 1، 7، 30، 90 يوم)
  final bool autoSaveMedia; // حفظ الوسائط تلقائياً أم لا
  final List<String> folders; // المجلدات المضافة إليها (الكل، غير مقروءة، العادية...)

  VaniPrivateChatModel({
    required this.chatId,
    required this.participantId,
    required this.participantName,
    this.participantImage,
    required this.lastMessage,
    required this.lastMessageTime,
    this.unreadCount = 0,
    this.isMuted = false,
    this.isLocked = false,
    this.isArchived = false,
    this.customTheme,
    this.customBubble,
    this.messageTimerDays = 0,
    this.autoSaveMedia = true,
    required this.folders,
  });

  Map<String, dynamic> toMap() {
    return {
      'chat_id': chatId,
      'participant_id': participantId,
      'participant_name': participantName,
      'participant_image': participantImage,
      'last_message': lastMessage,
      'last_message_time': lastMessageTime.toIso8601String(),
      'unread_count': unreadCount,
      'is_muted': isMuted,
      'is_locked': isLocked,
      'is_archived': isArchived,
      'custom_theme': customTheme,
      'custom_bubble': customBubble,
      'message_timer_days': messageTimerDays,
      'auto_save_media': autoSaveMedia,
      'folders': folders,
    };
  }

  factory VaniPrivateChatModel.fromMap(Map<String, dynamic> map) {
    return VaniPrivateChatModel(
      chatId: map['chat_id'] ?? '',
      participantId: map['participant_id'] ?? '',
      participantName: map['participant_name'] ?? '',
      participantImage: map['participant_image'],
      lastMessage: map['last_message'] ?? '',
      lastMessageTime: DateTime.parse(map['last_message_time']),
      unreadCount: map['unread_count'] ?? 0,
      isMuted: map['is_muted'] ?? false,
      isLocked: map['is_locked'] ?? false,
      isArchived: map['is_archived'] ?? false,
      customTheme: map['custom_theme'],
      customBubble: map['custom_bubble'],
      messageTimerDays: map['message_timer_days'] ?? 0,
      autoSaveMedia: map['auto_save_media'] ?? true,
      folders: List<String>.from(map['folders'] ?? ['الكل']),
    );
  }
}

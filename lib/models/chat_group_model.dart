enum ChatType { private, group, channel }

class VaniChatModel {
  final String chatId;
  final String title;
  final ChatType type;
  final String? ownerId; // مالك المجموعة/القناة
  final List<String> adminIds; // المالك والمشرفين
  final List<String> memberIds; // الأعضاء والمتابعين
  final List<String> restrictedUserIds; // الأعضاء المقيدين من إرسال الرسائل
  final Map<String, bool> memberPermissions; // أذونات الأعضاء
  final Map<String, bool> adminPermissions; // أذونات المشرفين
  final String folderCategory; // المجلد (الكل، غير مقروءة، عامة، خاصة، إلخ)

  VaniChatModel({
    required this.chatId,
    required this.title,
    required this.type,
    this.ownerId,
    this.adminIds = const [],
    this.memberIds = const [],
    this.restrictedUserIds = const [],
    this.memberPermissions = const {},
    this.adminPermissions = const {},
    required this.folderCategory,
  });

  Map<String, dynamic> toMap() {
    return {
      'chat_id': chatId,
      'title': title,
      'type': type.name,
      'owner_id': ownerId,
      'admin_ids': adminIds,
      'member_ids': memberIds,
      'restricted_user_ids': restrictedUserIds,
      'member_permissions': memberPermissions,
      'admin_permissions': adminPermissions,
      'folder_category': folderCategory,
    };
  }

  factory VaniChatModel.fromMap(Map<String, dynamic> map) {
    return VaniChatModel(
      chatId: map['chat_id'] ?? '',
      title: map['title'] ?? '',
      type: ChatType.values.firstWhere((e) => e.name == map['type'], orElse: () => ChatType.private),
      ownerId: map['owner_id'],
      adminIds: List<String>.from(map['admin_ids'] ?? []),
      memberIds: List<String>.from(map['member_ids'] ?? []),
      restrictedUserIds: List<String>.from(map['restricted_user_ids'] ?? []),
      memberPermissions: Map<String, bool>.from(map['member_permissions'] ?? {}),
      adminPermissions: Map<String, bool>.from(map['admin_permissions'] ?? {}),
      folderCategory: map['folder_category'] ?? 'الكل',
    );
  }
}

class VaniUserModel {
  final String userId; // الـ ID الثابت
  final String email;
  final String name; // الاسم (حتى 30 حرف، بدون إيموجي)
  final String username; // اسم المستخدم (@)
  final String? profilePicUrl; // الصورة الدائرية
  final String? coverPicUrl; // صورة الغلاف المستطيلة
  final String? about; // حول (حتى 550 حرف)
  final String? bioBubble; // النبذة الفقاعية (حتى 65 حرف)
  final Map<String, String>? socialLinks; // روابط المنصات الخمسة

  VaniUserModel({
    required this.userId,
    required this.email,
    required this.name,
    required this.username,
    this.profilePicUrl,
    this.coverPicUrl,
    this.about,
    this.bioBubble,
    this.socialLinks,
  }) {
    assert(name.length <= 30, 'الاسم لا يمكن أن يتجاوز 30 حرفاً');
    if (about != null) {
      assert(about!.length <= 550, 'قسم حول لا يمكن أن يتجاوز 550 حرفاً');
    }
    if (bioBubble != null) {
      assert(bioBubble!.length <= 65, 'النبذة لا يمكن أن تتجاوز 65 حرفاً');
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'user_id': userId,
      'email': email,
      'name': name,
      'username': username,
      'profile_pic_url': profilePicUrl,
      'cover_pic_url': coverPicUrl,
      'about': about,
      'bio_bubble': bioBubble,
      'social_links': socialLinks,
    };
  }

  factory VaniUserModel.fromMap(Map<String, dynamic> map) {
    return VaniUserModel(
      userId: map['user_id'] ?? '',
      email: map['email'] ?? '',
      name: map['name'] ?? '',
      username: map['username'] ?? '',
      profilePicUrl: map['profile_pic_url'],
      coverPicUrl: map['cover_pic_url'],
      about: map['about'],
      bioBubble: map['bio_bubble'],
      socialLinks: Map<String, String>.from(map['social_links'] ?? {}),
    );
  }
}

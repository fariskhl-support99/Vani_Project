class VaniValidators {
  /// التثبت من الاسم (يدعم جميع الحروف والزخارف حتى 30 حرف، يمنع الإيموجي)
  static bool isValidName(String name) {
    if (name.isEmpty || name.length > 30) return false;
    // منع رموز الإيموجي
    final emojiRegex = RegExp(r'[\u{1F600}-\u{1F64F}\u{1F300}-\u{1F5FF}\u{1F680}-\u{1F6FF}\u{1F700}-\u{1F77F}]', unicode: true);
    return !emojiRegex.hasMatch(name);
  }

  /// التثبت من اسم المستخدم @ (حروف إنجليزية، أرقام، . و -)
  static bool isValidUsername(String username) {
    final usernameRegex = RegExp(r'^[a-zA-Z0-9.-]+$');
    return usernameRegex.hasMatch(username);
  }
}

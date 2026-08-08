import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  // بيانات الربط الخاصة بمشروع Vani
  static const String supabaseUrl = 'https://zvieibdlrmkygyfstje.supabase.co';
  static const String supabaseAnonKey =
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inp2aWVpYmRscm1reWdpeWZzdGplIiwicm9sZSI6ImFub24iLCJpYXQiOjE3ODYxOTMyNjUsImV4cCI6MjEwMTc2OTI2NX0.1TkecpbW3_EWvTMrlELS1Ka9E-O62sBVvmJAXOzlnxc';

  /// تهيئة اتصال Supabase عند بداية تشغيل التطبيق
  static Future<void> initialize() async {
    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseAnonKey,
    );
  }

  /// اختصار للحصول على عميل Supabase في أي مكان داخل الكود
  static SupabaseClient get client => Supabase.instance.client;
}

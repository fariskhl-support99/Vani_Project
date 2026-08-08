import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

class OtpService {
  static const String senderEmail = 'faris.khl.otp@gmail.com';
  // كلمة سر التطبيق الصادرة من جوجل (App Password)
  static const String appPassword = 'lsarvwyymtdrvhjg';

  static Future<bool> sendOtpCode(String recipientEmail, String otpCode) async {
    final smtpServer = gmail(senderEmail, appPassword);

    final message = Message()
      ..from = Address(senderEmail, 'Vani App')
      ..recipients.add(recipientEmail)
      ..subject = 'رمز تفعيل حسابك في Vani'
      ..text = 'رمز التحقق الخاص بك هو: $otpCode';

    try {
      await send(message, smtpServer);
      return true;
    } catch (e) {
      print('خطأ في إرسال البريد: $e');
      return false;
    }
  }
}

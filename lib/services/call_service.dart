import 'package:livekit_client/livekit_client.dart';

class CallService {
  Room? _room;
  bool _isVideoEnabled = false;
  bool _isAudioEnabled = true;

  /// بدء مكالمة جديدة (صوتية أو فيديو)
  Future<bool> startCall({
    required String serverUrl,
    required String roomToken,
    required bool isVideo,
  }) async {
    try {
      _room = Room();
      _isVideoEnabled = isVideo;

      // خيارات الاتصال بالخادم
      const roomOptions = RoomOptions(
        adaptiveStream: true,
        dynacast: true,
      );

      // الاتصال برغفة المكالمة
      await _room!.connect(serverUrl, roomToken, roomOptions: roomOptions);

      // تفعيل الميكروفون
      await _room!.localParticipant?.setMicrophoneEnabled(_isAudioEnabled);

      // تفعيل الكاميرا إذا كانت المكالمة فيديو
      await _room!.localParticipant?.setCameraEnabled(_isVideoEnabled);

      return true;
    } catch (e) {
      print('خطأ أثناء بدء المكالمة: $e');
      return false;
    }
  }

  /// كتم أو تشغيل الميكروفون
  Future<void> toggleMicrophone() async {
    if (_room != null && _room!.localParticipant != null) {
      _isAudioEnabled = !_isAudioEnabled;
      await _room!.localParticipant!.setMicrophoneEnabled(_isAudioEnabled);
    }
  }

  /// إيقاف أو تشغيل الكاميرا
  Future<void> toggleCamera() async {
    if (_room != null && _room!.localParticipant != null) {
      _isVideoEnabled = !_isVideoEnabled;
      await _room!.localParticipant!.setCameraEnabled(_isVideoEnabled);
    }
  }

  /// إنهاء المكالمة وإغلاق الغرفة
  Future<void> endCall() async {
    if (_room != null) {
      await _room!.disconnect();
      await _room!.dispose();
      _room = null;
    }
  }

  // الحصول على الغرفة الحالية لمتابعة حالة المشاركين والشبكة
  Room? get currentRoom => _room;
}

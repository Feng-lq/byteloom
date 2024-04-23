import 'package:speech_to_text/speech_to_text.dart';

class SpeechService {
  late final SpeechToText _speech;
  bool _isListening = false;

  SpeechService() {
    _speech = SpeechToText();
  }

  bool get isListening => _isListening;

  Future<bool> initialize() async {
    return await _speech.initialize();
  }

  Future<void> startListening({required Function(String) onResult}) async {
    if (!_isListening) {
      _isListening = true;
      await _speech.listen(
        onResult: (result) {
          onResult(result.recognizedWords);
        },
      );
    }
  }

  void stopListening() {
    if (_isListening) {
      _speech.stop();
      _isListening = false;
    }
  }
}

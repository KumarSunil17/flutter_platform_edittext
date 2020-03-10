import 'package:flutter/services.dart';

class EditTextController {
  EditTextController(int id)
      : _channel =
            MethodChannel('platformview.kumarsunil17.com/edittext_view$id');

  final MethodChannel _channel;

  Future<void> setText(String text) async {
    assert(text != null);
    return _channel.invokeMethod('setText', text);
  }

  Future<String> getText() async {
    return _channel.invokeMethod('getText');
  }

  Future<void> clearText() async {
    return _channel.invokeMethod('clearText');
  }
}

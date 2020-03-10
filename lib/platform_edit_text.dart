import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterplatformedittext/text_controller.dart';

typedef void EditTextCreatedCallback(EditTextController controller);

const String VIEW_TYPE = 'platformview.kumarsunil17.com/edittext_view';

class PlatFormEditText extends StatelessWidget {
  const PlatFormEditText({Key key, this.onEditTextCreated}) : super(key: key);

  final EditTextCreatedCallback onEditTextCreated;

  @override
  Widget build(BuildContext context) {
    void _onPlatformViewCreated(int id) {
      if (onEditTextCreated == null) {
        return;
      }
      onEditTextCreated(EditTextController(id));
    }

    if (defaultTargetPlatform == TargetPlatform.android) {
      return Container(
        height: 50,
        child: AndroidView(
          viewType: VIEW_TYPE,
          onPlatformViewCreated: _onPlatformViewCreated,
        ),
      );
    }
    return Text(
        '$defaultTargetPlatform is not yet supported by the platform view.');
  }
}

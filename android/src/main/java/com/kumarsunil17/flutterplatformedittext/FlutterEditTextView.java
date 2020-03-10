package com.kumarsunil17.flutterplatformedittext;

import android.content.Context;
import android.graphics.Color;
import android.view.View;
import android.widget.EditText;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugin.platform.PlatformView;

public class FlutterEditTextView implements PlatformView, MethodChannel.MethodCallHandler {
    private final EditText editText;
    private final MethodChannel methodChannel;

    FlutterEditTextView(Context context, BinaryMessenger messenger, int id) {
        editText = new EditText(context);
        editText.setTextColor(Color.BLACK);
        editText.setHint("Type here..");
        editText.setHintTextColor(Color.GRAY);
        methodChannel = new MethodChannel(messenger, "platformview.kumarsunil17.com/edittext_view"+id);
        methodChannel.setMethodCallHandler(this);
    }

    @Override
    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
        switch (methodCall.method) {
            case "setText":
                setText(methodCall, result);
                break;
            case "getText":
                result.success(editText.getText().toString());
                break;
            case "clearText":
                editText.setText("");
                result.success(null);
                break;
            default:
                result.notImplemented();
        }

    }
    private void setText(MethodCall methodCall, MethodChannel.Result result) {
        String text = (String) methodCall.arguments;
        editText.setText(text);
        result.success(null);
    }
    @Override
    public View getView() {
        return editText;
    }

    @Override
    public void dispose() {

    }
}

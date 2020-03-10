package com.kumarsunil17.flutterplatformedittext;

import android.content.Context;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

public class EditTextFactory extends PlatformViewFactory {
    private final BinaryMessenger messenger;

    public EditTextFactory(BinaryMessenger messenger) {
        super(StandardMessageCodec.INSTANCE);
        this.messenger = messenger;
    }

    @Override
    public PlatformView create(Context context, int id, Object o) {
        return new FlutterEditTextView(context, messenger, id);
    }
}

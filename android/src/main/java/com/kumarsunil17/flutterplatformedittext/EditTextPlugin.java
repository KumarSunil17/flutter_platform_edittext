package com.kumarsunil17.flutterplatformedittext;

        import io.flutter.plugin.common.PluginRegistry;

public class EditTextPlugin {
    public static void registerWith(PluginRegistry.Registrar registrar) {
        registrar
                .platformViewRegistry()
                .registerViewFactory(
                        "platformview.kumarsunil17.com/edittext_view", new EditTextFactory(registrar.messenger()));
    }
}

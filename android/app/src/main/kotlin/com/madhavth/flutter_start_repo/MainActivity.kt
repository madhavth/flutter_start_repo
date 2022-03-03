package com.madhavth.flutter_start_repo

import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {
    @Override
 public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
     GeneratedPluginRegistrant.registerWith(flutterEngine);
     new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
             .setMethodCallHandler(
                 (call, result) -> {
                        // Your existing code
               }
        );
    }
}

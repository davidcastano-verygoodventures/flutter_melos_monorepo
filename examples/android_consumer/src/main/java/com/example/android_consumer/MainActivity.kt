package com.example.android_consumer

import android.app.Activity
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity

class MainActivity : Activity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        startActivity(
            FlutterActivity.createDefaultIntent(this)
        )
    }
}

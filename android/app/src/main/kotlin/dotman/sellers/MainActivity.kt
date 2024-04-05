package com.lubumi.sellers

import android.os.Bundle
import com.facebook.FacebookSdk;
import com.facebook.appevents.AppEventsLogger;
import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant


class MainActivity: FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    FacebookSdk.setApplicationId("2276070389100269")
      FacebookSdk.sdkInitialize(getApplicationContext())
  //  AppEventsLogger.activateApp(this)
    GeneratedPluginRegistrant.registerWith(this)

  }
}

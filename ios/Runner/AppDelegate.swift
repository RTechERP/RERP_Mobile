import Flutter
import UIKit
import AVFoundation
import UserNotifications
import FirebaseMessaging

@main
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // iOS 10+: gán delegate để nhận notification callbacks
    if #available(iOS 10.0, *) {
      UNUserNotificationCenter.current().delegate = self
    }

    // Yêu cầu register remote notifications để iOS cấp APNS token
    // Firebase SDK sẽ tự động nhận token qua didRegisterForRemoteNotificationsWithDeviceToken
    application.registerForRemoteNotifications()

    GeneratedPluginRegistrant.register(with: self)

    // Setup camera mute channel
    let controller = window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel(
      name: "com.rerp/camera_mute",
      binaryMessenger: controller.binaryMessenger
    )
    channel.setMethodCallHandler { [weak self] call, result in
      if call.method == "muteShutter" {
        self?.muteShutterSound()
        result(nil)
      } else {
        result(FlutterMethodNotImplemented)
      }
    }

    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  private func muteShutterSound() {
    // iOS: Override system sound with silence
    // On Japanese iPhones shutter sound cannot be muted, but we try to suppress it
    let audioSession = AVAudioSession.sharedInstance()
    do {
      try audioSession.setCategory(.playback, options: .mixWithOthers)
      try audioSession.setActive(true)
    } catch {}
  }

  // Khi FirebaseAppDelegateProxyEnabled = false, phải tự truyền APNS token sang Firebase
  override func application(
    _ application: UIApplication,
    didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
  ) {
    // Log APNS token (debug)
    let tokenParts = deviceToken.map { String(format: "%02.2hhx", $0) }
    let token = tokenParts.joined()
    NSLog("[APNs] Token: \(token)")

    Messaging.messaging().apnsToken = deviceToken

    // Lấy FCM token sau khi có APNS token
    Messaging.messaging().token { fcmToken, error in
      if let error = error {
        NSLog("[APNs] Loi lay FCM token: \(error.localizedDescription)")
      } else if let fcmToken = fcmToken {
        NSLog("[APNs] FCM Token: \(fcmToken)")
      }
    }
  }

  override func application(
    _ application: UIApplication,
    didFailToRegisterForRemoteNotificationsWithError error: Error
  ) {
    NSLog("[APNs] Loi dang ky: \(error.localizedDescription)")
  }

  // Vì FirebaseAppDelegateProxyEnabled = false, notification không được tự động
  // forward về Flutter — phải implement delegate để đẩy notification về Flutter
  @available(iOS 10.0, *)
  override func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    willPresent notification: UNNotification,
    withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
  ) {
    NSLog("[UNUserNotificationCenter] willPresent: \(notification.request.content.userInfo)")
    // Hiển thị notification ngay cả khi app đang ở foreground
    if #available(iOS 14.0, *) {
      completionHandler([.banner, .badge, .sound])
    } else {
      completionHandler([.alert, .badge, .sound])
    }
  }

  @available(iOS 10.0, *)
  override func userNotificationCenter(
    _ center: UNUserNotificationCenter,
    didReceive response: UNNotificationResponse,
    withCompletionHandler completionHandler: @escaping () -> Void
  ) {
    NSLog("[UNUserNotificationCenter] didReceive: \(response.notification.request.content.userInfo)")
    // Forward notification tap về Flutter
    Messaging.messaging().appDidReceiveMessage(
      response.notification.request.content.userInfo
    )
    completionHandler()
  }

  // Xử lý notification khi app được open từ terminated state
  override func application(
    _ application: UIApplication,
    didReceiveRemoteNotification userInfo: [AnyHashable: Any]
  ) {
    NSLog("[UNUserNotificationCenter] didReceiveRemoteNotification: \(userInfo)")
    Messaging.messaging().appDidReceiveMessage(userInfo)
  }
}

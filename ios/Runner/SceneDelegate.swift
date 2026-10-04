import Flutter
import UIKit

/// SceneDelegate adopts the iOS 13+ scene-based lifecycle.
///
/// UIKit on Xcode 27 requires every app that links UIKit to have a
/// UISceneDelegate wired through UIApplicationSceneManifest. Without it the
/// runtime asserts with `EXC_BREAKPOINT` during launch on the device.
@objc class SceneDelegate: UIResponder, UIWindowSceneDelegate {
  var window: UIWindow?

  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions
  ) {
    guard let windowScene = scene as? UIWindowScene else { return }

    let window = UIWindow(windowScene: windowScene)
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    window.rootViewController = storyboard.instantiateInitialViewController()
    self.window = window
    window.makeKeyAndVisible()
  }
}

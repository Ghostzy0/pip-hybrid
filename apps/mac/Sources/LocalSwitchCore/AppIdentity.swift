import Foundation

/// Each source edition owns separate data and credentials. Stores are never adopted implicitly.
public enum PipAppIdentity {
  #if BASELINE_EDITION
    public static let edition = "baseline"
    public static let isBaseline = true
    public static let displayName = "Pip Hybrid Baseline"
    public static let bundleIdentifier = "app.pip.hybrid.baseline"
  #else
    public static let edition = "pip"
    public static let isBaseline = false
    public static let displayName = "Pip Hybrid"
    public static let bundleIdentifier = "app.pip.hybrid.mac"
  #endif
  public static let historyService = bundleIdentifier + ".history"
  public static let chatGPTService = bundleIdentifier + ".chatgpt"
  public static let secretsService = bundleIdentifier + ".secrets"

  public static var preferences: UserDefaults {
    if ProcessInfo.processInfo.arguments.contains("--qa-output") {
      return UserDefaults(
        suiteName: bundleIdentifier + ".qa.\(ProcessInfo.processInfo.processIdentifier)")!
    }
    // Bundled acceptance apps get their own standard preference domain too.
    if let current = Bundle.main.bundleIdentifier,
      current == bundleIdentifier || current.hasPrefix("app.pip.hybrid.acceptance.")
    {
      return .standard
    }
    return UserDefaults(suiteName: bundleIdentifier)!
  }

  public static func dataRoot(applicationSupport: URL? = nil) -> URL {
    let base =
      applicationSupport
      ?? FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask)[0]
    return base.appendingPathComponent(displayName, isDirectory: true)
  }

  public static func modelRoot(applicationSupport: URL? = nil) -> URL {
    dataRoot(applicationSupport: applicationSupport).appendingPathComponent(
      "Models", isDirectory: true)
  }
}

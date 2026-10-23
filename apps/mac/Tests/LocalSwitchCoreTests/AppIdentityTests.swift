import Foundation
import LocalSwitchCore
import XCTest

@MainActor final class AppIdentityTests: XCTestCase {
  func testNewModelStoreDoesNotAdoptOrAlterLegacyFiles() throws {
    let support = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
    defer { try? FileManager.default.removeItem(at: support) }
    let legacy = support.appendingPathComponent("LocalSwitch/Models", isDirectory: true)
    try FileManager.default.createDirectory(at: legacy, withIntermediateDirectories: true)
    let descriptor = ModelDescriptor.catalogue[0]
    let marker = legacy.appendingPathComponent("original-owner-data")
    let bytes = Data("Unchanged legacy model-store sentinel".utf8)
    try bytes.write(to: marker)

    let store = try ModelStore(root: PipAppIdentity.modelRoot(applicationSupport: support))
    XCTAssertNil(store.installedURL(for: descriptor))
    XCTAssertNotEqual(store.root, legacy)
    XCTAssertEqual(try Data(contentsOf: marker), bytes)
    XCTAssertEqual(
      store.root,
      support.appendingPathComponent(PipAppIdentity.displayName, isDirectory: true)
        .appendingPathComponent("Models", isDirectory: true))
  }

  func testProtectedNamespacesRemainIndependentFromOriginalApp() {
    let services = [
      PipAppIdentity.historyService, PipAppIdentity.chatGPTService, PipAppIdentity.secretsService,
    ]
    XCTAssertEqual(Set(services).count, 3)
    XCTAssertEqual(
      services,
      [
        PipAppIdentity.bundleIdentifier + ".history",
        PipAppIdentity.bundleIdentifier + ".chatgpt",
        PipAppIdentity.bundleIdentifier + ".secrets",
      ])
    XCTAssertFalse(services.contains { $0.hasPrefix("app.localswitch.") })
    XCTAssertNotEqual(PipAppIdentity.bundleIdentifier, "app.localswitch.mac")
  }

  func testEditionUsesExpectedIdentityAndRejectsOtherEditionNamespace() throws {
    #if BASELINE_EDITION
      let expectedEdition = "baseline"
      let expectedName = "Pip Hybrid Baseline"
      let expectedBundle = "app.pip.hybrid.baseline"
      let otherName = "Pip Hybrid"
      let otherBundle = "app.pip.hybrid.mac"
      XCTAssertTrue(PipAppIdentity.isBaseline)
    #else
      let expectedEdition = "pip"
      let expectedName = "Pip Hybrid"
      let expectedBundle = "app.pip.hybrid.mac"
      let otherName = "Pip Hybrid Baseline"
      let otherBundle = "app.pip.hybrid.baseline"
      XCTAssertFalse(PipAppIdentity.isBaseline)
    #endif
    XCTAssertEqual(PipAppIdentity.edition, expectedEdition)
    XCTAssertEqual(PipAppIdentity.displayName, expectedName)
    XCTAssertEqual(PipAppIdentity.bundleIdentifier, expectedBundle)

    let support = FileManager.default.temporaryDirectory.appendingPathComponent(UUID().uuidString)
    defer { try? FileManager.default.removeItem(at: support) }
    let otherRoot = support.appendingPathComponent(otherName, isDirectory: true)
    let otherModels = otherRoot.appendingPathComponent("Models", isDirectory: true)
    try FileManager.default.createDirectory(at: otherModels, withIntermediateDirectories: true)
    let marker = otherModels.appendingPathComponent("other-edition-sentinel")
    let bytes = Data("Unchanged other edition data".utf8)
    try bytes.write(to: marker)

    let store = try ModelStore(root: PipAppIdentity.modelRoot(applicationSupport: support))
    XCTAssertNil(store.installedURL(for: ModelDescriptor.catalogue[0]))
    XCTAssertNotEqual(store.root, otherModels)
    XCTAssertNotEqual(PipAppIdentity.dataRoot(applicationSupport: support), otherRoot)
    XCTAssertEqual(try Data(contentsOf: marker), bytes)
    for service in [
      PipAppIdentity.historyService, PipAppIdentity.chatGPTService, PipAppIdentity.secretsService,
    ] {
      XCTAssertFalse(service.hasPrefix(otherBundle + "."))
    }
  }

}

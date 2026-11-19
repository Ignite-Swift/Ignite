//
//  PrivacySensitive.swift
//  Ignite
//  https://www.github.com/twostraws/Ignite
//  See LICENSE for license information.
//

import Foundation
import Testing

@testable import Ignite

/// Tests for the `PrivacySensitive` modifier.
@Suite("PrivacySensitive Tests")
struct PrivacySensitiveTests {
    @Test("Privacy Sensitive Modifier", .publishingContext(), arguments: [
        (PrivacyEncoding.urlOnly,
         ##"<a privacy-sensitive="urlOnly" href="#" class="protected-link" data-encoded-url="Lw==">Go Home</a>"##),
        (PrivacyEncoding.urlAndDisplay,
         ##"<a privacy-sensitive="urlAndDisplay" href="#" class="protected-link" data-encoded-url="Lw==">R28gSG9tZQ==</a>"##)
    ])
    func privacySensitive(encoding: PrivacyEncoding, expected: String) async throws {
        let element = Link("Go Home", target: "/").privacySensitive(encoding)
        let output = element.markupString()

        #expect(output == expected)
    }
}

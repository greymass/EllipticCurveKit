//
//  TestVectorStrings.swift
//  EllipticCurveKitTests
//
//  Created by Alexander Cyon on 2018-09-17.
//  Copyright © 2018 Alexander Cyon. All rights reserved.
//

import Foundation

@testable import EllipticCurveKit

struct TestVectorStrings: Codable {
    enum CodingKeys: String, CodingKey {
        case name = "Count"
        case entropy = "EntropyInput"
        case nonce = "Nonce"
        case personalizationString = "PersonalizationString"
        case entropyInputReseed = "EntropyInputReseed"
        case additionalInputReseed = "AdditionalInputReseed"
        case expected = "ReturnedBits"
        case generateCalls = "GenerateCalls"
        case keyValueAfterInit = "KeyValueAfterInit"
    }

    let name: String
    let entropy: String
    let nonce: String
    let personalizationString: String?
    let entropyInputReseed: String?
    let additionalInputReseed: String?
    let expected: String
    let keyValueAfterInit: KeyValue
    let generateCalls: [Generate]
}

extension TestVectorStrings {
    func asTestVector() -> TestVector {



        return TestVector(
            name: name,
            entropy: s2d(entropy),
            nonce: s2d(nonce),
            personalizationString: s2d(o: personalizationString),
            entropyInputReseed: s2d(o: entropyInputReseed),
            additionalInputReseed: s2d(o: entropyInputReseed),
            keyValueAfterInit: keyValueAfterInit,
            generateCalls: generateCalls,
            expected: s2d(expected)
        )
    }
}

func s2d(_ string: String) -> Data {
    return Number(hexString: string)!.asTrimmedData()
}

func s2d(o string: String?) -> Data? {
    guard let string = string else { return nil }
    return s2d(string)
}

//
//  ConnectorType.swift
//  ChargeEasy
//
//  Created by Abdoulaye Yagmar Doumbia on 10/08/2024.
//

import Foundation

enum ConnectorType: String {
    case Type2 = "Type 2"
    case CCS2 = "CCS2"
    case CHAdeMO = "CHAdeMO"
    case Tesla = "Tesla"
    case GB_T = "GB/T"
    
    var description: String {
        switch self {
        case .Type2:
            return "Type 2: A widely used AC connector in Europe, compatible with most public charging stations. Supports 3-phase charging and is often used for home and public AC charging."
        case .CCS2:
            return "CCS2: Combines a Type 2 connector with two additional pins for fast DC charging. Widely adopted in Europe for rapid charging at high power levels."
        case .CHAdeMO:
            return "CHAdeMO: A DC fast charging standard developed in Japan. Allows high-power charging and supports bi-directional charging, enabling vehicle-to-grid (V2G) capabilities."
        case .Tesla:
            return "Tesla: A proprietary connector used by Tesla vehicles. It supports both AC and DC charging and is compatible with Tesla's Supercharger network, enabling very fast charging."
        case .GB_T:
            return "GB/T: A standard used in China for both AC and DC charging. The connector is part of China's national charging infrastructure, supporting a wide range of power levels."
        }
    }
}

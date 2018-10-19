//
//  SeatType.swift
//  demoissumacaw
//
//  Created by Eugen K on 19/10/2018.
//  Copyright © 2018 Eugen K. All rights reserved.
//

import Foundation
import UIKit

enum SeatType: String {
    case available = "free"
    case vip
    case bookedYou = "self_booking"
    case picked
    case booked = "booking"
    case hidden = "hidden"
    
    func getImage() -> UIImage {
        switch self {
        case .available:
            return UIImage(named: "seatGrey")!
        case .booked:
            return UIImage(named: "seatRed")!
        case .picked:
            return UIImage(named: "seatWhite")!
        case .bookedYou:
            return UIImage(named: "seatBlue")!
        case .vip:
            return UIImage(named: "seatYellow")!
        case .hidden:
            return UIImage(named: "seatDarkGrey")!
        }
    }
    
    func getSrc() -> String {
        switch self {
        case .available:
            return "seatGrey.png"
        case .booked:
            return "seatRed.png"
        case .picked:
            return "seatWhite.png"
        case .bookedYou:
            return "seatBlue.png"
        case .vip:
            return "seatYellow.png"
        case .hidden:
            return "seatDarkGrey.png"
        }
    }
}

//
//  Seat.swift
//  demoissumacaw
//
//  Created by Eugen K on 19/10/2018.
//  Copyright © 2018 Eugen K. All rights reserved.
//

import Foundation

class Seat {
    let id: String
    var dx: Double
    var dy: Double
    
    var angle: Double
    var type: SeatType
    var publicPid: String
    var pcname: String
    var pcstatus: Bool
    
    init() {
        self.publicPid = "publicPid"
        self.id = "id"
        self.dx = 50
        self.dy = 50
    
        self.angle = 0
        self.type = SeatType.available
        self.pcstatus = true
        self.pcname = ""
    }
    
}

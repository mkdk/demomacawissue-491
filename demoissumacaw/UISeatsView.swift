//
//  UISeatsView.swift
//  winstrike
//
//  Created by PRS on 27/02/2018.
//  Copyright © 2018 PR_Solution. All rights reserved.
//

import UIKit
import Macaw
typealias MImage = Macaw.Image

protocol UISeatsViewDelegate: class {
    func seatPicked(id: String, unselect: Bool, publicPid: String)
}

class UISeatsView: MacawView {
    weak var delegate: UISeatsViewDelegate?
    
    var pickedSeats: Set<String> = []
    
    //swiftlint:disable function_body_length
    func drawRoom() {
        let mainGroup = Group()
        //add seats
        let seat = Seat()
        let seatView = createMImage(seat: seat)
        let image = SeatType.available.getImage()
        
        //create clickable zone
        let substrate = Shape(
            form: Rect(
                x: seat.dx - 2.5,
                y: seat.dy - 2.5,
                w: Double(image.size.width) + 5,
                h: Double(image.size.height) + 5))
        
        substrate.onTap { _ in
            guard seat.type == .available || seat.type == .vip else {
                seatView.sView.opacityVar.animate(to: 0.5)
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    seatView.sView.opacityVar.animate(to: 1)
                }
                return
            }
            
            if !self.pickedSeats.contains(seat.id) {
                self.pickedSeats.insert(seat.id)
                seatView.sView.srcVar.value = SeatType.picked.getSrc()
                self.delegate?.seatPicked(id: seat.id, unselect: false, publicPid: seat.publicPid)
            } else {
                self.pickedSeats.remove(seat.id)
                seatView.sView.srcVar.value = seat.type.getSrc()
                self.delegate?.seatPicked(id: seat.id, unselect: true, publicPid: seat.publicPid)
            }
        }
        
        mainGroup.contents.append(substrate)
        mainGroup.contents.append(seatView.node)
        
        self.node = mainGroup
        
        widthAnchor ~= 100
        heightAnchor ~= 100
    }
    
    private func createMImage(seat: Seat, type: SeatType? = nil) -> MacawSeatView {
        let seatview = MacawSeatView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        let seat = seatview.create(seat: seat, type: type)
        return seat
    }
}

class MacawSeatView: MacawView {
    
    var sView: MImage!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func create(seat: Seat, type: SeatType? = nil) -> MacawSeatView {
        let image = (type ?? seat.type).getImage()
        sView = MImage(image: image, opaque: false)
        
        let seatTransform = Transform
            .move(dx: seat.dx, dy: seat.dy)
            .rotate(
                angle: seat.angle,
                x: Double(image.size.width) / 2,
                y: Double(image.size.height) / 2
        )
        sView.place = seatTransform
        let group = Group(contents: [sView])
        self.node = group
        return self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



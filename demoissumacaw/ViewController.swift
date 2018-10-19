//
//  ViewController.swift
//  demoissumacaw
//
//  Created by Eugen K on 19/10/2018.
//  Copyright © 2018 Eugen K. All rights reserved.
//

import UIKit
import Macaw

class ViewController: UIViewController {
    
    var gameRoomView: UISeatsView!
    let scrollView = UIScrollView()
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _ = textLabel.prepareForAutoLayout()
        addSubView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.contentSize = CGSize(
            width: view.frame.size.width + 32,
            height: view.frame.size.height + 20)
    }
    
    func addSubView() {
        self.view.addSubview(scrollView.prepareForAutoLayout())
        scrollView.pinEdgesToSuperviewEdges(excluding: .top)
        scrollView.topAnchor ~= textLabel.bottomAnchor
        scrollView.maximumZoomScale = 3
        scrollView.minimumZoomScale = 1
        scrollView.delegate = self
        
        gameRoomView = UISeatsView(frame: .zero)
        scrollView.addSubview(gameRoomView.prepareForAutoLayout())
        gameRoomView.drawRoom()
    }

}


// MARK: - UIScrollViewDelegate

extension ViewController: UIScrollViewDelegate {
    func scrollViewDidEndZooming(_ scrollView: UIScrollView, with view: UIView?, atScale scale: CGFloat) {
        scrollView.contentSize = CGSize(
            width: gameRoomView.frame.size.width + 32,
            height: gameRoomView.frame.size.height + 20)
        scrollView.contentInset = UIEdgeInsets.zero
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return gameRoomView
    }
}

//
//  ViewController.swift
//  PullDownMenuContextMenu
//
//  Created by Irtaza Hussain on 25/05/2024.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
        menu = menu.replacingChildren([first, second, third, fourth, deferredMenu])
        navigationItem.rightBarButtonItem?.menu = menu
    }
    
    private lazy var first = UIAction(title: "First", image: UIImage(systemName: "pencil.circle"), attributes: [], state: .off) {_ in
        print("First")
    }
    private lazy var second = UIAction(title: "Second", image: UIImage(systemName: "pencil.circle"), attributes: [], state: .off) {_ in
        print("second")
    }
    private lazy var third = UIAction(title: "Third", image: UIImage(systemName: "pencil.circle"), attributes: [], state: .off) {_ in
        print("third")
    }
    private lazy var fourth = UIAction(title: "Fourth", image: UIImage(systemName: "pencil.circle"), attributes: [], state: .off) {_ in
        print("fourth")
    }
    
    private lazy var camera = UIAction(title: "Camera", image: UIImage(systemName: "camera")){ _ in
        print("camera tapped")
    }
    private lazy var photo = UIAction(title: "Photo", image: UIImage(systemName: "photo.on.rectangle.angled")){ _ in
        print("photo tapped")
    }
    
    private lazy var elements: [UIAction] = [first, second, third, fourth]
    
    private lazy var menu = UIMenu(title: "UI-Menu", children: elements)
    
    private lazy var deferredMenu = UIDeferredMenuElement { (menuElements) in
        let menu = UIMenu(title: "Welcome", options: .displayInline,  children: [self.camera, self.photo])
        menuElements([menu])
    }
    
}


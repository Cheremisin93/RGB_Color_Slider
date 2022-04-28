//
//  MainViewController.swift
//  RGB_ColorView
//
//  Created by Cheremisin Andrey on 28.04.2022.
//

import UIKit


protocol BackColorDelegate: AnyObject {
    
    func setColorMainView(color: UIColor)
}

class MainViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "editColor" {
            let secondVC = segue.destination as? ViewController
            secondVC?.delegateColor = self
            secondVC?.colorBack = view.backgroundColor
        }
    }
}

extension MainViewController: BackColorDelegate {
    func setColorMainView(color: UIColor) {
        self.view.backgroundColor = color
    }
}

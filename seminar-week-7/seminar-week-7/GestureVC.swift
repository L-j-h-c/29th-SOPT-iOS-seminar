//
//  GestureVC.swift
//  seminar-week-7
//
//  Created by Junho Lee on 2021/11/27.
//

import UIKit

class GestureVC: UIViewController {

    @IBOutlet weak var testView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapView(GestureRecognizer:)))
        
        let tapRecognizer2 = UITapGestureRecognizer()
        tapRecognizer.addTarget(self, action: #selector(tapView(GestureRecognizer:)))
        
        testView.addGestureRecognizer(tapRecognizer)
        // Do any additional setup after loading the view.
    }
    
    @objc func tapView(GestureRecognizer: UIGestureRecognizer){
        print("두 번째 코드로 tap")
    }

    @IBAction func tapGesture(_ sender: UITapGestureRecognizer) {
        print("uiView 안에서 tap")
    }
    
    
    
}

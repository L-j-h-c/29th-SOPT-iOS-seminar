//
//  FirstVC.swift
//  seminar-week-7
//
//  Created by Junho Lee on 2021/11/27.
//

import UIKit

class FirstVC: UIViewController {
    
    static let identifier = "FirstVC"
    @IBOutlet weak var textField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func touchUpToSendData(_ sender: Any) {
//        // present 과정에서 데이터 전달
//        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: SecondVC.identifier) as? SecondVC else {return}
//        nextVC.recievedText = textField.text ?? ""
//        present(nextVC, animated: true, completion: nil)
        performSegue(withIdentifier: "presentSecondVC", sender: sender)
        
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: SecondVC.identifier) as? SecondVC else {return}
        
        NotificationCenter.default.addObserver(self, selector: #selector(dataRecieved), name: NSNotification.Name("iOS-Sample"),object: nil)
        
        present(nextVC, animated: true, completion: nil)
    }
    
    @objc func dataRecieved(notification: NSNotification){
        if let text = notification.object as? String {
            textField.text = text
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "presentSecondVC" {
            let nextVC = segue.destination as? SecondVC
            nextVC?.recievedText = textField.text ?? ""
        }
    }

}

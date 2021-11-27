//
//  SecondVC.swift
//  seminar-week-7
//
//  Created by Junho Lee on 2021/11/27.
//

import UIKit

class SecondVC: UIViewController {

    static let identifier = "SecondVC"
    @IBOutlet weak var textField: UITextField!
    var recievedText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.text = recievedText
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpToSendData(_ sender: Any) {
//        // presentingVC를 이용해 이전 VC에 데이터 전달
//        let presentingVC = presentingViewController as? FirstVC
//        presentingVC?.textField.text = textField.text
//        dismiss(animated: true, completion: nil)
        
        
//        notificationCenter 이용
        NotificationCenter.default.post(name: NSNotification.Name("iOS-Sample"), object: textField.text ?? "")
        
        let presentingVC = presentingViewController as? FirstVC
        presentingVC?.textField.text = textField.text
        dismiss(animated: true, completion: nil)
    }
    
    func setDataInTextField(data: String){
        print("넘겨받은 data = \(data)")
    }

}

//
//  keywordCVC.swift
//  seminar-week-7
//
//  Created by Junho Lee on 2021/11/27.
//

import UIKit

protocol KeywordCellDelegate{
    func keywordCellSelected(cell: keywordCVC)
    func keywordCellUnselected(cell: keywordCVC, unselectedName: String)
}

class keywordCVC: UICollectionViewCell {
    static let identifier = "keywordCVC"
    @IBOutlet weak var keywordButton: UIButton!
    var keyword: String = ""
    var selectedKeyword: Bool = false
    var keywordDelegate: KeywordCellDelegate?
    var presentingClosure: (() -> ())?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    @IBAction func touchUpToSelect(_ sender: Any) {
        if selectedKeyword {
            keywordDelegate?.keywordCellUnselected(cell: self, unselectedName: keyword)
            keywordButton.backgroundColor = .clear
        }else {
            keywordDelegate?.keywordCellSelected(cell: self)
            keywordButton.backgroundColor = .yellow
            presentingClosure?()
        }
        selectedKeyword.toggle()
    }
    
    func setKeyword(text: String){
        keyword = text
        keywordButton.setTitle(keyword, for: .normal)
    }
}

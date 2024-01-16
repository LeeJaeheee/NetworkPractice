//
//  LottoViewController.swift
//  NetworkPractice
//
//  Created by 이재희 on 1/16/24.
//

import UIKit

class LottoViewController: UIViewController {

    @IBOutlet var textField: UITextField!
 
    @IBOutlet var numberLabelList: [UILabel]!
    
    let manager = LottoAPIManager()
    
    var lottoPickerView = UIPickerView()
    let numberList: [Int] = Array(1...1102).reversed()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        lottoPickerView.delegate = self
        lottoPickerView.dataSource = self
    }

    @IBAction func returnTapped(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }

}

extension LottoViewController {
    func configureUI() {
        textField.textAlignment = .center
        textField.inputView = lottoPickerView
        
        numberLabelList.forEach { label in
            label.textAlignment = .center
            label.font = .boldSystemFont(ofSize: 18)
        }
        
        selected(number: 1102)
    }
    
    func selected(number: Int) {
        textField.text = "\(number) 회차"
        manager.callRequest(number: "\(number)") { value in
            for (i, label) in self.numberLabelList.enumerated() {
                label.text = String(value[i])
            }
        }
    }
}

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        1102
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selected(number: numberList[row])
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        "\(numberList[row]) 회차"
    }
    
}

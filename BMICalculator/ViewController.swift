//
//  ViewController.swift
//  BMICalculator
//
//  Created by 은서우 on 2024/01/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var RoundedRectangle: [UIView]!
    
    @IBOutlet var resultBtn: UIButton!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UI 그리기
        setRoundedRectangle(RoundedRectangle[0])
        setRoundedRectangle(RoundedRectangle[1])
        
        resultBtn.backgroundColor = .purple
        resultBtn.layer.cornerRadius = 15
        resultBtn.setTitleColor(.white, for: .normal)
        
        // 기능
        
        // heightTextField
        heightTextField.keyboardType = .decimalPad
        
        
        weightTextField.keyboardType = .decimalPad
        
        
    }
    
    // 결과 확인 버튼 클릭
    @IBAction func tapResultBtn(_ sender: UIButton) {
        
        // 1. 컨텐츠
        let alert =  UIAlertController(
            title: "당신의 BMI 지수는",
            message: "\(calculateBMI())",
            preferredStyle: .alert)
                
        // 2. 버튼
        let btn1 = UIAlertAction(title: "확인", style: .cancel)
                
        // 3. 컨텐츠 + 버튼
        alert.addAction(btn1)
                
        // 4. 띄우기
        present(alert, animated: true)
    }
    
    @IBAction func tapTextField(_ sender: UITextField) {
        
        
        
    }
    
    // BMI 계산 함수
    func calculateBMI() -> Double{
        return 0
    }
    
    func setRoundedRectangle(_ sender: UIView){
        sender.layer.borderWidth = 2
        sender.layer.borderColor = UIColor.black.cgColor
        sender.layer.cornerRadius = 18
    }
    
    @IBAction func tapGesture(_ sender: Any) {
        view.endEditing(true)
    }
    
}


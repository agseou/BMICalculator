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
    var Height: Double? = nil
    var Weight: Double? = nil
    
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
        
        var BMI = calculateBMI()
        
        // 1. 컨텐츠
        let alert =  UIAlertController(
            title: "당신의 BMI 지수는",
            message:  String(format: "%.2f", BMI),
            preferredStyle: .alert)
        
        let alert2 =  UIAlertController(
            title: "올바른 값을 입력하세요", message: "키와 몸무게는 cm와 kg 단위입니다",
            preferredStyle: .alert)
                
        // 2. 버튼
        let btn1 = UIAlertAction(title: "확인", style: .cancel)
                
        // 3. 컨텐츠 + 버튼
        alert.addAction(btn1)
        alert2.addAction(btn1)
                
        // 4. 띄우기
        BMI == 0 ? present(alert2, animated: true) : present(alert, animated: true)
    }
    
    @IBAction func tapTextField(_ sender: UITextField) {
        guard let text = sender.text else { return }
        guard let doubleText = Double(text) else { return }
        
        print("\(sender.tag) 더블로 변환")
        print(doubleText)
        
        if sender.tag == 0 { Height = doubleText/100}
        if sender.tag == 1 { Weight = doubleText}
    }
    
    // BMI 계산 함수
    func calculateBMI() -> Double{
        guard let Weight, let Height else { return 0.0}
        return Weight / (Height * Height)
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


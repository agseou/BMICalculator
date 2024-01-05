//
//  ViewController.swift
//  BMICalculator
//
//  Created by 은서우 on 2024/01/03.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var nicknameTextField: UITextField!
    @IBOutlet var heightTextField: UITextField!
    @IBOutlet var weightTextField: UITextField!
    @IBOutlet var RoundedRectangle: [UIView]!
    
    @IBOutlet var resultBtn: UIButton!
    @IBOutlet var resetBtn: UIButton!
    
    var nickName: String? = UserDefaults.standard.string(forKey: "nickName")
    var Height: Double? = UserDefaults.standard.double(forKey: "Height")
    var Weight: Double? = UserDefaults.standard.double(forKey: "Weight")
    
    var isValid: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UI 그리기
        setRoundedRectangle(RoundedRectangle[0])
        setRoundedRectangle(RoundedRectangle[1])
        setRoundedRectangle(RoundedRectangle[2])
        
        resultBtn.backgroundColor = .purple
        resultBtn.layer.cornerRadius = 15
        resultBtn.setTitleColor(.white, for: .normal)
        
        resetBtn.backgroundColor = .black
        resetBtn.setTitleColor(.white, for: .normal)
        resetBtn.layer.cornerRadius = 10
        
        
        // 기능
        
        // heightTextField
        heightTextField.keyboardType = .decimalPad
        weightTextField.keyboardType = .decimalPad
        
        
    }
    
    // 결과 확인 버튼 클릭
    @IBAction func tapResultBtn(_ sender: UIButton) {
    
            let BMI = calculateBMI()
            if BMI < 5 || BMI > 50 { isValid = false }
            
            let alert =  UIAlertController(
                title: "\(nickName ?? "사용자")님의 BMI 지수는",
                message:  String(format: "%.2f", BMI),
                preferredStyle: .alert)
            
            let btn1 = UIAlertAction(title: "확인", style: .cancel)
            
            alert.addAction(btn1)
            
            let alert2 =  UIAlertController(
                title: "올바른 값을 입력하세요", message: "키와 몸무게는 cm와 kg 단위입니다",
                preferredStyle: .alert)
            
            
            alert2.addAction(btn1)
    
        isValid ? present(alert, animated: true): present(alert2, animated: true)
        
    }
    
    // 텍스트필드의 액션 -> 입력 작업을 종료하고...
    @IBAction func tapTextField(_ sender: UITextField) {
        if sender.tag == 0 {
            UserDefaults.standard.setValue(sender.text, forKey: "nickName")
        }
        
        guard let text = sender.text else {return}
        
        if let doubleText = Double(text) {
            print("\(sender.tag)번째 텍스트필드에 입력된 값을 더블로 변환")
            print(doubleText)
            if sender.tag == 1 {
                isValid = true
                UserDefaults.standard.setValue(doubleText/100, forKey: "Height")
            } else if sender.tag == 2 {
                isValid = true
                UserDefaults.standard.setValue(doubleText, forKey: "Weight")
            }
        }
    }
    
    // BMI 계산 함수
    func calculateBMI() -> Double{
        
        let Height: Double? = UserDefaults.standard.double(forKey: "Height")
        let Weight: Double? = UserDefaults.standard.double(forKey: "Weight")
        
        guard let Height, let Weight else { return 0.0}
        return Weight / (Height * Height)
    }
    
    // UIView RoundedRectangle 디자인하기
    func setRoundedRectangle(_ sender: UIView){
        sender.layer.borderWidth = 2
        sender.layer.borderColor = UIColor.black.cgColor
        sender.layer.cornerRadius = 18
    }
    
    // 전체 리셋
    @IBAction func tapResetBtn(_ sender: UIButton) {
        UserDefaults.standard.setValue(nil, forKey: "nickName")
        UserDefaults.standard.setValue(nil, forKey: "Height")
        UserDefaults.standard.setValue(nil, forKey: "Weight")
        
        nicknameTextField.text = nil
        heightTextField.text = nil
        weightTextField.text = nil
        
        isValid = false
    }
    
    // 키보드 내리기 탭 제스처
    @IBAction func tapGesture(_ sender: Any) {
        view.endEditing(true)
    }
    
}


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    private var isFinishingTypingNumber: Bool = true
    private var displayValue: Double {
        get{
            guard let currentDisplayValue = Double(displayLabel.text!) else {
                fatalError("Error to convert display.text to a Double")
            }
            return currentDisplayValue
        }
        set{
            displayLabel.text = String(newValue)
            
        }
    }

    private var calculator = CalculateLogic()
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        isFinishingTypingNumber = true
        calculator.setNumber(displayValue)
        if let calMethod = sender.currentTitle {
            if let result = calculator.calculate(symbol: calMethod) {
                displayValue = result
                print(displayValue)
            }
        }
    }
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        if let numValue = sender.currentTitle {
            if isFinishingTypingNumber == true {
                displayLabel.text = numValue
                isFinishingTypingNumber = false
            }else {
                if numValue == "." {
                    let isInt = floor(displayValue) == displayValue
                    if !isInt {
                        return
                    }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
        }
    }
}


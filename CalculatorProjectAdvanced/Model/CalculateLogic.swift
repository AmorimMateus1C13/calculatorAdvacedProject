import Foundation

struct CalculateLogic {
   
    private var number: Double?
    private var intermediateCalculator: (n1: Double, calcMethod: String)?
    
    mutating func setNumber (_ number: Double){
        self.number = number
    }
    
    mutating func calculate (symbol: String) -> Double? {
        if let n = number {
            switch symbol {
            case "+/-":
                return n * -1
            case "AC":
                return 0
            case "%":
                return n * 0.01
            case "=":
                return performTwoNumCalculator(n2: n)
            default:
                intermediateCalculator = (n1: n, calcMethod: symbol)
            }
        }
        return nil
    }
    
    func performTwoNumCalculator(n2: Double) -> Double? {
        if let number = intermediateCalculator?.n1,
           let signal = intermediateCalculator?.calcMethod {
            switch signal {
            case "+":
                return number + n2
            case "x":
                return number * n2
            case "÷":
                return number / n2
            case "-":
                return number - n2
            default:
                fatalError("The operation passed is does not matches any of the cases")
            }
        }
        return nil
    }
}

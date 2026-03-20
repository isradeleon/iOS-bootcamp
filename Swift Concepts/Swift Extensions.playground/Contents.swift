import UIKit

/**
 Extending an open source Swift native type class
 */
extension Double {
    func rounded(to decimalPlaces: Int) -> Double {
        let precisionNum = pow(10, Double(decimalPlaces))
        var auxNum = self
        auxNum *= precisionNum
        auxNum.round()
        auxNum /= precisionNum
        return auxNum
    }
}

let aNumber = 3.14159
print(aNumber.rounded(to: 2))

/**
 Extending a UIKit class
 */
extension UIButton {
    func adjustRadius(to corners: Int) {
        self.clipsToBounds = true
        self.layer.cornerRadius = CGFloat(corners)
    }
    
    func adjustToCircle() {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.size.width / 2
    }
}

let button = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
button.backgroundColor = .systemRed

button.adjustRadius(to: 10)
button.adjustToCircle()

/**
 Defining default protocol implementations through extensions
 */
protocol NetworkRequestsDelegate {
    func onRequestSuccess()
    func onRequestFailure(error: Error)
    func onTimeout()
}

extension NetworkRequestsDelegate {
    func onRequestFailure(error: Error) {
        print(error)
    }
    
    func onTimeout() {
        print("Timeout exception during network request...")
    }
}

class DummyClass: NetworkRequestsDelegate {
    func onRequestSuccess() {
        print("Now you're only forced to implement the success method")
    }
}

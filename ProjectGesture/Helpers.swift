import UIKit

struct Helpers {
    static func generateRandomArray(quantity: Int) -> [CGFloat] {
        var randomNumbersArray = [CGFloat]()
        for _ in 1...quantity {
            let randomNumber = CGFloat(arc4random_uniform(255))
            randomNumbersArray.append(randomNumber)
        }
        return randomNumbersArray
    }
}

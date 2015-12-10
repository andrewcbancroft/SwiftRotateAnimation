import UIKit

class ViewController3: UIViewController {
    @IBOutlet weak var refreshImage: UIImageView!

    var isRotating = false
    var shouldStopRotating = false
    
    @IBAction func startButtonTapped(sender: UIButton) {
        if self.isRotating == false {
            self.refreshImage.rotate360Degrees(completionDelegate: self)
            self.isRotating = true
        }
    }
    
    @IBAction func stopButtonTapped(sender: UIButton) {
        self.shouldStopRotating = true
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        if self.shouldStopRotating == false {
            self.refreshImage.rotate360Degrees(completionDelegate: self)
        } else {
            self.reset()
        }
    }
    
    func reset() {
        self.isRotating = false
        self.shouldStopRotating = false
    }
}
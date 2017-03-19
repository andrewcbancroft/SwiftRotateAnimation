import UIKit

class ViewController2: UIViewController, CAAnimationDelegate {
	@IBOutlet weak var refreshButton: UIButton!
	var isRotating = false
	var shouldStopRotating = false
	var timer: Timer!
	
	@IBAction func refresh() {
		if self.isRotating == false {
			self.refreshButton.rotate360Degrees(completionDelegate: self)
			// Perhaps start a process which will refresh the UI...
			self.timer = Timer(duration: 5.0, completionHandler: {
				self.shouldStopRotating = true
			})
			self.timer.start()
			self.isRotating = true
		}
	}
	
	func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
		if self.shouldStopRotating == false {
			self.refreshButton.rotate360Degrees(completionDelegate: self)
		} else {
			self.reset()
		}
	}
	
	func reset() {
		self.isRotating = false
		self.shouldStopRotating = false
	}
}


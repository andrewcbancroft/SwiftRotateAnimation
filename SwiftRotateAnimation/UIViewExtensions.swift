import UIKit

extension UIView {
	func rotate360Degrees(_ duration: CFTimeInterval = 1.0, completionDelegate: CAAnimationDelegate? = nil) {
		let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
		rotateAnimation.fromValue = 0.0
		rotateAnimation.toValue = CGFloat(M_PI * 2.0)
		rotateAnimation.duration = duration
		
		if let delegate: CAAnimationDelegate = completionDelegate {
			rotateAnimation.delegate = delegate
		}
		self.layer.add(rotateAnimation, forKey: nil)
	}
}

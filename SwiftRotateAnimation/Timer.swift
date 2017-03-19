import Foundation

class Timer {
	var timer = Foundation.Timer()
	let duration: Double
	let completionHandler: () -> ()
	fileprivate var elapsedTime: Double = 0.0
	
	init(duration: Double, completionHandler: @escaping () -> ()) {
		self.duration = duration
		self.completionHandler = completionHandler
	}
	
	func start() {
		self.timer = Foundation.Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(Timer.tick), userInfo: nil, repeats: true)
	}
	
	func stop() {
		self.timer.invalidate()
	}
	
	@objc fileprivate func tick() {
		self.elapsedTime += 1.0
		if self.elapsedTime == self.duration {
			self.stop()
			self.completionHandler()
			self.elapsedTime = 0.0
		}
	}
	
	deinit {
		self.stop()
	}
}

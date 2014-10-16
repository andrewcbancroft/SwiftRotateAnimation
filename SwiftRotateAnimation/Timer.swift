import Foundation

class Timer {
	var timer = NSTimer()
	let duration: Double
	let completionHandler: () -> ()
	private var elapsedTime: Double = 0.0
	
	init(duration: Double, completionHandler: () -> ()) {
		self.duration = duration
		self.completionHandler = completionHandler
	}
	
	func start() {
		self.timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "tick", userInfo: nil, repeats: true)
	}
	
	func stop() {
		self.timer.invalidate()
	}
	
	@objc private func tick() {
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

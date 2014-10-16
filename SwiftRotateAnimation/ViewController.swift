import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var refreshButton: UIButton!
	
	@IBAction func refresh() {
		self.refreshButton.rotate360Degrees()
		// Perhaps start a process which will refresh the UI...
	}
}


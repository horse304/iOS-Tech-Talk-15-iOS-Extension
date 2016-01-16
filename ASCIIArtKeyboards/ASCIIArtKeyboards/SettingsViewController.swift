import UIKit
import Settings

class SettingsViewController: UIViewController {
    @IBOutlet weak var enableDeleteSwitch: UISwitch!

    override func viewDidLoad() {
        super.viewDidLoad()
        enableDeleteSwitch.on = Settings.sharedInstance.enabledDelete
    }
    
    @IBAction func switchEnableDelete(sender: UISwitch) {
        Settings.sharedInstance.enabledDelete = sender.on
    }
}

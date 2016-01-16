import UIKit

public class Settings {
    public static let sharedInstance = Settings()
    private init() { }
    
    let userDefaults = NSUserDefaults(suiteName: "<#APP_GROUP_NAME#>") // Change suiteName by your APP_GROUP_NAME, see this link to create App Group: https://medium.com/ios-os-x-development/shared-user-defaults-in-ios-3f15cd2c9409#.awq7xztw9
    public var enabledDelete: Bool {
        set {
            userDefaults?.setBool(newValue, forKey: "enabledDelete")
            userDefaults?.synchronize()
        }
        get {
            if let boolValue = userDefaults?.boolForKey("enabledDelete") where userDefaults?.objectForKey("enabledDelete") != nil {
                return boolValue
            }
            return true
        }
    }
}

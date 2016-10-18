import UIKit

class ViewController: UIViewController {
    
    //MARK: View Outlets
    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var GameModeSelector: UISegmentedControl!
    @IBOutlet weak var TimerSwitch: UISwitch!
    
    //MARK: GameMode Enum
    enum GameMode: Int {
        case TWOxTWO
        case FOURxFOUR
        case SIXxSIX
    }

    
    private var gameMode:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        gameMode = GameMode.TWOxTWO.rawValue
        
    }

    
    
    //MARK: Start Button Function
    @IBAction func StartPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "GameSegue", sender: self)
    }
    
    //MARK: Game Mode Selector Function
    @IBAction func GameModeSelected(_ sender: UISegmentedControl) {
        switch GameModeSelector.selectedSegmentIndex {
        case 0:
            gameMode = GameMode.TWOxTWO.rawValue
        case 1:
            gameMode = GameMode.FOURxFOUR.rawValue
        case 2:
            gameMode = GameMode.SIXxSIX.rawValue
        default:
            gameMode = GameMode.TWOxTWO.rawValue
        }
    }
    
    //MARK: Timer Toggle Function
    @IBAction func TimerToggled(_ sender: UISwitch) {
    }
    
    
}


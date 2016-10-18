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

    
    private var selectedMode: Int = 0
    private var useTimer: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedMode = GameMode.TWOxTWO.rawValue
    }
    
    //MARK: Game Mode Selector Function
    @IBAction func GameModeSelected(_ sender: UISegmentedControl) {
        switch GameModeSelector.selectedSegmentIndex {
            case 0:
                selectedMode = GameMode.TWOxTWO.rawValue
            case 1:
                selectedMode = GameMode.FOURxFOUR.rawValue
            case 2:
                selectedMode = GameMode.SIXxSIX.rawValue
            default:
                selectedMode = GameMode.TWOxTWO.rawValue
        }
    }
    
    //MARK: Timer Toggle Function
    @IBAction func TimerToggled(_ sender: UISwitch) {
        if TimerSwitch.isOn {
            useTimer = true
        } else {
            useTimer = false
        }
    }
    
    //MARK: Start Button Function
    @IBAction func StartPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "GameSegue", sender: self)
    }
    
    //MARK: Prepare for Segue
    //by initializing model with appropriate size
    //and timer choice
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? GameController {
            let destinationModel = CardModel(delegate: self as! CardModelDelegate, mode: selectedMode, timer: useTimer)
            destinationVC.model = destinationModel
        }
    }
}


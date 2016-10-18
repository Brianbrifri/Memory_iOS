import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var StartButton: UIButton!
    @IBOutlet weak var GameModeSelector: UISegmentedControl!
    @IBOutlet weak var TimerSwitch: UISwitch!
    
    let TWOXTWO: Int = 0
    let FOURXFOUR: Int = 1
    let SIXXSIX: Int = 2
    
    private var gameMode:Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        gameMode = TWOXTWO
        
    }

    
    
    //MARK: Start Button Function
    @IBAction func StartPressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "GameSegue", sender: self)
    }
    
    //MARK: Game Mode Selector Function
    @IBAction func GameModeSelected(_ sender: UISegmentedControl) {
        switch GameModeSelector.selectedSegmentIndex {
        case 0:
            gameMode = TWOXTWO
        case 1:
            gameMode = FOURXFOUR
        case 2:
            gameMode = SIXXSIX
        default:
            gameMode = TWOXTWO
        }
    }
    
    //MARK: Timer Toggle Function
    @IBAction func TimerToggled(_ sender: UISwitch) {
    }
    
    
}



import UIKit

class GameController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,  CardModelDelegate{
    

    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    var model: CardModel?
    var gameMode: Int = 0
    var cell1: GameControllerCollectionViewCell?
    var cell2: GameControllerCollectionViewCell?
    var currentlyMatching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the datasource and delegate properties
        cardCollectionView.dataSource = self
        cardCollectionView.delegate = self
        // Set the navigation bar title
        title = "Match Time!"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.activeEmoji.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Card", for: indexPath) as? GameControllerCollectionViewCell else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "Card", for: indexPath)
        }
        
        cell.frontView.emojiLabel.text = model?.activeEmoji[indexPath.item]
        print("Card emoji: \(cell.frontView.emojiLabel.text)!")
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? GameControllerCollectionViewCell else {
            return
        }
        
        if !(cell.CardView.frontIsShowing) && !currentlyMatching {
            cell.flip()
            if (model?.needsMatching)! {
                cell2 = cell
                currentlyMatching = true
            }
            else {
                cell1 = cell
            }
            model?.updateGameState(with: cell.frontView.emojiLabel.text!)
        }
    }
    

    //protocol conforming method to flip calls back inside the delay function
    func flipCardsBack() {
        delay(1.5, closure: {
            self.cell1?.flip()
            self.cell2?.flip()
            self.currentlyMatching = false
        })
    }
    
    func cardsMatched() {
        delay(1.5, closure: {
            self.cell1?.removeFromSuperview()
            self.cell2?.removeFromSuperview()
            self.currentlyMatching = false
            if (self.model?.wonGame)! {
                self.wonGame()
            }
        })
    }
    
    func wonGame() {
        let alert = UIAlertController(title: "Winner!", message: "Process of elimination...Elementary my dear David. Play Again?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: { action in  }))
        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    //Delay function to flip card back
    func delay(_ delay:Double, closure:@escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
 
    
    //Dirty hack just to get all cells on screen for now
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenSize: CGRect = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        let cellWidth: CGFloat
        let cellHeight: CGFloat
        
        switch gameMode{
            case 2:
                cellWidth = screenWidth/3
                cellHeight = screenHeight/3
            case 8:
                cellWidth = screenWidth/5
                cellHeight = screenHeight/5
            case 18:
                cellWidth = screenWidth/8
                cellHeight = screenHeight/8
            default:
                cellWidth = screenWidth/5
                cellHeight = screenHeight/5
            }
        
        return CGSize(width: cellWidth,height: cellHeight)
    }
    
    //Protocol function to set gameMode
    func setGameMode(with mode: Int) {
        gameMode = mode
    }

}

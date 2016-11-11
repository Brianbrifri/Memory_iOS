
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
        delay(1, closure: {
            self.cell1?.flip()
            self.cell2?.flip()
            self.currentlyMatching = false
        })
    }
    
    func cardsMatched() {
        delay(1.5, closure: {
            self.cell1?.removeFromSuperview()
            self.cell2?.removeFromSuperview()
            self.cell1?.flip()
            self.cell2?.flip()
            self.currentlyMatching = false
            if (self.model?.wonGame)! {
                self.wonGame()
            }
        })
    }
    
    func wonGame() {
        alert(message: "Process of elimination...Elementary my dear David. Play Again?", title: "Winner!!")
        reset()
    }
    
    func reset() {
        model?.reset()
        var iter = 0
        for cell in cardCollectionView.visibleCells as! [GameControllerCollectionViewCell] {
            cell.frontView.emojiLabel.text = model?.activeEmoji[iter]
            iter += 1
        }
        cardCollectionView.reloadData()
    }
    
    //Generic delay function to delay anything
    func delay(_ delay:Double, closure:@escaping ()->()) {
        let when = DispatchTime.now() + delay
        DispatchQueue.main.asyncAfter(deadline: when, execute: closure)
    }
 
    
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
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
    }
    
    //Protocol function to set gameMode
    func setGameMode(with mode: Int) {
        gameMode = mode
    }



}

extension UIViewController {
    
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "Suuure", style: .default, handler: nil)
        alertController.addAction(OKAction)
        let CancelAction = UIAlertAction(title: "Nope", style: .cancel, handler: {(action: UIAlertAction!) in
            let _ = self.navigationController?.popViewController(animated: true)
        })
        alertController.addAction(CancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
}

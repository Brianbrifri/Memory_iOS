
import UIKit

class GameController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,  CardModelDelegate{
    

    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    var model: CardModel?
    var gameMode: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the datasource and delegate properties
        cardCollectionView.dataSource = self
        cardCollectionView.delegate = self
        // Set the navigation bar title
        title = "Match Time!"
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.cardCollection.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Card", for: indexPath) as? GameControllerCollectionViewCell else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "Card", for: indexPath)
        }
        
////       I can do one of two things to get the views to appear
////       1. I can add the sub views to the CardView here and have the
////       CardView parse them by tag and then set its view variables
////       to those views I added then try to flip on those.
////       2. I can have the Card add its own subviews on draw instead of here
////       then just return the cell that has view of CardView which will add the subviews
////       on its own
       
        cell.setUpViews()
        //cell.CardView = model?.cardCollection[indexPath.item]
        cell.frontView.emojiLabel.text = model?.activeEmoji[indexPath.item]
        print("Card emoji: \(cell.frontView.emojiLabel.text)!")
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Card", for: indexPath) as! GameControllerCollectionViewCell
//        let cell = model?.cardCollection[indexPath.item]
        //cell.setUpViews()
        
        UIView.transition(with: cell.contentView, duration: 1, options: .transitionFlipFromLeft, animations: {
            cell.frontView.isHidden = cell.frontShowing
            cell.backView.isHidden = !cell.frontShowing
            cell.frontShowing = !cell.frontShowing
        }, completion: nil)
        //cell.flip()
//        if !(cell.CardView.frontIsShowing) {
//            cell.CardView.flip()
//            model?.updateGameState(with: cell.CardView)
//        }
    }
    

    //protocol conforming method to flip calls back inside the delay function
    func flipCardsBack(card1: Card, card2: Card) {
        delay(1.5, closure: {
//            card1.flip()
//            card2.flip()
        })
    }
    
    func cardsMatched(card1: Card, card2: Card) {
        card1.removeFromSuperview()
        card2.removeFromSuperview()
    }
    
    func wonGame() {
        let alert = UIAlertController(title: "Winner!", message: "Process of elimination...Elementary my dear David. Play Again?", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: { action in self.navigationController?.popViewController(animated: true) }))
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

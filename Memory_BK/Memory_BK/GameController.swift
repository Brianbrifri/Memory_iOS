
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
//        self.view.addSubview(cardCollectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.cardCollection.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Card", for: indexPath) as? GameControllerCollectionViewCell else {
            return collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        }
        
        let cardBackView = CardBackView(frame: cell.contentView.frame)
        let cardFrontView = CardFrontView(frame: cell.contentView.frame)
        
        cardBackView.tag = 100
        cardFrontView.tag = 200
        
        cell.CardView.addSubview(cardFrontView)
        cell.CardView.addSubview(cardBackView)
        
//        cell.CardView = model?.cardCollection[indexPath.item]
//        cell.CardView.frame = cell.contentView.frame
//        print(cell.CardView.getID())
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Card", for: indexPath) as? GameControllerCollectionViewCell else {
            return
        }
//        cell.flip()
        UIView.transition(with: cell.CardView, duration: 0.5, options: .transitionFlipFromLeft, animations: {
            cell.cardFrontView.isHidden = cell.isFaceUp
            cell.cardBackView.isHidden = !cell.isFaceUp
            cell.isFaceUp = !cell.isFaceUp
            print("front view: \(cell.cardFrontView.isHidden)")
            print("back view: \(cell.cardBackView.isHidden)")
            print("isFaceUp: \(cell.isFaceUp)")
        }, completion: nil)
        print(cell)
//        model?.updateGameState(with: indexPath.item)
    }
    

    func flipCardsBack(card1: GameControllerCollectionViewCell, card2: GameControllerCollectionViewCell) {
        card1.flip()
        card2.flip()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Card", for: indexPath) as! GameControllerCollectionViewCell
        cell.CardView = model?.cardCollection[indexPath.item]

//        cell.CardView.frame = cell.contentView.frame
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

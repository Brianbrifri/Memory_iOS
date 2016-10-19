
import UIKit

class GameController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout,  CardModelDelegate{
    

    @IBOutlet weak var cardCollectionView: UICollectionView!
    
    var model: CardModel?
    
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Card", for: indexPath) as! GameControllerCollectionViewCell
        cell.CardView = model?.cardCollection[indexPath.row]
        return cell
    }
}

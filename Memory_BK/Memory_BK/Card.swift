import UIKit

class Card: UIView {
    
    var ID: Int = -1
    
    var frontIsShowing: Bool = false
    var notMatched: Bool = true
    private let BACKTAG = 100
    private let FRONTTAG = 200
    var frontView = CardFrontView(frame: CGRect.zero)
    var backView = CardBackView(frame: CGRect.zero)
    
    override func draw(_ rect: CGRect) {
        addSubview(frontView)
        addSubview(backView)
    }
    
    override func layoutSubviews() {
        backgroundColor = UIColor.darkGray
        super.layoutSubviews()

    }
    
    //MARK: Adds the subview then calls setupView
    override func addSubview(_ view: UIView) {
        super.addSubview(view)
        setupView(with: view)

        //MARK: Setup frontView and backView vars based on tags of subviews added
//        switch view.tag {
//        case BACKTAG:
//            backView = view as! CardBackView
//            backView.backgroundColor = UIColor.darkGray
//            print("Found view with BACKTAG")
//        case FRONTTAG:
//            frontView = view as! CardFrontView
//            frontView.backgroundColor = UIColor.red
//            print("Found view with FRONTTAG")
//        default:
//            print("Added view with incorrect tag")
//        }
    }
    
    //MARK: Sets the subview constraints to itself
    private func setupView(with view: UIView) {
        subviews.forEach { (subView) in
            subView.translatesAutoresizingMaskIntoConstraints = false
            subView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            subView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            subView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            subView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        }
    }
    
    //MARK: Getter and setter for ID
    func setID(ID: Int) {
        self.ID = ID
    }
    
    func getID() -> Int {
        return ID
    }

    //MARK: Flip function
    //Duration: 1 second, changes which side it flips from, animates the views showing and hiding
    func flip() {
        UIView.transition(with: self, duration: 1, options: frontIsShowing ? .transitionFlipFromLeft : .transitionFlipFromRight, animations: {
            //flip views
            self.frontView.isHidden = !self.frontIsShowing
            self.backView.isHidden = self.frontIsShowing
            self.frontIsShowing = !self.frontIsShowing
            print(" ")
            print("frontView showing: \(self.frontView.isHidden)")
            print("backView showing: \(self.backView.isHidden)")

            }) { (true) in
            //more stuff
//            print("On Completion")
        
        }
    }
}

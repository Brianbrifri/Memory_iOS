import UIKit

class Card: UIView {
    
    private var ID: Int = -1
    
    var isShowing: Bool = false
    var isMatched: Bool = false
    
    override func layoutSubviews() {
        backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1.0)
        super.layoutSubviews()
    }
    
    override func addSubview(_ view: UIView) {
        super.addSubview(view)
        setupView(with: view)
    }
    
    private func setupView(with view: UIView) {
        subviews.forEach { (subView) in
            subView.translatesAutoresizingMaskIntoConstraints = false
            subView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
            subView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            subView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
            subView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        }
    }
    
    func setID(ID: Int) {
        self.ID = ID
    }
    
    func getID() -> Int {
        return ID
    }

}

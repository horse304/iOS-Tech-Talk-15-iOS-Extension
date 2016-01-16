import UIKit

class ASCIICell: UICollectionViewCell {
    var item: ASCIIItem? {
        didSet {
            textLabel.text = item?.text
        }
    }
    var textLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel.frame = bounds
    }
    
    func setupView() {
        backgroundColor = UIColor.whiteColor()
        textLabel = UILabel()
        self.addSubview(textLabel)
    }
}


import UIKit
import Kingfisher

class PokedexCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imagePoke: UIImageView!
    @IBOutlet weak var titlePoke: UILabel!
    
    func setupName(poke: Results, index: Int) {
        titlePoke.text = poke.name.capitalized
        imagePoke.kf.setImage(with: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(index+1).png"), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
        imagePoke.clipsToBounds = true
        imagePoke.layer.cornerRadius = imagePoke.frame.height / 5
        imagePoke.kf.indicatorType = .activity
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

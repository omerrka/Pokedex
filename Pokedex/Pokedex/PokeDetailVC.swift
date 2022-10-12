
import UIKit

class PokeDetailVC: UIViewController {
    
    var pokeName: String = ""
    var pokeType: String = ""
    var pokeAttack: Int = 0
    var pokeDefence: Int = 0
    var pokeSpeed: Int = 0
    var pokeImage: String = ""
    

    @IBOutlet weak var image: UIImageView!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.kf.indicatorType = .activity
        image.kf.setImage(with: URL(string: "\(pokeImage)"), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
        
    }
    

   

}

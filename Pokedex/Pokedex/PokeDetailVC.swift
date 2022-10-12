
import UIKit

class PokeDetailVC: UIViewController {
    
    var pokeName: String = ""
    var pokeType: String = ""
    var pokeAttack: Int = 0
    var pokeDefence: Int = 0
    var pokeSpeed: Int = 0
    var pokeImage: String = ""
    var pokeHealth: Int = 0
    var pokeSpa: Int = 0
    var pokeSpd: Int = 0
    

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var attack: UILabel!
    @IBOutlet weak var defence: UILabel!
    @IBOutlet weak var health: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var spa: UILabel!
    @IBOutlet weak var spd: UILabel!
    
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        attack.text = String(pokeAttack)
        defence.text = String(pokeDefence)
        speed.text = String(pokeSpeed)
        spa.text = String(pokeSpa)
        spd.text = String(pokeSpd)
        health.text = String(pokeHealth)
        image.kf.indicatorType = .activity
        image.kf.setImage(with: URL(string: "\(pokeImage)"), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
        
    }
    

   

}

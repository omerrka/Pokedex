
import UIKit


class PokeDetailVC: UIViewController, DetailViewModelDelegate {
    
    func callTypeLaunched() {
        DispatchQueue.main.async {
            
            self.type.text = "Type: \(self.pokeDetailViewModel.pokeTypeData.capitalized)"
            self.type.halfTextColorChange(fullText: self.type.text!, changeText: "Type:")
        }
    }
    
    func callLaunched() {
        
        DispatchQueue.main.async {
            self.health.text = String("Health: \(self.pokeDetailViewModel.pokeDetailData[0].base_stat)")
            self.health.halfTextColorChange(fullText: self.health.text!, changeText: "Health:")
            self.attack.text = String("Attack: \(self.pokeDetailViewModel.pokeDetailData[1].base_stat)")
            self.attack.halfTextColorChange(fullText: self.attack.text!, changeText: "Attack:")
            self.spa.text = String("Spa: \(self.pokeDetailViewModel.pokeDetailData[3].base_stat)")
            self.spa.halfTextColorChange(fullText: self.spa.text!, changeText: "Spa:")
            self.speed.text = String("Speed: \(self.pokeDetailViewModel.pokeDetailData[5].base_stat)")
            self.speed.halfTextColorChange(fullText: self.speed.text!, changeText: "Speed:")
            self.type.text = "Type: \(self.pokeDetailViewModel.pokeTypeData.capitalized)"
            self.type.halfTextColorChange(fullText: self.type.text!, changeText: "Type:")
            self.defence.text = String("Defence: \(self.pokeDetailViewModel.pokeDetailData[2].base_stat)")
            self.defence.halfTextColorChange(fullText: self.defence.text!, changeText: "Defence:")
            self.spd.text = String("Spd: \(self.pokeDetailViewModel.pokeDetailData[4].base_stat)")
            self.spd.halfTextColorChange(fullText: self.spd.text!, changeText: "Spd:")

        }
    }
    
    
    let pokeDetailViewModel: PokeDetailViewModel = PokeDetailViewModel()
    
    var pokeUrl: String = ""
    var pokeName: String = ""
    var pokeType: String = ""
    var pokeAttack: Int = 0
    var pokeDefence: Int = 0
    var pokeSpeed: Int = 0
    var pokeImage: String = ""
    var pokeHealth: Int = 0
    var pokeSpa: Int = 0
    var pokeSpd: Int = 0
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var health: UILabel!
    @IBOutlet weak var attack: UILabel!
    @IBOutlet weak var spa: UILabel!
    @IBOutlet weak var speed: UILabel!
    @IBOutlet weak var type: UILabel!
    @IBOutlet weak var defence: UILabel!
    @IBOutlet weak var spd: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokeDetailViewModel.detailDelegate = self
        self.pokeDetailViewModel.fetchDetailData(point: pokeUrl)
        self.pokeDetailViewModel.fetchTypeData(point: pokeUrl)
        image.kf.indicatorType = .activity
        image.kf.setImage(with: URL(string: "\(pokeImage)"), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
    }
}

extension UILabel {
    func halfTextColorChange (fullText : String , changeText : String ) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString.init(string: fullText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red , range: range)
        self.attributedText = attribute
    }
}









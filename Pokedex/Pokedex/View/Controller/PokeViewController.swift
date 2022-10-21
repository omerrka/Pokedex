
import UIKit

class ViewController: UIViewController, UICollectionViewDelegate {
    
    let pokedexViewModel: PokedexViewModel = PokedexViewModel()
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        pokedexViewModel.delegate = self
        pokedexViewModel.fetchData()
        
    }
    
    
    private func setupViews() {
        
        navigationController?.navigationBar.barTintColor = UIColor.red
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .red
        navigationController?.navigationBar.standardAppearance = appearance;
        navigationController?.navigationBar.scrollEdgeAppearance = navigationController?.navigationBar.standardAppearance
        
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        let width = (self.view.frame.size.width - 20) / 3
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.itemSize = CGSize(width: width, height: width)
        let nibCell = UINib(nibName: "PokedexCollectionViewCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "PokedexCollectionViewCell")
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc1 = storyboard?.instantiateViewController(withIdentifier: "PokeDetailVC") as? PokeDetailVC
        vc1?.pokeName = pokedexViewModel.pokeData[indexPath.row].name
        vc1?.pokeImage = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(indexPath.row + 1).png"
        vc1?.pokeUrl = pokedexViewModel.pokeData[indexPath.row].url
        self.navigationController?.pushViewController(vc1!, animated: true)
        
    }
}

extension ViewController: UICollectionViewDataSource, PokeViewModelDelegate {
    
    func callFinished() {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokedexViewModel.pokeData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokedexCollectionViewCell", for: indexPath) as! PokedexCollectionViewCell
        cell.setupName(poke: pokedexViewModel.pokeData[indexPath.row], index: indexPath.row)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if contentHeight > 0 {
            if offsetY > contentHeight - scrollView.frame.height {
                if !pokedexViewModel.fetchingMore {
                    pokedexViewModel.fetchData()
                    if !pokedexViewModel.fetchingMore {
                        pokedexViewModel.fetchData()
                        
                    }
                }
            }
        }
    }
}

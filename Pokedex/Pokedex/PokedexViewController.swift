
import UIKit
import Kingfisher

class ViewController: UIViewController {
    
    var pokeManager = PokeManager()
    var pokeData = [MyResult]()
    var page = 0
    var fetchingMore = false
    var pokeDetailData: YourResult?
    var i = 1
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.collectionViewLayout = UICollectionViewFlowLayout()
        
        pokeManager.getData(offset: page) {
            data in
            self.pokeData = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
        
        pokeManager.getDataDetail(urlString: "https://pokeapi.co/api/v2/pokemon/1/" ) {
            data in
            self.pokeDetailData = data
            DispatchQueue.main.async {
                self.collectionView.reloadData()

            }
        }
        
        let nibCell = UINib(nibName: "PokedexCollectionViewCell", bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: "PokedexCollectionViewCell")
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pokeData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PokedexCollectionViewCell", for: indexPath) as! PokedexCollectionViewCell
        cell.titlePoke.text = pokeData[indexPath.row].name
        cell.imagePoke.clipsToBounds = true
        cell.imagePoke.kf.indicatorType = .activity
        cell.imagePoke.kf.setImage(with: URL(string: "\(pokeDetailData?.front_default ?? "")"), placeholder: nil, options: [.transition(.fade(0.7))], progressBlock: nil)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if contentHeight > 0 {
            if offsetY > contentHeight - scrollView.frame.height {
                if !fetchingMore {
                    beginBatchFetch()
                    
                }
            }
        }
    }
    func beginBatchFetch() {
        fetchingMore = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5 , execute: {
            self.page += 20
            self.pokeManager.getData(offset: self.page) {
                data in
                self.pokeData.append(contentsOf: data)
                self.fetchingMore = false
            }
            self.collectionView.reloadData()

        })
    }
}




extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 190, height: 250)
    }
}


//
//  ViewController.swift
//  HomeWorkLesson10Url
//
//  Created by vladimir gennadievich on 12.10.2020.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    @IBOutlet var collectionViewOulet: UICollectionView!
    @IBOutlet var backgraundImageCsk: UIImageView!
    @IBOutlet var cellForCollectionViewOutlet: UICollectionView!
    
    private var teamPlayers:[InfoAboutTeamPlayrs] = []
    private let adressJsonTeam = "https://khl.api.webcaster.pro/api/khl_mobile/players_v2_light.json"

    
        override func viewDidLoad() {
        super.viewDidLoad()
            
        loadFullPlayersInfoFromJson()
        backgraundImageCsk.image = UIImage.init(named: "ее")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        teamPlayers.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width:view.frame.width/3, height: 130)
    }
    
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            
        let celll = cellForCollectionViewOutlet.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCellTOColletionView
        
            celll.imageLableCell.image = insertPhotoInCallectionView(item: teamPlayers[indexPath.item].image)
        return celll
    }
    
    func loadFullPlayersInfoFromJson () {
        guard let url = URL(string: adressJsonTeam) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            
            do {
                self.teamPlayers = try JSONDecoder().decode([InfoAboutTeamPlayrs].self, from: data)
                
                DispatchQueue.main.async {
                self.collectionViewOulet.reloadData()
                }
                
            } catch let error {
                print("Error: ", error)
            }
            }.resume()
    }

    func insertPhotoInCallectionView(item adreess: String?) -> UIImage {
        var photoImage = UIImage()

            if let image = adreess  {
                if  let imageUrl = URL(string: image) {
                    let imageData = try? Data(contentsOf: imageUrl)
                    photoImage = UIImage(data: imageData!)!
                }
    }
        return photoImage
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "ToAllInfoAboutPlayer" else {return}
        
        let senderCell = sender as! CustomCellTOColletionView
        
        if let indexPath = collectionViewOulet.indexPath(for: senderCell) {
           let allInfoVC = segue.destination as? AllInfoPlayerInfoViewController
            allInfoVC!.nameSername = teamPlayers[indexPath.item].name
            allInfoVC?.shirtNumberText = teamPlayers[indexPath.item].shirt_number
            allInfoVC?.teamLabelText = teamPlayers[indexPath.item].team?.name
            allInfoVC?.imagePlayer = insertPhotoInCallectionView(item: teamPlayers[indexPath.item].image)
        
        }
        
    }
}
        
        




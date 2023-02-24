//
//  AlbumsViewController.swift
//  lab-tunley
//
//  Created by Tristan Williams on 2/23/23.
//

import UIKit
import Nuke

class AlbumsViewController: UIViewController, UICollectionViewDataSource {
    
    var albums: [Album] = []
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self

        // Do any additional setup after loading the view.
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed&page2")!
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let error = error {
                print("Network error: \(error.localizedDescription)")
            }
            guard let data = data else {
                print("Data is nil")
                return
            }
            let decoder = JSONDecoder()
            do {
                //guard let jsonDictionary = try JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                //    print("Could not cast data to dictionary")
                //    return
                //}
                //print(jsonDictionary)
                let response = try decoder.decode(AlbumSearchResponse.self, from: data)
                let albums = response.results
                DispatchQueue.main.async {
                    self?.albums = albums
                    self?.collectionView.reloadData()
                }
                
                print(albums)
            } catch {
                //print("Error parsing JSON: \(error.localizedDescription)")
                print(error.localizedDescription)
            }
        }
        task.resume()
        
        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumInteritemSpacing = 4
        layout.minimumLineSpacing = 4
        let numberOfColumns: CGFloat = 3
        let width = (collectionView.bounds.width - layout.minimumInteritemSpacing * (numberOfColumns - 1)) / numberOfColumns
        layout.itemSize = CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AlbumCell", for: indexPath) as! AlbumCell
        let album = albums[indexPath.item]
        let imageUrl = album.poster_path
        Nuke.loadImage(with: URL(string: "https://image.tmdb.org/t/p/w200" + imageUrl)!, into: cell.albumImageView)
        return cell
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

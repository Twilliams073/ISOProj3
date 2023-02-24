//
//  ViewController.swift
//  lab-tunley
//
//  Created by Charlie Hieger on 12/1/22.
//

import UIKit

class TracksViewController: UIViewController, UITableViewDataSource {
    
    
    // TODO: Pt 1 - Add a tracks property
    var tracks: [Track] = []

    // TODO: Pt 1 - Add table view outlet
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        tableView.dataSource = self
        // TODO: Pt 1 - Set tracks property with mock tracks array
        //tracks = Track.mockTracks
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            if let error = error {
                print("Network error: \(error.localizedDescription)")
            }
            guard let data = data else {
                print("Data is nil")
                return
            }
            do {
                //let jsonDictionary = try JSONSerialization.jsonObject(with: data) as? [String: Any]
                //print(jsonDictionary)
                let decoder = JSONDecoder()
                let response = try decoder.decode(TracksResponse.self, from: data)
                let tracks = response.results
                DispatchQueue.main.async{
                    self?.tracks = tracks
                    self?.tableView.reloadData()
                }
                print("check \(tracks)")
            } catch {
                print("Error parsing JSON: \(error)")
            }
        }
        task.resume()
        
        print(tracks)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracks.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackCell", for: indexPath) as! TrackCell
        let track = tracks[indexPath.row]
        cell.configure(with: track)
        return cell
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // TODO: Pt 1 - Pass the selected track to the detail view controller
        if let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell),
           let detailViewController = segue.destination as? DetailViewController {
            let track = tracks[indexPath.row]
            detailViewController.track = track
        }

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let indexPath = tableView.indexPathForSelectedRow {
            tableView.deselectRow(at:indexPath, animated: true)
        }
    }

    // TODO: Pt 1 - Add table view data source methods


}

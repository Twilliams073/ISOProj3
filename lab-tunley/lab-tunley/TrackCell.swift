//
//  TrackCell.swift
//  lab-tunley
//
//  Created by Tristan Williams on 2/16/23.
//

import UIKit
import Nuke

class TrackCell: UITableViewCell {
    
    @IBOutlet weak var trackMovTitle: UILabel!
    @IBOutlet weak var trackMovDesc: UILabel!
    @IBOutlet weak var trackImageView: UIImageView!
    
    
    func configure(with track: Track){
        trackMovTitle.text = track.original_title
        trackMovDesc.text = track.overview
        Nuke.loadImage(with: URL(string: "https://image.tmdb.org/t/p/w200" + track.poster_path)!, into: trackImageView)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
    }

}

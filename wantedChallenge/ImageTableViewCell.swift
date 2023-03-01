//
//  ImageTableViewCell.swift
//  wantedChallenge
//
//  Created by sehooon on 2023/02/28.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    var imageUrlString: String = ""
    static let identifier: String  = "imageTableViewCell"
    @IBOutlet weak var cellImageView: UIImageView!
    @IBOutlet weak var progressbar: UIProgressView!
    @IBOutlet weak var loadButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
    @IBAction func loadButtonTapped(_ sender: UIButton) {
        guard let url = URL(string: imageUrlString) else { return }
        Task{
            self.cellImageView.image = UIImage(systemName: "photo")
            let (imageData, _) = try await URLSession.shared.data(from:url)
            self.cellImageView.image = UIImage(data: imageData)
        }
    }
}

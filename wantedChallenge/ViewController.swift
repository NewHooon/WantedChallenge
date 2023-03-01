//
//  ViewController.swift
//  wantedChallenge
//
//  Created by sehooon on 2023/02/28.
//

import UIKit

class ViewController: UIViewController {

    
    private var imageUrl:[String] = [
        "https://picsum.photos/200/300",
        "https://picsum.photos/200/300",
        "https://picsum.photos/200/300",
        "https://picsum.photos/200/300",
        "https://picsum.photos/200/300"
    ]
//    private var imageTableView = UITableView()
    
    
    @IBOutlet weak var imageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageTableView.delegate = self
        imageTableView.dataSource = self

    }
    
    
    @IBAction func loadAllImageButton(_ sender: UIButton) {
        for idx in imageTableView.indexPathsForVisibleRows!{
            let cell = imageTableView.cellForRow(at: idx) as! ImageTableViewCell
            cell.cellImageView.image = UIImage(systemName: "photo")
            Task{
                guard let url = URL(string: imageUrl[idx.row]) else { return }
                let (imageData,_) = try await URLSession.shared.data(from: url)
                cell.cellImageView.image = UIImage(data: imageData)
            }
            
        }
    }

}
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageUrl.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = imageTableView.dequeueReusableCell(withIdentifier: ImageTableViewCell.identifier, for: indexPath) as! ImageTableViewCell
        cell.imageUrlString = imageUrl[indexPath.row]
        cell.cellImageView.image = UIImage(systemName: "photo")
    
        return cell
    }
    
    
}


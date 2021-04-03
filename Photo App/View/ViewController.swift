//
//  ViewController.swift
//  Photo App
//
//  Created by IMRAN on 03/04/21.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var images: [String] = []
    let photosViewModel = PhotosViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        updateUI()
    }
    
    @objc func updateUI(){
        photosViewModel.getImages { [weak self] (images) in
                if let self = self {
                    self.images = images
                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        if let downloadURL = URL(string: images[indexPath.item]), let data = try? Data(contentsOf: downloadURL){
            cell.photo.image = UIImage(data: data)
            return cell
        }else{
            cell.photo.image = UIImage(named: "default_image")
            return cell
        }
        
    }
    
}


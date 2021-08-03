//
//  DetailViewController.swift
//  Projects-1-to-3
//
//  Created by Pipe Carrasco on 03-08-21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet var imageFlag: UIImageView!
    var flagSelected: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        title = flagSelected
        
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareFlag))
        if let imageToLoad = flagSelected {
            imageFlag.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareFlag(){
        guard let image = imageFlag.image?.pngData() else {
            print("No image found")
                    return
            }
        let vc = UIActivityViewController(activityItems: [image, flagSelected ?? "image"], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
}

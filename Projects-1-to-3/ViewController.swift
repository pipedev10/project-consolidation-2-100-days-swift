//
//  ViewController.swift
//  Projects-1-to-3
//
//  Created by Pipe Carrasco on 03-08-21.
//

import UIKit

class ViewController: UITableViewController {
    
    var flags = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Flags"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            
            if item.hasSuffix(".png") {
                flags.append(item)
                
            }
        }
        print(flags)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flag", for: indexPath)
        cell.textLabel?.text = flags[indexPath.row]
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let detailVC = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            detailVC.flagSelected = flags[indexPath.row]
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}


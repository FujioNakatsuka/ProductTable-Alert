//
//  ViewController.swift
//  ProductTable-Alert
//
//  Created by 中塚富士雄 on 2020/05/20.
//  Copyright © 2020 中塚富士雄. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
 

    @IBOutlet weak var tableView: UITableView!
    
    var imageArray = ["I","L","T"]
    var textArray = ["インスタ","リンクト","ツイッタ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
       
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel!.text = textArray[indexPath.row]
        cell.imageView!.image = UIImage(named: "\(imageArray[indexPath.row])")
        
        return cell
        
     }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 245
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showAlert()
    }
    
    func showAlert(){
        
        let alert = UIAlertController(title: "アラート表示", message: "画面遷移はできません", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
        alert.addAction(okAction)
        
        present(alert,animated: true,completion: nil)
        
    }
    
}


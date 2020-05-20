//
//  ViewController.swift
//  ProductTable-Alert
//
//  Created by 中塚富士雄 on 2020/05/20.
//  Copyright © 2020 中塚富士雄. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
 //ViewControllerでTableViewを使えるようにするためにDelegate(TableViewが持つ性質)、DataSource（TableViewに入れるDataの源）を使う
    
    @IBOutlet weak var tableView: UITableView!
    
    var imageArray = ["I","L","T"]
    var textArray = ["インスタ","リンクト","ツイッタ"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        // selfはViewController →　正しい？
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        //Section数を返す。Section：Combines elements and acts as a single element.An affordance for creating hierarchical view content.
    }
       
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imageArray.count
        //一つのSection内のCell数を返す：Returns the number of rows (table cells) in a specified section.　→　複数のSectionを使う場合の記法は？
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Returns the table cell at the specified index path.IndexPath：A list of indexes that together represent the path to a specific location in a tree of nested arrays.　→ Arrayの中にindexがない場合は？
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //Returns a reusable table-view cell object for the specified reuse identifier and adds it to the table. → ここでreuseするのは"Cell"という理解で良い？
        
        
        cell.textLabel!.text = textArray[indexPath.row]
        cell.imageView!.image = UIImage(named: "\(imageArray[indexPath.row])")
        //　→ 変数の宣言ではないが”！”がつく。オプショナル型ではないとすれば、これは何か？
        
        
        return cell
        //textとimageを持ったcellを返す
        
     }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 245
        //tableView内に表示するCellの高さCGFloatの値として返す
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        showAlert()
        //Cellを触ったということを感知する："didSelect"　Notifies the preference pane that the main app has just displayed the preference pane’s main view.rowAtIndex:Returns the grid row object at the specified index.
        //　→ このshowAlert()は次のfuncで定義するが、ここでの性格は何か？
    }
    
    func showAlert(){
        
        let alert = UIAlertController(title: "アラート表示", message: "画面遷移はできません", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            
        alert.addAction(okAction)
        
        present(alert,animated: true,completion: nil)
        //alertを出したらokActionを出す。　→ このpresentは：Presents the drawable onscreen as soon as possible.で良いのか？　　ここでのcompletion: nil　は？
    }
    
}


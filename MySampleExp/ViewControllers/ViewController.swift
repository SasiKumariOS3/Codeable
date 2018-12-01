//
//  ViewController.swift
//  MySampleExp
//
//  Created by sasi on 20/11/18.
//  Copyright © 2018 InfoWave. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tbl_vw: UITableView!
    @IBOutlet weak var coll_vw: UICollectionView!
    
    var tblmodel = TableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tbl_vw.isHidden = false
        coll_vw.isHidden = true
        tblmodel.fetchResponse(strurl: "https://itunes.apple.com/search?term=uyire") {
            self.tbl_vw.reloadData()
            self.coll_vw.reloadData()
        }
    }
    
    @IBAction func btnAction_Grid(_ sender: UIBarButtonItem) {
        
        if tbl_vw.isHidden == true {
            tbl_vw.isHidden = false
            coll_vw.isHidden = true
        }else{
            tbl_vw.isHidden = true
            coll_vw.isHidden = false
        }
    }
    
}
//MARK : UITableviewDelegates & DataSource
extension ViewController : UITableViewDelegate,UITableViewDataSource
    
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tblmodel.numberOfItemsToDisplay(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell : CustomeTableCell? = tableView.dequeueReusableCell(withIdentifier: "Cell") as? CustomeTableCell
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "Cell") as? CustomeTableCell
        }
        cell?.img_vw.contentMode = .scaleAspectFit
        cell?.img_vw?.imageFromServerURL(tblmodel.appimageToDisplay(for: indexPath), placeHolder: UIImage.init(named: ""))
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 150
    }
    
}
//MARK : UICollectionDelegates & DataSource
extension ViewController : UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tblmodel.numberOfItemsToDisplay(in: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath as IndexPath) as! CustomeCollectionCell
        cell.img_vw?.imageFromServerURL(tblmodel.appimageToDisplay(for: indexPath), placeHolder: UIImage.init(named: ""))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You selected cell #\(indexPath.item)!")
    }
    
    
}

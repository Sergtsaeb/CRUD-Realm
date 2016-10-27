//
//  ViewController.swift
//  CRUD Realm
//
//  Created by Sergelenbaatar Tsogtbaatar on 10/3/16.
//  Copyright © 2016 Sergts. All rights reserved.
//

import UIKit
import RealmSwift
import Realm

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBAction func didClickOnEditButton(_ sender: UIBarButtonItem) {
        
    }
    
    @IBOutlet weak var tableview: UITableView!
    
    var datasource: Results<BookItem>!
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadTable()
    }
    
    @IBAction func goToBookEntryVC(_ sender: AnyObject) {
        performSegue(withIdentifier: "BookEntryVC", sender: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        reloadTable()
        
    }
    
    func reloadTable() {
        do
        {
            let realm = try Realm()
            datasource = realm.objects(BookItem.self)
            tableview?.reloadData()
        }
        catch
        {
            
        }
    }

    func setupUI() {
        tableview.delegate = self
        tableview.dataSource = self
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  datasource.count
    }
    
    
    
    
   
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier: String = "myCell"
        var cell = tableview.dequeueReusableCell(withIdentifier: identifier)
        
        if cell == nil {
            cell = UITableViewCell(style: .subtitle, reuseIdentifier: identifier)
        }
        let currentBookInfo = datasource[indexPath.row]
        cell?.textLabel?.text = currentBookInfo.Title
        cell?.detailTextLabel?.text = currentBookInfo.Author
        return cell!
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Selected row at \(indexPath.row)")
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        let bookToBeDeleted = self.datasource[indexPath.row]
        do
        {
            let realm = try Realm()
            try realm.write {
                realm.delete(bookToBeDeleted)
                
                reloadTable()
                
            }
        }
        catch
        {}
    
    }

    // Edit/Delete functionality in progress
    

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) {
        
        
        let bookToBeEdited = UITableViewRowAction(style: UITableViewRowActionStyle.normal, title: "Edit") { (editAction, indexPath) -> Void in
            
     
            let bookToBeUpdated = self.datasource[indexPath.row]
            
            
        }
    
    }
    
    
    
}


//
//  BookEntryVCViewController.swift
//  CRUD Realm
//
//  Created by Sergelenbaatar Tsogtbaatar on 10/3/16.
//  Copyright © 2016 Sergts. All rights reserved.
//

import UIKit
import RealmSwift

class BookEntryVCViewController: UIViewController {

    @IBOutlet weak var txtBookTitle: UITextField!
    @IBOutlet weak var txtBookAuthor: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveData(_ sender: AnyObject) {
        saveBooks()
        self.navigationController?.popToRootViewController(animated: true)
        
    }
    
    
    
    func saveBooks() {
        let newBook = BookItem()
        newBook.Title = txtBookTitle.text!
        newBook.Author = txtBookAuthor.text!
        
        do
        {
            let realm = try Realm()
            try realm.write {
                realm.add(newBook)
                print("Book saved")
            }
        }
        catch
        {
        }
       
        
        func deleteBooks() {
            
            
            
        }
        
        
    }
    
    

}

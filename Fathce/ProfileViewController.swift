//
//  ProfileViewController.swift
//  Fathce
//
//  Created by Z Angrazy Jatt on 2020-01-21.
//  Copyright © 2020 Psych. All rights reserved.
//

import UIKit
import SQLite

class ProfileViewController: UIViewController {
    let transition = MenuSlideTransition()
    var topView:UIView?
    var database: Connection!
    let userTable = Table("users")
    let id = Expression<Int>("id")
    let urlPic = Expression<String>("urlpic")
    let fName = Expression<String>("firstname")
    let lName = Expression<String>("lastname")
    let eMail = Expression<String>("email")
    let dOb = Expression<String>("dob")

    override func viewDidLoad() {
        super.viewDidLoad()

        // loaction for data store
        do{
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            let fileUrl = documentDirectory.appendingPathComponent("users").appendingPathExtension("sqlite3")
            let dataBase = try Connection(fileUrl.path)
            self.database = dataBase
        }
        catch
        {
            print(error)
        }
        
        let createTable = self.userTable.create { (table) in
            table.column(self.id, primaryKey: true)
            table.column(self.urlPic)
            table.column(self.fName)
            table.column(self.lName)
            table.column(self.eMail, unique: true)
            table.column(self.dOb)
        }
        do {
            try self.database.run(createTable)
            print("table USERS has been create!")
        }
        catch {
            print(error)
            
        }
        
    }
    @IBOutlet weak var imgProfilePic: UIImageView!
    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtContact: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtDOB: UITextField!
    

    @IBAction func btnSaveProfileClicked(_ sender: Any) {
        let imageUrl = "imageurl"
        let firstName = self.txtFirstName.text!
        let lastName = self.txtLastName.text!
        //let contact = self.txtContact.text!
        let emailId = self.txtEmail.text!
        let dOfBirth = self.txtDOB.text!
        print(imageUrl,firstName,lastName,emailId,dOfBirth)
        
        
    }
    
    @IBAction func menuButtonClicked(_ sender: UIBarButtonItem) {
        guard let menuViewController = storyboard?.instantiateViewController(identifier: "MainPage") as? MenuViewController else {return}
        menuViewController.didMenutype = {
             menuType in
            self.transitionToContent(menuType)
        }
        menuViewController.modalPresentationStyle = .overCurrentContext
        menuViewController.transitioningDelegate = self
        present(menuViewController, animated: true)
    }
    
    // menu transition to selected page or view from menu list
        func transitionToContent(_ menuType: MenuType) {
            let title = String(describing: menuType).capitalized
            self.title = title
            topView?.removeFromSuperview()
            switch menuType {
            case .mainpage:
                mainMenu()
    //
                case .goback:
                returnHome()
            default:
                break
            }
        }
    
    // calling profile view
    func mainMenu()
    {
        guard let nextView = storyboard?.instantiateViewController(identifier: "mainManu") else {return}
        nextView.modalPresentationStyle = .overCurrentContext
        nextView.transitioningDelegate = nil
        present(nextView, animated: true)
    }
    
    func returnHome()
    {
        guard let nextView = storyboard?.instantiateViewController(identifier:"navigationController") else {return}
        nextView.modalPresentationStyle = .overCurrentContext
        nextView.transitioningDelegate = nil
        present(nextView, animated: true)
    }
}
// menu animation extention
extension ProfileViewController  :UIViewControllerTransitioningDelegate
{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}

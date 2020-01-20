//
//  MenuViewController.swift
//  Fathce
//
//  Created by Z Angrazy Jatt on 2020-01-14.
//  Copyright © 2020 Psych. All rights reserved.
//

import UIKit

enum MenuType:Int {
       case home
       case profile
       case therapyCenter
   }

class MenuViewController: UITableViewController {

    var didMenutype:((MenuType) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuType = MenuType(rawValue: indexPath.row) else {return}
        dismiss(animated: true)
        {   [weak self] in
            print("dimissing \(menuType)")
            self?.didMenutype?(menuType)
        }
    }
    

}

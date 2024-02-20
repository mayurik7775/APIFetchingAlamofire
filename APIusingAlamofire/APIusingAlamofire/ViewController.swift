//
//  ViewController.swift
//  APIusingAlamofire
//
//  Created by Admin on 20/02/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableview: UITableView!
    
    var viewModelUser = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelUser.vc = self
        viewModelUser.getAllUserDataAF()
        registerXIB()
    }
    func registerXIB(){
        let uiNib = UINib(nibName: "UserCell", bundle: nil)
        self.tableview.register(uiNib, forCellReuseIdentifier: "UserCell")
    }
}
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModelUser.arruser.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserCell
        let eachuser = viewModelUser.arruser[indexPath.row]
        cell.eachuser = eachuser
        cell.userConfiguration()
        cell.lbltitle.text = "Title : \(eachuser.title ?? " ")"
        cell.layer.cornerRadius = 15
        cell.layer.borderColor = .init(genericCMYKCyan: 5, magenta: 5, yellow: 5, black: 15, alpha: 5)
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    
}

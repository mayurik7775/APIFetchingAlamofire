//
//  UserViewModel.swift
//  APIusingAlamofire
//
//  Created by Admin on 20/02/24.
//

import UIKit
import Alamofire

class UserViewModel{
    weak var vc: ViewController?
    var arruser = [UserModel]()
    
    func  getAllUserDataAF(){
        AF.request("https://jsonplaceholder.typicode.com/todos/").response{ response in
            if let data = response.data {
                do{
                    let userResponse = try JSONDecoder().decode([UserModel].self, from: data)
                    self.arruser.append(contentsOf: userResponse)
                    DispatchQueue.main.async {
                        self.vc?.tableview.reloadData()
                    }
                }catch  let err{
                    print(err.localizedDescription)
                }
            }
        }
    }
    func getallUserData(){
        URLSession.shared.dataTask(with: URL(string: "https://jsonplaceholder.typicode.com/todos/")!) {  data, response, error in
            if error == nil{
                
            }else{
                print(error!.localizedDescription)
            }
        }.resume()
    }
}

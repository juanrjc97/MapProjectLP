//
//  NewsViewController.swift
//  MapProject
//
//  Created by Juan Jimenez on 12/23/19.
//  Copyright © 2019 Juan Jimenez. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController {
    
    
    var news : [NoticiasNet] = []

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
       createNews()
        
        // Do any additional setup after loading the view.
    }
    
    
    func createNews()  {

        NetworkManager.shared.getNoticias { result in
                   
                   switch result{
                   case .success(let notas):
                        print(notas)
                       self.news = notas
                      self.tableView.reloadData()
                   case .failure(let error):
                       print(error.localizedDescription)
                   }
                   
                  
                   
               }

    }

    
    @IBAction func DismmisButton(_ sender: UIButton) {
        
            dismiss(animated: true, completion: nil)
        
    }
   

}

extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(news.count)
           return  news.count
       }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let noticia  = news[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as! customNoticeCell
        cell.setNews(news: noticia)
        return cell
    }
    
   
}

//
//  Transaction.swift
//  7 Eleven App
//
//  Created by MyMac on 3/14/19.
//  Copyright © 2019 Abdourahim Diallo. All rights reserved.
//

import Foundation
import UIKit

class ListTransactionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var transactionsList: [Transaction] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        let urlString = "http://192.168.1.67:8080/api/transactions/all"
        guard let url = URL(string: urlString) else {return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            
            do{
                let transactions = try JSONDecoder().decode([Transaction].self, from: data)
                print(transactions)
                self.transactionsList = transactions
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch let jsonError{
                print("Error serializing json:", jsonError)
            }
            }.resume()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.transactionsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let text = "\(self.transactionsList[indexPath.row].name) | \(self.transactionsList[indexPath.row].date) | \(self.transactionsList[indexPath.row].amount)"
        
        cell.textLabel?.text = text
        
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        if self.transactionsList.count == 0 {
            print("the table is empty")
        }
        super.viewWillAppear(animated)
    }
}


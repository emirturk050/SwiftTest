//
//  ViewController.swift
//  Testing
//
//  Created by Emir Türk on 13.04.2023.
//

import UIKit


class ViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {

   
    @IBOutlet weak var tableView: UITableView!
    var toDoList = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }


    @IBAction func addClicked(_ sender: Any) {
        let alert = UIAlertController(title: "Add task", message: "Enter your To Do Item", preferredStyle: .alert)
        alert.addTextField { textfield in
            textfield.placeholder = "Enter Duty"
        }
        let okButton = UIAlertAction(title: "Ok", style: .default) { action in
            
            guard let textField = alert.textFields?[0], let inputText = textField.text, !inputText.isEmpty else {
                return
            }
            self.toDoList.insert(inputText, at: 0)
            self.tableView.insertRows(at:[.init(row: 0, section: 0)], with: .automatic)
        }
            
        alert.addAction(okButton)
        self.present(alert, animated: true)
        
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = toDoList[indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            self.toDoList.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
}


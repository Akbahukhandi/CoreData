//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by Aakanksha on 18/09/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let subjetViewModel = SubjectViewModel()
    var subjetcArray: [SubjectModel] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        tableView.reloadData()
        self.getSubjects()
    }
    
    func getSubjects() {
        subjetViewModel.getAllSubject(username: "admin", password: "1234") { subject in
            DispatchQueue.main.async {
                if let subjects = subject, !subjects.isEmpty {
                    for subject in subjects {
                        self.subjetcArray.append(subject)
                    }
                }
                self.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return subjetcArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! subjetcsTableViewCell
        let subject  = subjetcArray[indexPath.row]
        cell.subjectLabel.text = subject.subName
        return cell
    }
}

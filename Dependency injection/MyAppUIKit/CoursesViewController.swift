//
//  CoursesViewController.swift
//  MyAppUIKit
//
//  Created by Mac on 2021/10/12.
//

import UIKit

public protocol DataFetchable {
    func fetchCourseNames(completion: @escaping ([String]) -> Void)
}

struct Course {
    let name: String
}

public class CoursesViewController: UIViewController {
    
    private var tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self , forCellReuseIdentifier: "cell")
        return table
    }()
    
    let dataFetchable: DataFetchable
    
    var courses: [Course] = []

    public init(dataFetchable: DataFetchable) {
        self.dataFetchable = dataFetchable
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.dataSource = self
        tableView.delegate = self
        
        view.backgroundColor = .systemBackground
        dataFetchable.fetchCourseNames { [weak self] names in
            self?.courses = names.map { Course(name: $0) }
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }

}

extension CoursesViewController: UITableViewDelegate, UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        courses.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = courses[indexPath.row].name
        return cell
    }
    
    
}

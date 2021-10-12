//
//  ViewController.swift
//  Dependency injection
//
//  Created by Mac on 2021/10/12.
//
import MyAppUIKit
import UIKit
import APIKit

extension APICaller: DataFetchable {}

class ViewController: UIViewController {

    func solution(arr: [Int]) -> Bool {
        
  
        for (index1, i) in arr.enumerated() {
            for (index2, y) in arr.enumerated() {
            
                if i + y == 8 && index1 != index2 {
                    return true
                }
            }
        }
        
        return false
        
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(solution(arr: [1, 2 ,3 ,4]))
        print(solution(arr: [2, 5, 1, 3, 4]))
        
        // Do any additional setup after loading the view.
        
//        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 250, height: 50))
//        view.addSubview(button)
//        button.backgroundColor = .systemBlue
//        button.setTitle("Tap Me", for: .normal)
//        button.center = view.center
//        button.setTitleColor(.white, for: .normal)
//        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton() {
        let vc = CoursesViewController(dataFetchable: APICaller.shared)
        present(vc, animated: true, completion: nil)
    }
}


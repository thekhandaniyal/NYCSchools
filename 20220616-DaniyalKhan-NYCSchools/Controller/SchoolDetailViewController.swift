//
//  SchoolDetailViewController.swift
//  20220616-DaniyalKhan-NYCSchools
//
//  Created by Admin on 6/16/22.
//

import UIKit

class SchoolDetailViewController: UIViewController {
    
    
    var schoolName: String = String()
    var mathScore: String = String()
    var readingScore: String = String()
    var writingScore: String = String()
    
    @IBOutlet weak var schoolNameLabel: UILabel!
    @IBOutlet weak var mathScoreLabel: UILabel!
    @IBOutlet weak var readingScoreLabel: UILabel!
    @IBOutlet weak var writingScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        schoolNameLabel.text = schoolName
        mathScoreLabel.text = "SAT Math Score:- \(mathScore)"
        readingScoreLabel.text = "SAT Reading Score:- \(readingScore)"
        writingScoreLabel.text = "SAT Writing Score:- \(writingScore)"
    }
    
}

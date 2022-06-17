//
//  NYCSchoolNamesTableViewController.swift
//  20220616-DaniyalKhan-NYCSchools
//
//  Created by Admin on 6/16/22.
//

import UIKit

class NYCSchoolNamesTableViewController: UITableViewController {

    var nycSchoolData: [SchoolNameAndDataModel] = []
    var schoolNameAndDataViewModel: SchoolNameAndDataViewModel = SchoolNameAndDataViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "NYC Schools Names"
        navigationController?.navigationBar.prefersLargeTitles = true
    
        self.schoolNameAndDataViewModel.getSchoolData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let data = self.schoolNameAndDataViewModel.schoolData
            self.nycSchoolData = data
                self.tableView.reloadData()
        }
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    // MARK: - Number of rows in section
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return nycSchoolData.count
    }
    
    // MARK: - Configure Cell
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier.NYCSchoolNamesTableViewCell.rawValue, for: indexPath) as? NYCSchoolNamesTableViewCell else {return UITableViewCell() }
        let content = nycSchoolData[indexPath.row].schoolName
        cell.schoolName.text = content
        return cell
    }
    
    //MARK: - Did Tab funcation for details information about the NYC Schools
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: StoryboardID.SchoolDetailViewController.rawValue) as? SchoolDetailViewController else {return}
        
        let content = nycSchoolData[indexPath.row]
        vc.schoolName = content.schoolName
        vc.mathScore = content.satMathAvgScore
        vc.readingScore = content.satCriticalReadingAvgScore
        vc.writingScore = content.satWritingAvgScore
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

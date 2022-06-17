//
//  SchoolNameAndDataViewModel.swift
//  20220616-DaniyalKhan-NYCSchools
//
//  Created by Admin on 6/16/22.
//

import Foundation

class SchoolNameAndDataViewModel {
    
    var schoolData: [SchoolNameAndDataModel] = []
    
    //MARK: - When this function will call it will bring the NYC Schools data.
    func getSchoolData() {
        
        NetworkServices.shared.callApiRequest(urlString: SchoolApi.api.rawValue, expectation: [SchoolNameAndDataModel].self) { result in
            switch result {
            case .success(let data):
                    self.schoolData = data
            case .failure(let error):
                print(error)
            }
        }
    }
    
}

//
//  TableViewModel.swift
//  MySampleExp
//
//  Created by sasi on 20/11/18.
//  Copyright © 2018 InfoWave. All rights reserved.
//

import UIKit

class TableViewModel: NSObject {
    
    var apiCall = WebServiceHandler()
    var listArry: [[String : Any]] = [[:]]
    var arrylist = [Results]()

    func fetchResponse(strurl :String, completion: @escaping () -> Void) {
        
        apiCall.fetchMethodOneApiRequestResponse(strurl: strurl) { (fetchData, error) in
            DispatchQueue.main.async {
                if (fetchData?.count)! > 0 {
                    do {
                        let responseModel = try JSONDecoder().decode(ResponseDTO.self, from: fetchData!)
                        self.arrylist = responseModel.results
                        print(self.arrylist)
                    } catch {
                        print("JSON Serialization error")
                        print(error)
                    }
                    completion()
                }
            }
        }
    }
    
    // MARK: - values to display in our table view controller
    func numberOfItemsToDisplay(in section: Int) -> Int {
        return self.arrylist.count
    }
    
    func appTitleToDisplay(for indexPath: IndexPath) -> String {
        let arryData = self.arrylist[indexPath.row]
        return arryData.trackName ?? ""
    }
    
    func appimageToDisplay(for indexPath: IndexPath) -> String {
        let arryData = self.arrylist[indexPath.row]
        return arryData.artworkUrl100 ?? ""
    }
    
    
}

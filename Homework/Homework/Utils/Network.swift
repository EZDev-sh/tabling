//
//  Network.swift
//  Homework
//
//  Created by 조재훈 on 2023/01/08.
//

import Foundation
import Alamofire

class Network {
    private func getResponse(url: String,
                             httpMethod: HTTPMethod,
                             params: Parameters?,
                             completionHandler: @escaping(DataResponse<Any, AFError>) -> Void ) {
        
        let encodingType: ParameterEncoding
        if httpMethod == .get {
            encodingType = URLEncoding.default
        }
        else {
            encodingType = JSONEncoding.default
        }
        
        
        AF.request(
            Consts.BASE_URL + url,
            method: httpMethod,
            parameters: params,
            encoding: encodingType,
            headers: ["Content-Type": "application/json"]
        )
        .validate()
        .responseJSON { response in
            completionHandler(response)
        }
    }
}


//https://my-json-server.typicode.com/tabling/tabling_mobile_test/save
//https://my-json-server.typicode.com/tabling/tabling_mobile_test/recent
extension Network {
    func getRastaurantList(path: String,
                           successHandler: @escaping([Restaurant]) -> Void,
                           failedHandler: @escaping(RestaurantNetError) -> Void ) {
        let url = "tabling/tabling_mobile_test/\(path)"
        self.getResponse(url: url, httpMethod: .get, params: nil, completionHandler: { response in
            
            switch response.result {
            case .success:
                guard let data = response.data else { return }
                
                do {
                    let decoder = JSONDecoder()
                    let result = try decoder.decode(Restaurants.self, from: data)
                    successHandler(result.list)
                } catch {
                    failedHandler(.invalidJSON)
                }
                
            case .failure:
                failedHandler(.networkError)
            }
            
        })
    }
}

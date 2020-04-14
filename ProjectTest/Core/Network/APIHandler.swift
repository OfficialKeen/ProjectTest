//
//  APIHandler.swift
//  ProjectTest
//
//  Created by keenOI on 14/04/20.
//  Copyright © 2020 keenOI. All rights reserved.
//

import Foundation

class APIHandler {
    typealias completionNewsModel = ([NewsModel.Source]) -> ()
    typealias completionListNewsModel = ([ListNewsModel.Article]) -> ()
    
    func getDataNews(completionBlock: @escaping completionNewsModel) {
        guard let myUrl = URL(string: newsAPI) else { return }
        var request = URLRequest(url: myUrl)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            guard let data = data else { return }
            do {
                let JSONData = try JSONDecoder().decode(NewsModel.self, from: data)
                completionBlock(JSONData.sources)
            } catch let jsonError {
                print(jsonError)
            }
        }.resume()
    }
    
    func getListDataNews(_ idNews: String, completionBlock: @escaping completionListNewsModel) {
        guard let myUrl = URL(string: filterNews(idNews: idNews)) else { return }
        var request = URLRequest(url: myUrl)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
            }
            guard let data = data else { return }
            do {
                let JSONData = try JSONDecoder().decode(ListNewsModel.self, from: data)
                completionBlock(JSONData.articles)
            } catch let jsonError {
                print(jsonError)
            }
        }.resume()
    }
}


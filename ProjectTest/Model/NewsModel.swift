//
//  NewsModel.swift
//  ProjectTest
//
//  Created by keenOI on 14/04/20.
//  Copyright © 2020 keenOI. All rights reserved.
//

struct NewsModel: Codable {
    let sources: [Source]
    
    struct Source: Codable {
        let id: String?
        let name: String?
        let description: String?
        let url: String?
        let category: String?
        let language: String?
        let country: String?
    }
}

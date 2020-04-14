//
//  ListNewsModel.swift
//  ProjectTest
//
//  Created by keenOI on 14/04/20.
//  Copyright © 2020 keenOI. All rights reserved.
//

struct ListNewsModel: Codable {
    let articles: [Article]
    
    struct Article: Codable {
        let source: Source
        let author: String?
        let title: String?
        let description: String?
        let url: String?
        let urlToImage: String?
        let publishedAt: String?
        let content: String?
        
        struct Source: Codable {
            let id: String?
            let name: String?
        }
    }
}

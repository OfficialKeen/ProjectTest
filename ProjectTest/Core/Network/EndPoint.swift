//
//  EndPoint.swift
//  ProjectTest
//
//  Created by keenOI on 14/04/20.
//  Copyright © 2020 keenOI. All rights reserved.
//

let baseUrl = "https://newsapi.org"
let urlApi = "/v2/sources?"
let listUrl = "/v2/top-headlines?sources="
let apiKey = "apiKey=54f5838c9a14468aa7e6516266d0ec8e"

let newsAPI = baseUrl + urlApi + apiKey

func filterNews(idNews: String) -> String {
    return baseUrl + listUrl + idNews + "&" + apiKey
}


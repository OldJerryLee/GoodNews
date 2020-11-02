//
//  Article.swift
//  GoodNews
//
//  Created by Fabricio Pujol on 01/11/20.
//  Copyright © 2020 Fabricio Pujol. All rights reserved.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}

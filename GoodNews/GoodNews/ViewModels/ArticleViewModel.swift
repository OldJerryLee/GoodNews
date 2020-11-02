//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Fabricio Pujol on 01/11/20.
//  Copyright © 2020 Fabricio Pujol. All rights reserved.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]
}

extension ArticleListViewModel {

    var numberOfSections: Int {
        return 1
    }

    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }

    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article)
    }
}

struct ArticleViewModel {
    private let article: Article

    var title: String {
        return self.article.title
    }

    var description: String {
        return self.article.description
    }
}

extension ArticleViewModel {
    init(_ article: Article) {
        self.article = article
    }
}

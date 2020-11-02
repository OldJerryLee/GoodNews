//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Fabricio Pujol on 25/10/20.
//  Copyright © 2020 Fabricio Pujol. All rights reserved.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    private var articleListVM: ArticleListViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    private func setup() {

        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=18613bb94db348afbb0183ecde19ff8c")!

        Webservice().getArticles(url: url) { articles in
            if let articles = articles {
                self.articleListVM = ArticleListViewModel(articles: articles)

                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM == nil ? 0 : self.articleListVM.numberOfSections
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM.numberOfRowsInSection(section)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }

        let articleVM = self.articleListVM.articleAtIndex(indexPath.row)

        cell.titleLabel.text = articleVM.title
        cell.descriptionLabel.text = articleVM.description

        return cell
    }
}

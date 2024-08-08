//
//  NewsView.swift
//  testTabBar
//
//  Created by Ahmed Halilovic on 7. 8. 2024..
//

import SwiftUI

struct NewsView: View {
    @State private var articles: [Article] = []
    
    var body: some View {
        NavigationView{
            List(articles) { article in
                NavigationLink(destination: ArticleDetailView(article: article)) {
                    HStack{
                        VStack(alignment: .leading) {
                            Text(article.title)
                                .font(.headline)
                            Text(article.description)
                                .font(.subheadline)
                                .lineLimit(2)
                        }
                    }
                }
            }
        }
        .navigationBarTitle("News")
        .onAppear {
            fetchNews()
        }
    }
    
    func fetchNews() {
        
        self.articles = [
            Article(id: 1, title: "Article 1", description: "This is article 1"),
            Article(id: 2, title: "Article 2", description: "This is description of article 2")
        ]
        
    }
}

struct Article: Identifiable {
    let id: Int
    let title: String
    let description: String
}

struct ArticleDetailView: View {
    let article: Article
    
    var body: some View {
        VStack {
            Text(article.title)
                .font(.largeTitle)
                .padding(.bottom, 10)
            Text(article.description)
                .font(.body)
            Spacer()
        }
        .padding()
        //.navigationTitle(Text("Article Details"), .displayMode: .inline)
    }
}

struct NewsView_Previews: PreviewProvider {
    static var previews: some View {
        NewsView()
    }
}

//
//  Books.swift
//  SimpleHTTP
//
//  Created by Gil Estes on 3/29/22.
//

import Foundation

struct Book: Codable, Identifiable {
	let id = UUID()
	var author: String
	var email: String
	var title: String
}

class Api: ObservableObject {
	@Published var books = [Book]()
	
	func loadData(completion:@escaping ([Book]) -> ()) {
		guard let url = URL(string: "https://training.xcelvations.com/data/books.json") else {
			print("Invalid url...")
			return
		}
		
		URLSession.shared.dataTask(with: url) { data, response, error in
			let books = try! JSONDecoder().decode([Book].self, from: data!)
			print(books)
			DispatchQueue.main.async {
				completion(books)
			}
		}.resume()
	}
}

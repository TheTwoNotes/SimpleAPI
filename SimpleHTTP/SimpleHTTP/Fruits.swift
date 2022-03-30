//
//  Books.swift
//  SimpleHTTP
//
//  Created by Gil Estes on 3/29/22.
//

import Foundation

struct Nutrition: Codable {
	var carbohydrates: Double = 0
	var protein: Double = 0
	var fat: Double = 0.0
	var calories: Double = 0.0
	var sugar: Double = 0.0
}

struct Fruit: Codable, Identifiable {
	let id = UUID()
	var genus: String
	var name: String
	var family: String
	var order: String
	var nutritions: Nutrition
}

class FruitApi: ObservableObject {
	@Published var fruits = [Fruit]()

	func loadData(completion:@escaping ([Fruit]) -> ()) {
		guard let url = URL(string: "https://fruityvice.com/api/fruit/all") else {
			print("Invalid url...")
			return
		}
		
		URLSession.shared.dataTask(with: url) { data, response, error in
			let fruits = try! JSONDecoder().decode([Fruit].self, from: data!)
			print(fruits)
			DispatchQueue.main.async {
				completion(fruits)
			}
		}.resume()

	}
	
	func loadSelectedFruitData(item: String, completion:@escaping ([Fruit]) -> ()) {
		guard let url = URL(string: "https://fruityvice.com/api/fruit/\(item)") else {
			print("Invalid url...")
			return
		}
		
		URLSession.shared.dataTask(with: url) { data, response, error in
			let fruits = try! JSONDecoder().decode(Fruit.self, from: data!)
			print(fruits)
			DispatchQueue.main.async {
				completion([fruits])
			}
		}.resume()
	}
}

//
//  FruitsView.swift
//  SimpleHTTP
//
//  Created by Gil Estes on 3/29/22.
//

import SwiftUI



struct ContentView: View {
	
	@State var fruits = [Fruit]()
	@State var sortingByText: String = "Name"
	
	var body: some View {
		
		VStack {
			Text("Fruit List").font(.title)
			
			if fruits.count == 0 {
				Spacer()
				Text("Loading your data...")
				Spacer()
			} else {
				VStack {
					Text("Sorting by: \(sortingByText)")
					HStack {
						Button("Genus") {
							sortFruitListing(\Fruit.genus)
							sortingByText = "Genus"
						}
						Button("Name") {
							sortFruitListing(\Fruit.name)
							sortingByText = "Name"
						}
						Button("Family") {
							sortFruitListing(\Fruit.family)
							sortingByText = "Family"
						}
						Button("Order") {
							sortFruitListing(\Fruit.order)
							sortingByText = "Order"
						}
					}
				}.padding(.top)
				
				List(fruits.sorted(by: \.nutritions.protein)) { fruit in
					VStack(alignment: .leading) {
						Text("\(fruit.name)")
							.font(.headline)
							.foregroundColor(Color(UIColor.brown))

						Text("genus: \(fruit.genus)")
								.font(.caption)
						
						Text("family: \(fruit.family)")
								.font(.caption)
						
						Text("order: \(fruit.order)")
							.font(.caption)
						
						Text("\tcarbohydrates: \(fruit.nutritions.carbohydrates, specifier: "%.1f")")
							.font(.caption)
						
						Text("\tprotein: \(fruit.nutritions.protein, specifier: "%.1f")")
							.font(.caption)

						Text("\tfat: \(fruit.nutritions.fat, specifier: "%.1f")")
							.font(.caption)

						Text("\tcalories: \(fruit.nutritions.calories, specifier: "%.1f")")
							.font(.caption)

						Text("\tsugars: \(fruit.nutritions.sugar, specifier: "%.1f")")
							.font(.caption)

					}
				}.navigationBarTitle("Fruit List")
			}
			CopyrightView()
		}.onAppear() {
			loadAPI(\Fruit.name)
		}
	}
	
	func sortFruitListing(_ sortKeyPath: KeyPath<Fruit,String>) {
		fruits = fruits.sorted(by: sortKeyPath)
	}

	func loadAPI(_ sortBy: KeyPath<Fruit, String>) {
		DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
			FruitApi().loadData { (fruits) in
				self.fruits = fruits.sorted(by: sortBy)
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}

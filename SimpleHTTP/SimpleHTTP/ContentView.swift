//
//  ContentView.swift
//  SimpleHTTP
//
//  Created by Gil Estes on 3/29/22.
//

import SwiftUI

struct ContentView: View {
	
	@State var books = [Book]()
	
    var body: some View {
		List(books) { book in
			VStack {
				Text("\(book.title)")
					.font(.subheadline)
					.foregroundColor(Color(UIColor.brown))
					.padding(.bottom)
				HStack{
					Text("\(book.author)")
						.font(.caption)
						.fontWeight(.bold)
					Text("\(book.email)")
						.font(.caption)
						.foregroundColor(.blue)
						.fontWeight(.semibold)
				}
			}
		}.onAppear() {
			Api().loadData { (books) in
				self.books = books
			}
		}.navigationBarTitle("Book List")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

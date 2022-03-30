//
//  CopyrightView.swift
//  SimpleHTTP
//
//  Created by Gil Estes on 3/29/22.
//

import SwiftUI

extension Date {
	func dateYearString() -> String {
		let formatter = DateFormatter()
		formatter.dateFormat = "yyyy"
		return formatter.string(from: self)
	}
}

struct CopyrightView: View {
	
	@State var topPadding: Bool = true
	
	let copyRightSymbol: String = String("\u{00A9}")
	var body: some View {
		if topPadding {
			Spacer()
		}
		HStack {
			Text("\(copyRightSymbol)\(Date().dateYearString()) BGE Software, Inc.")
				.font(.caption)
				.padding([.top, .bottom], 4)
		}
	}
}

struct CopyrightView_Previews: PreviewProvider {
	static var previews: some View {
		CopyrightView()
	}
}

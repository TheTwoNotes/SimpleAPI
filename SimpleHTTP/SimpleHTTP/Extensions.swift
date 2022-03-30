//
//  Extensions.swift
//  SimpleHTTP
//
//  Created by Gil Estes on 3/30/22.
//

import Foundation

extension Sequence {
	func sorted<T: Comparable>(
		by keyPath: KeyPath<Element, T>,
		using comparator: (T, T) -> Bool = (<)
	) -> [Element] {
		sorted { a, b in
			comparator(a[keyPath: keyPath], b[keyPath: keyPath])
		}
	}
}

//
//  ViewControllerViewModel.swift
//  selectableCollectionViewApp
//
//  Created by kbcard on 28/12/2018.
//  Copyright © 2018 taehyen. All rights reserved.
//

import UIKit

class StatusItem {
	var selectedIndex: Int = 0
	var text: String = ""
}

class ViewControllerViewModel: NSObject {
	public var items: [StatusItem] = []
	private var selectedCount = 0
	
	public func readyForTestData() {
		for value in 0..<6 {
			let item = StatusItem()
			item.text = "\(value)"
			items.append(item)
		}
	}
	
	public func toggleSelect(index: Int) {
		guard let item = items[safe: index] else {
			return
		}

		if item.selectedIndex == 0 {
			item.selectedIndex = selectedCount + 1
		} else {
			item.selectedIndex = 0
		}
		
		var selectedItems = items.filter { (item) -> Bool in
			return (item.selectedIndex > 0)
		}
		
		selectedItems.sort { (left, right) -> Bool in
			return (left.selectedIndex < right.selectedIndex)
		}
		
		var selectedIndex = 1
		for item in selectedItems {
			item.selectedIndex = selectedIndex
			selectedIndex += 1
		}
		
		selectedCount = selectedItems.count
	}
	
	//It will be used by other sample project.
	public func orderedItemsByIndex() -> [StatusItem] {
		let ordered = items.sorted { (left, right) -> Bool in
			return (left.selectedIndex > right.selectedIndex)
		}
		return ordered
	}
}

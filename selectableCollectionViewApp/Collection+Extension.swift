//
//  Collection+Extension.swift
//  selectableCollectionViewApp
//
//  Created by kbcard on 28/12/2018.
//  Copyright © 2018 taehyen. All rights reserved.
//

import Foundation

extension Collection {
	subscript (safe index: Index) -> Element? {
		return indices.contains(index) ? self[index] : nil
	}
}

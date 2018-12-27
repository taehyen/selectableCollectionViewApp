//
//  CustomCollectionViewCell.swift
//  selectableCollectionViewApp
//
//  Created by innergraph on 28/12/2018.
//  Copyright © 2018 taehyen. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
	@IBOutlet weak var titleLabel: UILabel!
	@IBOutlet weak var selectedOrderLabel: UILabel!

	override init(frame: CGRect) {
		super.init(frame: frame)
		viewInitialization()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		viewInitialization()
	}
	
	private func viewInitialization() {
		backgroundColor = .white
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		
	}

	//TODO: selected state toggle
}

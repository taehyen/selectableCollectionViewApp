//
//  ViewController.swift
//  selectableCollectionViewApp
//
//  Created by innergraph on 28/12/2018.
//  Copyright © 2018 taehyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var collectionView: UICollectionView!
	
	let viewModel = ViewControllerViewModel()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		viewModel.readyForTestData()
		
		readyForCollectionView()
	}
	
	private func readyForCollectionView() {
		collectionView.delegate = self
		collectionView.dataSource = self
//		collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCollectionViewCell")
	}
}

extension ViewController: UICollectionViewDelegate {
	
}

extension ViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.items.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
		if let item = viewModel.items[safe: indexPath.row] {
			cell.titleLabel.text = item.text
			if item.selectedIndex > 0 {
				cell.selectedOrderLabel.text = "\(item.selectedIndex)"
			} else {
				cell.selectedOrderLabel.text = ""
			}
		}
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
		
		if viewModel.items[safe: indexPath.row] != nil {
			viewModel.toggleSelect(index: indexPath.row)
			collectionView.reloadData()
		}
	}
}

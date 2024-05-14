//
//  CategoryView.swift
//  LivingFriend
//
//  Created by 혜리 on 5/14/24.
//

import UIKit

final class CategoryView: UIView {
    
    // MARK: - UI
    
    private lazy var listCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .white
        
        view.register(CategoryCollectionViewCell.self,
                      forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        return view
    }()
}

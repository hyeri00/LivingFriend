//
//  CategoryCollectionViewCell.swift
//  LivingFriend
//
//  Created by 혜리 on 5/15/24.
//

import UIKit

final class CategoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - UI
    
    private let titleImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Font.Typography.air12
        return label
    }()
}

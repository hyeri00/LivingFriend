//
//  CategoryCollectionViewCell.swift
//  LivingFriend
//
//  Created by 혜리 on 5/15/24.
//

import UIKit

final class CategoryCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Metric
    
    private enum Metric {
        static let imageSize: CGFloat = 80
        static let labelTopSpacing: CGFloat = 10
    }

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
    
    // MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Bind
    
    func bind(
        image: UIImage,
        title: String
    ) {
        self.titleImage.image = image
        self.titleLabel.text = title
    }
    
    // MARK: - Configure
    
    private func configure() {
        self.backgroundColor = .white
        
        self.makeConstraints()
    }
    
    private func makeConstraints() {
        self.addSubview(self.titleImage)
        self.addSubview(self.titleLabel)
        
        self.titleImage.snp.makeConstraints {
            $0.width.height.equalTo(Metric.imageSize)
            $0.centerX.centerY.equalToSuperview()
        }
        
        self.titleLabel.snp.makeConstraints {
            $0.top.equalTo(self.titleImage.snp.bottom).offset(Metric.labelTopSpacing)
            $0.centerX.equalToSuperview()
        }
    }
}

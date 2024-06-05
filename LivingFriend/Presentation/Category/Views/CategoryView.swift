//
//  CategoryView.swift
//  LivingFriend
//
//  Created by 혜리 on 5/14/24.
//

import UIKit

final class CategoryView: UIView {
    
    // MARK: - Properties
    
    var didTapColletionViewAction: (() -> Void)?
    
    // MARK: - Metric
    
    private enum Metric {
        static let collectionViewTopMargin: CGFloat = 10
    }
    
    // MARK: - UI
    
    private lazy var listCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .white
        view.delegate = self
        view.dataSource = self
        view.register(CategoryCollectionViewCell.self,
                      forCellWithReuseIdentifier: "CategoryCollectionViewCell")
        return view
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let layout = self.listCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            let totalWidth = self.listCollectionView.bounds.width
            let availableWidth = totalWidth - layout.sectionInset.left - layout.sectionInset.right - (layout.minimumInteritemSpacing * 2)
            let itemWidth = availableWidth / 3
            layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        }
    }
    
    // MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Configure
    
    private func configure() {
        self.backgroundColor = .white
        
        self.makeConstraints()
    }
    
    private func makeConstraints() {
        self.addSubview(self.listCollectionView)
        
        self.listCollectionView.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(Metric.collectionViewTopMargin)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource

extension CategoryView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return CategoryData.shared.categoryData.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "CategoryCollectionViewCell",
            for: indexPath) as! CategoryCollectionViewCell
        let item = CategoryData.shared.categoryData[indexPath.row]
        
        switch item {
        case .item(_, let image, let title):
            cell.bind(image: image, title: title)
        }
        return cell
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath
    ) {
        self.didTapColletionViewAction?()
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension CategoryView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let layout = collectionViewLayout as! UICollectionViewFlowLayout
        let itemWidth = (collectionView.bounds.width - layout.sectionInset.left - layout.sectionInset.right - layout.minimumInteritemSpacing * 2) / 3
        return CGSize(width: itemWidth, height: itemWidth)
    }
}

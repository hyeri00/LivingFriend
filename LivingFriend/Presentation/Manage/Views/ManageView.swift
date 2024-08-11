//
//  ManageView.swift
//  LivingFriend
//
//  Created by 혜리 on 5/27/24.
//

import UIKit

final class ManageView: UIView {
    
    // MARK: - Properties
    
    private let viewModel = HomeViewModel()
    
    var didTapTableViewAction: (() -> Void)?
    
    // MARK: - UI
    
    lazy var manageTableView: UITableView = {
        let view = UITableView()
        view.rowHeight = 52
        view.backgroundColor = .white
        view.separatorStyle = .none
        
        view.delegate = self
        view.dataSource = self
        view.register(ManageTableViewCell.self,
                      forCellReuseIdentifier: "ManageTableViewCell")
        return view
    }()
    
    private let emptyStateLabel: UILabel = {
        let label = UILabel()
        label.text = TextManager.manage_emptyState
        label.textColor = .black
        label.font = Font.Typography.air14
        label.numberOfLines = 0
        label.textAlignment = .center
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
    
    // MARK: - Configure
    
    private func configure() {
        self.backgroundColor = .white
        
        self.fetchObject()
        self.makeConstraints()
    }
    
    private func fetchObject() {
        self.viewModel.fetchObjects {
            DispatchQueue.main.async {
                self.viewModel.filterMostRecentObjects(self.viewModel.fetchedObjects)
                self.manageTableView.reloadData()
            }
        }
    }
    
    private func makeConstraints() {
        self.addSubview(self.manageTableView)
        self.addSubview(self.emptyStateLabel)
        
        self.manageTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        self.emptyStateLabel.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ManageView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return self.viewModel.recentObjects.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ManageTableViewCell",
                                                 for: indexPath) as! ManageTableViewCell
        
        let object = self.viewModel.recentObjects[indexPath.row]
        
        cell.bind(
            title: object.categoryTitle ?? "",
            date: object.dateText ?? ""
        )
        
        return cell
    }
    
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        guard let categoryTitle = self.viewModel.recentObjects[indexPath.row].categoryTitle else {
            return
        }
        
        SharedData.shared.selectedMyManageTitle = categoryTitle
        self.didTapTableViewAction?()
    }
}

// MARK: - Refresh

extension ManageView {
    public func refresh() {
        self.viewModel.filterMostRecentObjects(self.viewModel.fetchedObjects)
        self.manageTableView.reloadData()
        self.emptyStateLabel.isHidden = self.viewModel.recentObjects.count > 0
    }
}

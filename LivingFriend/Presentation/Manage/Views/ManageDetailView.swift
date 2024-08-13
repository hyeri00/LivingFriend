//
//  ManageDetailView.swift
//  LivingFriend
//
//  Created by 혜리 on 6/30/24.
//

import UIKit

final class ManageDetailView: UIView {
    
    // MARK: - Metric
    
    private enum Metric {
        static let recentDateTopMargin: CGFloat = 70
        static let tableViewTopSpacing: CGFloat = 40
    }
    
    // MARK: - Properties
    
    private let viewModel = HomeViewModel()
    
    // MARK: - UI
    
    private let recentDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Font.Typography.bold50
        return label
    }()
    
    private lazy var listTableView: UITableView = {
        let view = UITableView()
        view.rowHeight = 52
        view.backgroundColor = .white
        view.separatorStyle = .none
        
        view.delegate = self
        view.dataSource = self
        view.register(ManageDetailTableViewCell.self,
                      forCellReuseIdentifier: "ManageDetailTableViewCell")
        return view
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
        
        self.viewModel.fetchCategoryObject(forCategory: SharedData.shared.selectedMyManageTitle ?? "") {
            DispatchQueue.main.async {
                self.refresh()
            }
        }
        
        self.makeConstraints()
    }
    
    private func makeConstraints() {
        self.addSubview(self.recentDateLabel)
        self.addSubview(self.listTableView)
        
        self.recentDateLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(Metric.recentDateTopMargin)
            $0.centerX.equalToSuperview()
        }
        
        self.listTableView.snp.makeConstraints {
            $0.top.equalTo(self.recentDateLabel.snp.bottom).offset(Metric.tableViewTopSpacing)
            $0.bottom.leading.trailing.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ManageDetailView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return self.viewModel.categoryObjects.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ManageDetailTableViewCell",
                                                 for: indexPath) as! ManageDetailTableViewCell
        
        let objects = self.viewModel.categoryObjects[indexPath.row]
        
        cell.bind(
            date: objects.dateText ?? "",
            setDate: objects.periodText! + "일"
        )
        
        self.recentDateLabel.text = objects.dateText
        
        return cell
    }
}

// MARK: - Refresh

extension ManageDetailView {
    
    public func refresh() {
        self.listTableView.reloadData()
    }
}

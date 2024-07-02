//
//  ManageDetailView.swift
//  LivingFriend
//
//  Created by 혜리 on 6/30/24.
//

import UIKit

final class ManageDetailView: UIView {
    
    // MARK: - UI
    
    private let recentDateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = Font.Typography.bold30
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
        
        self.makeConstraints()
    }
    
    private func makeConstraints() {
        self.addSubview(self.recentDateLabel)
        self.addSubview(self.listTableView)
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ManageDetailView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 1
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ManageDetailTableViewCell",
                                                 for: indexPath) as! ManageDetailTableViewCell
        return cell
    }
}

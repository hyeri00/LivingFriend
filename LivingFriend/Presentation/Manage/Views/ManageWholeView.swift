//
//  ManageWholeView.swift
//  LivingFriend
//
//  Created by 혜리 on 8/18/24.
//

import UIKit

final class ManageWholeView: UIView {
    
    // MARK: - Properties
    
    private let viewModel = HomeViewModel()
    
    // MARK: - UI
    
    private lazy var manageTableView: UITableView = {
        let view = UITableView()
        view.rowHeight = 52
        view.backgroundColor = .white
        view.separatorStyle = .none
        
        view.delegate = self
        view.dataSource = self
        view.register(ManageWholeTableViewCell.self,
                      forCellReuseIdentifier: "ManageWholeTableViewCell")
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
        
        self.setViewModel()
        self.makeConstraints()
    }
    
    private func setViewModel() {
        
        self.viewModel.fetchObjects { [weak self] in
            self?.refresh()
        }
    }
    
    private func makeConstraints() {
        self.addSubview(self.manageTableView)
        
        self.manageTableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource

extension ManageWholeView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        let count = viewModel.fetchedObjects.count
        print("All Count: \(count)")
        return count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ManageWholeTableViewCell",
                                                 for: indexPath) as! ManageWholeTableViewCell
        
        let object = self.viewModel.fetchedObjects[indexPath.row]
        
        cell.bind(
            title: object.categoryTitle ?? "",
            setDate: object.periodText!+"일",
            date: object.dateText ?? ""
        )
        
        return cell
    }
}

// MARK: - Refresh

extension ManageWholeView {
    
    public func refresh() {
        self.manageTableView.reloadData()
    }
}

//
//  PeriodView.swift
//  LivingFriend
//
//  Created by 혜리 on 5/15/24.
//

import UIKit
import CoreData

final class PeriodView: UIView {
    
    // MARK: - Properties
    
    var container: NSPersistentContainer!
    
    // MARK: - Metric
    
    private enum Metric {
        static let basePadding: CGFloat = 30
        static let confirmButtonHeight: CGFloat = 48
        static let stackViewTopSpacing: CGFloat = 30
        static let stackViewLeadingSpacing: CGFloat = 40
    }
    
    // MARK: - UI
    
    private let numberLabel: UILabel = {
        let label = UILabel()
        label.text = TextManager.period_number
        label.textColor = .black
        label.font = Font.Typography.bold30
        return label
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = TextManager.period_date
        label.textColor = .black
        label.font = Font.Typography.bold30
        return label
    }()
    
    private let upButton: UIButton = {
        let button = UIButton()
        button.setTitle(TextManager.period_up, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = Font.Typography.bold30
        return button
    }()
    
    private let downButton: UIButton = {
        let button = UIButton()
        button.setTitle(TextManager.period_down, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = Font.Typography.bold30
        return button
    }()
    
    private let minus20Button: UIButton = {
        let button = UIButton()
        button.setTitle(TextManager.period_down20, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Font.Typography.bold10
        button.layer.cornerRadius = 8
        button.backgroundColor = .black
        button.clipsToBounds = true
        return button
    }()
    
    private let minus10Button: UIButton = {
        let button = UIButton()
        button.setTitle(TextManager.period_down10, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Font.Typography.bold10
        button.layer.cornerRadius = 8
        button.backgroundColor = .black
        button.clipsToBounds = true
        return button
    }()
    
    private let plus10Button: UIButton = {
        let button = UIButton()
        button.setTitle(TextManager.period_up10, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Font.Typography.bold10
        button.layer.cornerRadius = 8
        button.backgroundColor = .black
        button.clipsToBounds = true
        return button
    }()
    
    private let plus20Button: UIButton = {
        let button = UIButton()
        button.setTitle(TextManager.period_up20, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Font.Typography.bold10
        button.layer.cornerRadius = 8
        button.backgroundColor = .black
        button.clipsToBounds = true
        return button
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [minus20Button,
                                                  minus10Button,
                                                  plus10Button,
                                                  plus20Button])
        view.axis = .horizontal
        view.spacing = 10
        view.distribution = .fillEqually
        return view
    }()
    
    private let confirmButton: UIButton = {
        let button = UIButton()
        button.setTitle(TextManager.period_confirmText, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Font.Typography.air14
        button.layer.cornerRadius = 12
        button.backgroundColor = .black
        button.clipsToBounds = true
        return button
    }()
    
    // MARK: - Counter Logic
    
    private var number = 30 {
        didSet {
            numberLabel.text = "\(number)"
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
        
        self.addConfigure()
        self.makeConstraints()
    }
    
    private func addConfigure() {
        let actions: [(UIButton, Int)] = [
            (self.upButton, 1),
            (self.downButton, -1),
            (self.minus20Button, -20),
            (self.minus10Button, -10),
            (self.plus10Button, 10),
            (self.plus20Button, 20)
        ]
        
        for (button, adjustment) in actions {
            button.addAction(UIAction(handler: { [weak self] _ in
                guard let self = self else { return }
                
                UIView.transition(with: self.numberLabel, duration: 0.3, options: .transitionCrossDissolve, animations: {
                    let newValue = (self.number) + adjustment
                    self.number = min(max(newValue, 1), 200)
                }, completion: nil)
            }), for: .touchUpInside)
        }
        
        self.confirmButton.addAction(UIAction(handler: { [weak self] _ in
            guard let title = SharedData.shared.selectedTitle else {
                print("SharedData's selectedTitle is nil")
                return
            }
            
            let periodText = "\(self?.number ?? -2)"
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            let dateText = dateFormatter.string(from: Date())
            
            guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
                print("Failed to get AppDelegate")
                return
            }
            
            let context = appDelegate.persistentContainer.viewContext
            guard let entity = NSEntityDescription.entity(forEntityName: "MyManageEntity", in: context) else {
                print("Failed to get entity description for MyManageEntity")
                return
            }
            
            let object = NSManagedObject(entity: entity, insertInto: context)
            
            object.setValue(title, forKey: "categoryTitle")
            object.setValue(dateText, forKey: "dateText")
            object.setValue(periodText, forKey: "periodText")
            
            do {
                try context.save()
                print("Saved to Core Data with title: \(title), dateText: \(dateText), periodText: \(periodText)")
            } catch {
                print("Failed saving to Core Data: \(error)")
            }
        }), for: .touchUpInside)

    }
    
    private func makeConstraints() {
        self.addSubview(self.numberLabel)
        self.addSubview(self.dateLabel)
        self.addSubview(self.upButton)
        self.addSubview(self.downButton)
        self.addSubview(self.buttonStackView)
        self.addSubview(self.confirmButton)
        
        self.numberLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        self.dateLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(self.upButton.snp.trailing).offset(Metric.basePadding)
        }
        
        self.upButton.snp.makeConstraints {
            $0.bottom.equalTo(self.numberLabel.snp.top).offset(-Metric.basePadding)
            $0.centerX.equalToSuperview()
        }
        
        self.downButton.snp.makeConstraints {
            $0.top.equalTo(self.numberLabel.snp.bottom).offset(Metric.basePadding)
            $0.centerX.equalToSuperview()
        }
        
        self.buttonStackView.snp.makeConstraints {
            $0.top.equalTo(self.downButton.snp.bottom).offset(Metric
                .stackViewTopSpacing)
            $0.leading.trailing.equalToSuperview().inset(Metric.stackViewLeadingSpacing)
        }
        
        self.confirmButton.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide.snp.bottom).inset(Metric.basePadding)
            $0.leading.trailing.equalToSuperview().inset(Metric.basePadding)
            $0.height.equalTo(Metric.confirmButtonHeight)
        }
    }
}

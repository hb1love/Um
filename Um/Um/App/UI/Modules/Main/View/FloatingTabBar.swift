//
//  FloatingTabBar.swift
//  Um
//
//  Created by hb1love on 2020/01/26.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import SnapKit
import RxGesture

protocol FloatingTabBarDelegate: AnyObject {
  func didTap(button: FloatingTabButton, at index: Int)
}

final class FloatingTabBar: BaseView {

  // MARK: - Constants

  private struct Metric {
    static let margin = 6.f
    static let containerSpacing = 23.f
    static let buttonWidth = 44.f
  }

  var containerView: UIStackView!
  var tabButtons: [FloatingTabButton] = []

  // MARK: - Properties

  weak var delegate: FloatingTabBarDelegate?

  var tabBarItems: [UITabBarItem] = [] {
    didSet {
      makeTabButtons()
    }
  }

  override func setupSubviews() {
    self.backgroundColor = .white
    containerView = UIStackView().also {
      $0.axis = .horizontal
      $0.alignment = .fill
      $0.distribution = .fill
      $0.spacing = Metric.containerSpacing
      addSubview($0)
    }
  }

  override func setupConstraints() {
    containerView.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(Metric.containerSpacing)
      $0.trailing.equalToSuperview().offset(-Metric.containerSpacing)
      $0.top.equalToSuperview().offset(Metric.margin)
      $0.bottom.equalToSuperview().offset(-Metric.margin)
      $0.height.equalTo(Metric.buttonWidth)
    }
  }

  func makeTabButtons() {
    for item in tabBarItems {
      let button = FloatingTabButton(tabBarItem: item)
      if item.tag == 2 {
        button.backgroundColor = UIColor(named: "tab_write_background")
        button.cornerRadius = 21
      }
      button.snp.makeConstraints {
        $0.width.height.equalTo(Metric.buttonWidth)
      }
      button.rx
        .tapGesture()
        .when(.recognized)
        .subscribe(onNext: { [weak self] _ in
          self?.delegate?.didTap(button: button, at: item.tag)
        }).disposed(by: disposeBag)

      tabButtons.append(button)
      containerView.addArrangedSubview(button)
    }
  }

  func refreshTabBar(index: Int) {
    for button in tabButtons where button.item.tag != 2 {
      if button.item.tag == index {
        button.button.tintColor = UIColor(named: "tab_active")
      } else {
        button.button.tintColor = UIColor(named: "tab_inactive")
      }
    }
  }
}

class FloatingTabButton: BaseView {

  var roundView: UIView!
  var button: UIButton!

  var item: UITabBarItem!

  init(tabBarItem: UITabBarItem) {
    self.item = tabBarItem

    super.init(frame: .zero)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func setupSubviews() {
    roundView = UIView().also {
      addSubview($0)
    }
    button = UIButton().also {
      $0.tag = item.tag
      $0.setImage(item.image, for: .normal)
      $0.setImage(item.image, for: .selected)
      $0.isUserInteractionEnabled = false
      roundView.addSubview($0)
    }
  }

  override func setupConstraints() {
    roundView.snp.makeConstraints {
      $0.edges.equalToSuperview()
      $0.width.height.equalTo(44)
    }
    button.snp.makeConstraints {
      $0.centerX.centerY.equalToSuperview()
      $0.width.height.equalTo(24)
    }
  }
}

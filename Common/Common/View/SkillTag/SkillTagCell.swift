//
//  SkillTagCell.swift
//  Common
//
//  Created by hb1love on 2020/02/09.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import ReactorKit
import RxSwift
import SnapKit

public final class SkillTagCell: BaseCollectionViewCell, View {

  // MARK: - Constants

  private struct Metric {
    static let spacing = 8.f
  }

  // MARK: - Subviews

  public var containerView: UIView!
  public var nameLabel: UILabel!

  // MARK: - Properties

  static let maxWidth = 240.f

  public override func setupSubviews() {
    super.setupSubviews()
    containerView = UIView().also {
      $0.backgroundColor = .orange
      $0.cornerRadius = 16
      contentView.addSubview($0)
    }
    nameLabel = UILabel().also {
      $0.font = .defaultFont(ofSize: 15, weight: .bold)
      $0.textColor = .white
      containerView.addSubview($0)
    }
  }

  public override func setupConstraints() {
    super.setupConstraints()
    containerView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    nameLabel.snp.makeConstraints {
      $0.leading.equalToSuperview().offset(Metric.spacing * 2)
      $0.top.equalToSuperview().offset(Metric.spacing)
      $0.trailing.equalToSuperview().offset(-Metric.spacing * 2)
      $0.bottom.equalToSuperview().offset(-Metric.spacing)
      $0.width.lessThanOrEqualTo(SkillTagCell.maxWidth)
    }
  }

  public func bind(reactor: SkillTagCellReactor) {
    reactor.state.map { $0.name }
      .distinctUntilChanged()
      .bind(to: nameLabel.rx.text)
      .disposed(by: disposeBag)
  }
}

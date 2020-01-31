//
//  TalentsCell.swift
//  ShareUI
//
//  Created by hb1love on 2020/01/27.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import RxCocoa
import RxSwift
import RxDataSources
import ReactorKit

final class TalentsCell: BaseCollectionViewCell, View {

  // MARK: - Contants

  private struct Metric {
    static let sideInset = 28.f
    static let talentInter = 15.f
  }

  // MARK: - Subviews

  private var talentsCollectionView: UICollectionView!

  // MARK: - Properties

  static var defaultHeight = 68.f

  private lazy var dataSource = RxCollectionViewSectionedReloadDataSource<TalentsCellSection>(
    configureCell: { dataSource, collectionView, indexPath, sectionItem in
      switch sectionItem {
      case .talent(let reactor):
        let cell = collectionView.dequeue(TalentCell.self, for: indexPath)!
        cell.reactor = reactor
        return cell
      }
    }
  )

  override func layoutSubviews() {
    super.layoutSubviews()
    talentsCollectionView.collectionViewLayout.invalidateLayout()
  }

  override func setupSubviews() {
    super.setupSubviews()
    talentsCollectionView = UICollectionView(
      frame: .zero,
      collectionViewLayout: UICollectionViewFlowLayout().also {
        $0.scrollDirection = .horizontal
      }
    ).also {
      $0.showsHorizontalScrollIndicator = false
      $0.backgroundColor = .clear
      $0.register(cell: TalentCell.self)
      contentView.addSubview($0)
    }
  }

  override func setupConstraints() {
    super.setupConstraints()
    talentsCollectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }

  func bind(reactor: TalentsCellReactor) {
    talentsCollectionView.rx
      .setDelegate(self)
      .disposed(by: disposeBag)

    reactor.state.map { $0.sections }
      .bind(to: talentsCollectionView.rx.items(dataSource: dataSource))
      .disposed(by: disposeBag)
  }
}

extension TalentsCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    insetForSectionAt section: Int
  ) -> UIEdgeInsets {
    switch dataSource[section] {
    case .talents:
      return UIEdgeInsets(top: 0, left: Metric.sideInset, bottom: 0, right: Metric.sideInset)
    }
  }

  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int
  ) -> CGFloat {
    Metric.talentInter
  }

  public func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    CGSize(width: TalentCell.defaultWidth, height: collectionView.frame.height)
  }
}

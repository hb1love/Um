//
//  RecommendCategoriesCell.swift
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

final class RecommendCategoriesCell: BaseCollectionViewCell, View {

  // MARK: - Contants

  private struct Metric {
    static let sideInset = 28.f
    static let categoryInter = 12.f
  }

  // MARK: - Subviews

  private var categoriesCollectionView: UICollectionView!

  // MARK: - Properties

  static var defaultHeight = 154.f

  private lazy var dataSource = RxCollectionViewSectionedReloadDataSource<RecommendCategoriesCellSection>(
    configureCell: { dataSource, collectionView, indexPath, sectionItem in
      switch sectionItem {
      case .category(let reactor):
        let cell = collectionView.dequeue(RecommendCategoryCell.self, for: indexPath)!
        cell.reactor = reactor
        return cell
      }
    }
  )

  override func layoutSubviews() {
    super.layoutSubviews()
    categoriesCollectionView.collectionViewLayout.invalidateLayout()
  }

  override func setupSubviews() {
    super.setupSubviews()
    categoriesCollectionView = UICollectionView(
      frame: .zero,
      collectionViewLayout: UICollectionViewFlowLayout().also {
        $0.scrollDirection = .horizontal
      }
    ).also {
      $0.showsHorizontalScrollIndicator = false
      $0.backgroundColor = .clear
      $0.register(cell: RecommendCategoryCell.self)
      contentView.addSubview($0)
    }
  }

  override func setupConstraints() {
    super.setupConstraints()
    categoriesCollectionView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }

  func bind(reactor: RecommendCategoriesCellReactor) {
    categoriesCollectionView.rx
      .setDelegate(self)
      .disposed(by: disposeBag)

    reactor.state.map { $0.sections }
      .bind(to: categoriesCollectionView.rx.items(dataSource: dataSource))
      .disposed(by: disposeBag)
  }
}

extension RecommendCategoriesCell: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    insetForSectionAt section: Int
  ) -> UIEdgeInsets {
    switch dataSource[section] {
    case .categories:
      return UIEdgeInsets(top: 0, left: Metric.sideInset, bottom: 0, right: Metric.sideInset)
    }
  }

  func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int
  ) -> CGFloat {
    Metric.categoryInter
  }

  public func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    CGSize(width: RecommendCategoryCell.defaultWidth, height: collectionView.frame.height)
  }
}

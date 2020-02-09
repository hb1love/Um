//
//  BrowsingViewController.swift
//  ShareUI
//
//  Created by hb1love on 2020/02/08.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import RxCocoa
import RxSwift
import RxDataSources
import ReactorKit

public final class BrowsingViewController: BaseViewController, StoryboardView {

  // MARK: - Constants

  private struct Metric {
    static let spacing = 20.f
    static let column = 2.f
  }

  // MARK: - Subviews

  @IBOutlet weak var searchBar: SearchBar!
  @IBOutlet weak var browsingCollectionView: UICollectionView!

  private lazy var dataSource = RxCollectionViewSectionedReloadDataSource<BrowsingViewSection>(
    configureCell: { dataSource, collectionView, indexPath, sectionItem in
      switch sectionItem {
      case .category(let reactor):
        let cell = collectionView.dequeue(CategoryCell.self, for: indexPath)!
        cell.reactor = reactor
        return cell
      }
    },
    configureSupplementaryView: { dataSource, collectionView, kind, indexPath in
      switch dataSource[indexPath.section] {
      case .categories:
        let headerView = collectionView.dequeue(BrowsingHeaderView.self, kind: kind, for: indexPath)!
        headerView.titleLabel.text = "카테고리"
        return headerView
      }
    }
  )

  public override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    browsingCollectionView.collectionViewLayout.invalidateLayout()
  }

  public override func setupSubviews() {
    super.setupSubviews()
    browsingCollectionView.register(cell: BrowsingHeaderView.self)
    browsingCollectionView.register(cell: CategoryCell.self)
    let collectionEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 44, right: 0)
    browsingCollectionView.contentInset = collectionEdgeInsets
    browsingCollectionView.scrollIndicatorInsets = collectionEdgeInsets
  }

  public func bind(reactor: BrowsingViewReactor) {
    rx.viewWillAppear
      .map { true }
      .bind(to: navigationController!.navigationBar.rx.isHidden)
      .disposed(by: disposeBag)

    browsingCollectionView.rx
      .setDelegate(self)
      .disposed(by: disposeBag)

    reactor.state.map { $0.sections }
      .bind(to: browsingCollectionView.rx.items(dataSource: dataSource))
      .disposed(by: disposeBag)
  }
}

extension BrowsingViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  public func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    insetForSectionAt section: Int
  ) -> UIEdgeInsets {
    switch dataSource[section] {
    case .categories:
      return UIEdgeInsets(top: 0, left: Metric.spacing, bottom: 0, right: Metric.spacing)
    }
  }

  public func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int
  ) -> CGFloat {
    Metric.spacing
  }

  public func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    referenceSizeForHeaderInSection section: Int
  ) -> CGSize {
    CGSize(width: collectionView.frame.width, height: 44)
  }

  public func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    sizeForItemAt indexPath: IndexPath
  ) -> CGSize {
    switch dataSource[indexPath.section] {
    case .categories:
      let totalWidth = collectionView.frame.width
      let eachItemSize = (totalWidth - Metric.spacing * (Metric.column + 1)) / Metric.column
      return CGSize(width: eachItemSize, height: eachItemSize)
    }
  }
}

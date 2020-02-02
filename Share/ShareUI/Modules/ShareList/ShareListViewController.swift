//
//  ShareListViewController.swift
//  ShareUI
//
//  Created by hb1love on 2020/01/13.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import RxCocoa
import RxSwift
import RxDataSources
import ReactorKit

public final class ShareListViewController: BaseViewController, StoryboardView {

  // MARK: - Subviews

  @IBOutlet weak var feedCollectionView: UICollectionView!

  // MARK: - Properties

  var changeTabBar: ((Bool) -> Void)?

  private lazy var dataSource = RxCollectionViewSectionedReloadDataSource<ShareListViewSection>(
    configureCell: { dataSource, collectionView, indexPath, sectionItem in
      switch sectionItem {
      case .hotTalents(let reactor):
        let cell = collectionView.dequeue(TalentsCell.self, for: indexPath)!
        cell.reactor = reactor
        return cell
      case .recommendCategories(let reactor):
        let cell = collectionView.dequeue(RecommendCategoriesCell.self, for: indexPath)!
        cell.reactor = reactor
        return cell
      case .post(let reactor):
        let cell = collectionView.dequeue(PostCell.self, for: indexPath)!
        cell.reactor = reactor
        return cell
      }
    },
    configureSupplementaryView: { dataSource, collectionView, kind, indexPath in
      switch dataSource[indexPath.section] {
      case .hotTalents:
        let headerView = collectionView.dequeue(CollectionHeaderView.self, kind: kind, for: indexPath)!
        headerView.titleLabel.text = "요즘 핫한 재능러"
        return headerView
      case .recommendCategories:
        let headerView = collectionView.dequeue(CollectionHeaderView.self, kind: kind, for: indexPath)!
        headerView.titleLabel.text = "이런 재능은 어때요?"
        return headerView
      case .hotPosts:
        let headerView = collectionView.dequeue(CollectionHeaderView.self, kind: kind, for: indexPath)!
        headerView.titleLabel.text = "인기 게시물"
        return headerView
      }
    }
  )

  public override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    feedCollectionView.collectionViewLayout.invalidateLayout()
  }

  public override func setupSubviews() {
    super.setupSubviews()
    feedCollectionView.register(cell: CollectionHeaderView.self)
    feedCollectionView.register(cell: TalentsCell.self)
    feedCollectionView.register(cell: RecommendCategoriesCell.self)
    feedCollectionView.register(cell: PostCell.self)
    let collectionEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 44, right: 0)
    feedCollectionView.contentInset = collectionEdgeInsets
    feedCollectionView.scrollIndicatorInsets = collectionEdgeInsets
  }

  public func bind(reactor: ShareListViewReactor) {
    rx.viewWillAppear
      .map { true }
      .bind(to: navigationController!.navigationBar.rx.isHidden)
      .disposed(by: disposeBag)

    rx.viewWillAppear
      .map { .refresh }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    feedCollectionView.rx
      .setDelegate(self)
      .disposed(by: disposeBag)

    reactor.state.map { $0.sections }
      .bind(to: feedCollectionView.rx.items(dataSource: dataSource))
      .disposed(by: disposeBag)
  }
}

extension ShareListViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  public func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    insetForSectionAt section: Int
  ) -> UIEdgeInsets {
    switch dataSource[section] {
    case .hotTalents:
      return UIEdgeInsets(top: 12, left: 0, bottom: 25, right: 0)
    case .recommendCategories:
      return UIEdgeInsets(top: 2, left: 0, bottom: 22, right: 0)
    case .hotPosts:
      return .zero
    }
  }

  public func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int
  ) -> CGFloat {
    4
  }

  public func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumInteritemSpacingForSectionAt section: Int
  ) -> CGFloat {
    10
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
    case .hotTalents:
      return CGSize(width: collectionView.frame.width, height: TalentsCell.defaultHeight)
    case .recommendCategories:
      return CGSize(width: collectionView.frame.width, height: RecommendCategoriesCell.defaultHeight)
    case .hotPosts:
      return CGSize(width: collectionView.frame.width, height: PostCell.defaultHeight)
    }
  }
}

extension ShareListViewController: UIScrollViewDelegate {
  public func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let hidden = scrollView.panGestureRecognizer.translation(in: scrollView).y < 0
    changeTabBar?(hidden)
  }
}

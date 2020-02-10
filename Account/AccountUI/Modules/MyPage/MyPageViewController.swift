//
//  MyPageViewController.swift
//  AccountUI
//
//  Created by hb1love on 2020/01/20.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import RxCocoa
import RxSwift
import RxDataSources
import ReactorKit

public final class MyPageViewController: BaseViewController, StoryboardView {

  // MARK: - Constants

  private struct Metric {
    static let defaultHeaderHeight = 44.f
    static let leading = 20.f
  }

  // MARK: - Subviews

  @IBOutlet weak var myPageCollectionView: UICollectionView!

  // MARK: - Properties

  var didLogout: (() -> Void)?

  private lazy var dataSource = RxCollectionViewSectionedReloadDataSource<MyPageViewSection>(
    configureCell: { dataSource, collectionView, indexPath, sectionItem in
      switch sectionItem {
      case .profile(let reactor):
        let cell = collectionView.dequeue(ProfileCell.self, for: indexPath)!
        cell.reactor = reactor
        return cell
      case .introduce:
        let cell = collectionView.dequeue(IntroduceCell.self, for: indexPath)!
        //        cell.reactor = reactor
        return cell
      case .skill(let reactor):
        let cell = collectionView.dequeue(SkillTagCell.self, for: indexPath)!
        cell.reactor = reactor
        return cell
      }
    },
    configureSupplementaryView: { dataSource, collectionView, kind, indexPath in
      switch dataSource[indexPath.section] {
      case .profile:
        let headerView = collectionView.dequeue(MyPageHeaderView.self, kind: kind, for: indexPath)!
        return headerView
      case .introduce:
        let headerView = collectionView.dequeue(MyPageHeaderView.self, kind: kind, for: indexPath)!
        headerView.titleLabel.text = "자기소개"
        return headerView
      case .mySkills:
        let headerView = collectionView.dequeue(MyPageHeaderView.self, kind: kind, for: indexPath)!
        headerView.titleLabel.text = "가지고 있는 재능"
        return headerView
      case .wannaSkills:
        let headerView = collectionView.dequeue(MyPageHeaderView.self, kind: kind, for: indexPath)!
        headerView.titleLabel.text = "원하는 재능"
        return headerView
      }
    }
  )

  public override func viewWillLayoutSubviews() {
    super.viewWillLayoutSubviews()
    myPageCollectionView.collectionViewLayout.invalidateLayout()
  }

  public override func setupSubviews() {
    super.setupSubviews()
    myPageCollectionView.register(cell: MyPageHeaderView.self)
    myPageCollectionView.register(cell: ProfileCell.self)
    myPageCollectionView.register(cell: IntroduceCell.self)
    myPageCollectionView.register(cell: SkillTagCell.self)
    let collectionEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 44, right: 0)
    myPageCollectionView.contentInset = collectionEdgeInsets
    myPageCollectionView.scrollIndicatorInsets = collectionEdgeInsets
  }

  public override func setupConstraints() {
    super.setupConstraints()
    ProfileCell.defaultWidth = view.frame.width
  }

  public func bind(reactor: MyPageViewReactor) {
    rx.viewWillAppear
      .map { true }
      .bind(to: navigationController!.navigationBar.rx.isHidden)
      .disposed(by: disposeBag)

    rx.viewWillAppear
      .map { .refresh }
      .bind(to: reactor.action)
      .disposed(by: disposeBag)

    myPageCollectionView.rx
      .setDelegate(self)
      .disposed(by: disposeBag)

    reactor.state.map { $0.sections }
      .bind(to: myPageCollectionView.rx.items(dataSource: dataSource))
      .disposed(by: disposeBag)
  }
}

extension MyPageViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

  public func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    insetForSectionAt section: Int
  ) -> UIEdgeInsets {
    switch dataSource[section] {
    case .profile:
      return .zero
    case .introduce:
      return UIEdgeInsets(top: 0, left: Metric.leading, bottom: 30, right: Metric.leading)
    case .mySkills:
      return UIEdgeInsets(top: 0, left: Metric.leading, bottom: 39, right: Metric.leading)
    case .wannaSkills:
      return UIEdgeInsets(top: 0, left: Metric.leading, bottom: 39, right: Metric.leading)
    }
  }

  public func collectionView(
    _ collectionView: UICollectionView,
    layout collectionViewLayout: UICollectionViewLayout,
    minimumLineSpacingForSectionAt section: Int
  ) -> CGFloat {
    10
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
    switch dataSource[section] {
    case .profile:
      return .zero
    default:
      return CGSize(width: collectionView.frame.width, height: Metric.defaultHeaderHeight)
    }
  }

//  public func collectionView(
//    _ collectionView: UICollectionView,
//    layout collectionViewLayout: UICollectionViewLayout,
//    sizeForItemAt indexPath: IndexPath
//  ) -> CGSize {

//    return .zero
//    switch dataSource[indexPath.section] {
//    case .profile:
//      return CGSize(width: collectionView.frame.width, height: 100)
//    case .introduce:
//      return CGSize(width: collectionView.frame.width, height: 44)
//    case .mySkills:
//      return CGSize(width: collectionView.frame.width, height: 44)
//    case .wannaSkills:
////      return CGSize(width: collectionView.frame.width, height: 44)
//      switch dataSource[indexPath.section].items[indexPath.row] {
//      case .skill(let reactor):
//        configureCell(cell: sizingCell!, reactor: reactor)
//        return self.sizingCell!.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
//      default:
//        return .zero
////      }
//    }
//  }
//
//  func configureCell(cell: SkillTagCell, reactor: SkillTagCellReactor) {
//    cell.nameLabel.text = reactor.skill.rawValue
//  }
}

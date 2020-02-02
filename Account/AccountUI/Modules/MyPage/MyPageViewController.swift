//
//  MyPageViewController.swift
//  AccountUI
//
//  Created by hb1love on 2020/01/20.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import Common
import ReactorKit
import SnapKit
import RxSwift
import RxCocoa

public final class MyPageViewController: BaseViewController, StoryboardView {

  // MARK: - Subviews

  private var logoutButton: UIButton!

  // MARK: - Properties

  var didLogout: (() -> Void)?

//  public override func viewDidLoad() {
//    super.viewDidLoad()
//  }

  public override func setupSubviews() {
    logoutButton = UIButton().also {
      $0.backgroundColor = .gray
      $0.setTitle("로그아웃", for: .normal)
//      view.addSubview($0)
    }
  }

  public override func setupConstraints() {
//    logoutButton.snp.makeConstraints {
//      $0.leading.top.equalToSuperview().offset(100)
//      $0.size.equalTo(CGSize(width: 50, height: 50))
//    }
  }

  public func bind(reactor: MyPageViewReactor) {
//    logoutButton.rx.tap
//      .subscribe(onNext: { [weak self] in
//        self?.didLogout?()
//      }).disposed(by: disposeBag)
  }
}

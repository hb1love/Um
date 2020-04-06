//
//  LoginViewController.swift
//  AccountUI
//
//  Created by hb1love on 2020/02/02.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit
import AuthenticationServices
import Common
import KakaoOpenSDK
import ReactorKit
import SnapKit
import RxCocoa
import RxGesture
import RxSwift

public final class LoginViewController: BaseViewController, StoryboardView {

  // MARK: - Constants

  private struct Metric {
    static let buttonWidth = 288
    static let buttonHeight = 48
  }

  // MARK: - Subviews

  @IBOutlet weak var loginProviderStackView: UIStackView!
  var appleLogin: AppleLogin!
  @IBOutlet weak var kakaoLogin: LoginButton!
  @IBOutlet weak var noLogin: UILabel!

  // MARK: - Properties

  var onFinish: ((_ loggedIn: Bool) -> Void)?
  var showSignUp: ((_ authProvider: AuthProvider) -> Void)?

  public override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    return .portrait
  }

  public override func setupSubviews() {
    appleLogin = AppleLogin(type: .signIn, style: .black).also {
      $0.cornerRadius = 12
      loginProviderStackView.insertArrangedSubview($0, at: 0)
    }
  }

  public override func setupConstraints() {
    appleLogin.snp.makeConstraints {
      $0.width.equalTo(Metric.buttonWidth)
      $0.height.equalTo(Metric.buttonHeight)
    }
  }

  public func bind(reactor: LoginViewReactor) {
    appleLogin.rx.tapGesture()
      .when(.recognized)
      .debounce(0.5, scheduler: MainScheduler.instance)
      .subscribe(onNext: { [weak self] _ in
        self?.handleAppleLoginRequest()
      }).disposed(by: disposeBag)

    kakaoLogin.rx.tapGesture()
      .when(.recognized)
      .debounce(0.5, scheduler: MainScheduler.instance)
      .subscribe(onNext: { [weak self] _ in
        self?.handleKakaoLoginRequest()
      }).disposed(by: disposeBag)

    noLogin.rx.tapGesture()
      .when(.recognized)
      .debounce(0.5, scheduler: MainScheduler.instance)
      .subscribe(onNext: { [weak self] _ in
        self?.handleNoLoginRequest()
      }).disposed(by: disposeBag)

    reactor.state.map { $0.event }
      .observeOn(MainScheduler.instance)
      .subscribe(onNext: { [weak self] event in
        switch event {
        case .authorized:
          self?.onFinish?(true)
        case .needSignUp(let authProvider):
          self?.showSignUp?(authProvider)
        default:
          break
        }
      }).disposed(by: disposeBag)
  }

  func handleNoLoginRequest() {
    onFinish?(false)
  }
}

// MARK: - Apple SignIn

extension LoginViewController: ASAuthorizationControllerDelegate {

  func handleAppleLoginRequest() {
    let appleIDProvider = ASAuthorizationAppleIDProvider()
    let request = appleIDProvider.createRequest()
    request.requestedScopes = [.fullName, .email]

    let authorizationController = ASAuthorizationController(authorizationRequests: [request])
    authorizationController.delegate = self
    authorizationController.presentationContextProvider = self
    authorizationController.performRequests()
  }

  public func authorizationController(
    controller: ASAuthorizationController,
    didCompleteWithAuthorization authorization: ASAuthorization
  ) {
    guard
      let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential
      else { return }

    let userIdentifier = appleIDCredential.user
    let appleIDProvider = ASAuthorizationAppleIDProvider()
    appleIDProvider.getCredentialState(forUserID: userIdentifier) { (credentialState, error) in
      switch credentialState {
      case .authorized:
        // The Apple ID credential is valid. Show Home UI Here
       break
      case .revoked:
        // The Apple ID credential is revoked. Show SignIn UI Here.
        break
      case .notFound:
        // No credential was found. Show SignIn UI Here.
        break
      default:
        break
      }
    }
  }

  public func authorizationController(
    controller: ASAuthorizationController,
    didCompleteWithError error: Error
  ) {
    guard let error = error as? ASAuthorizationError else { return }
    switch error.code {
    case .canceled:
        print("Canceled")
    case .unknown:
        print("Unknown")
    case .invalidResponse:
        print("Invalid Respone")
    case .notHandled:
        print("Not handled")
    case .failed:
        print("Failed")
    default:
        print("Default")
    }
  }
}

extension LoginViewController: ASAuthorizationControllerPresentationContextProviding {
  public func presentationAnchor(
    for controller: ASAuthorizationController
  ) -> ASPresentationAnchor {
    return self.view.window!
  }
}

// MARK: - Kakao SignIn

extension LoginViewController {
  func handleKakaoLoginRequest() {
    guard let session = KOSession.shared() else {
      log.debug("Invalid kakao session")
      return
    }

    if session.isOpen() {
      session.close()
    }

    session.open { error in
      guard session.isOpen(), let accessToken = session.token?.accessToken else {
        log.debug("Invoked kakao login")
        return
      }

      KOSessionTask.userMeTask { [weak self] (error, me) in
        if let error = error {
          log.debug("Failed to fetch kakao profile", error.localizedDescription)
          return
        }

        guard let me = me, let id = me.id, let email = me.account?.email else {
          log.debug("Failed to fetch kakao profile")
          return
        }

        let authProvider = AuthProvider.kakao((id: id, accessToken: accessToken, email: email))
        self?.reactor?.action.onNext(.kakaoLogin(authProvider))
      }
    }
  }
}

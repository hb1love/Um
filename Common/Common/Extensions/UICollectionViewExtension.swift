//
//  UICollectionViewExtension.swift
//  SeasonsBase
//
//  Created by hb1love on 2020/01/30.
//  Copyright © 2020 seasons. All rights reserved.
//

import UIKit

public extension UICollectionView {
  func register<Cell>(
    cell: Cell.Type,
    forCellReuseIdentifier reuseIdentifier: String = Cell.reuseIdentifier
  ) where Cell: UICollectionViewCell {
    register(cell, forCellWithReuseIdentifier: reuseIdentifier)
  }

  func register<Cell>(
    cell: Cell.Type,
    forCellReuseIdentifier reuseIdentifier: String = Cell.reuseIdentifier
  ) where Cell: UICollectionReusableView {
    register(cell, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseIdentifier)
  }

  func dequeue<Cell>(_ reusableCell: Cell.Type, for indexPath: IndexPath) -> Cell? where Cell: UICollectionViewCell {
    return dequeueReusableCell(withReuseIdentifier: reusableCell.reuseIdentifier, for: indexPath) as? Cell
  }

  func dequeue<Cell>(_ reusableCell: Cell.Type, kind: String, for indexPath: IndexPath) -> Cell? where Cell: UICollectionReusableView {
    return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reusableCell.reuseIdentifier, for: indexPath) as? Cell
  }
}

extension UICollectionReusableView: Reusable {}

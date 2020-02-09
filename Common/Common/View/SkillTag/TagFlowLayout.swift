//
//  TagFlowLayout.swift
//  Common
//
//  Created by hb1love on 2020/02/09.
//  Copyright © 2020 depromeet. All rights reserved.
//

import UIKit

public class TagFlowLayout: UICollectionViewFlowLayout {
  public override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
    guard let attributesForElements = super.layoutAttributesForElements(in: rect) else { return nil }
    var newAttributes = [UICollectionViewLayoutAttributes]()
    // use a value to keep track of left margin
    var leftMargin: CGFloat = 0.0
    for attributes in attributesForElements {
      let refAttributes = attributes
      // assign value if next row
      if refAttributes.frame.origin.x == self.sectionInset.left {
        leftMargin = self.sectionInset.left
      } else {
        // set x position of attributes to current margin
        var newLeftAlignedFrame = refAttributes.frame
        newLeftAlignedFrame.origin.x = leftMargin
        refAttributes.frame = newLeftAlignedFrame
      }
      // calculate new value for current margin
      leftMargin += refAttributes.frame.size.width + 10
      newAttributes.append(refAttributes)
    }
    return newAttributes
  }
}

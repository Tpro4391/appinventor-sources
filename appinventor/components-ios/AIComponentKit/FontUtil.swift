// -*- mode: swift; swift-mode:basic-offset: 2; -*-
// Copyright © 2018 Massachusetts Institute of Technology, All rights reserved.

import Foundation

func getFontTrait(font: UIFont?, trait: UIFontDescriptorSymbolicTraits, shouldSet: Bool) -> UIFont? {
  var fontDescriptor: UIFontDescriptor?
  if let tempDescriptor = font?.fontDescriptor {
    var fontOps = tempDescriptor.symbolicTraits
    if shouldSet {
      fontOps.insert(trait)
    } else {
      fontOps.remove(trait)
    }
    fontDescriptor = tempDescriptor.withSymbolicTraits(fontOps)
  }
  if let size = font?.pointSize, let descriptor = fontDescriptor {
    return UIFont(descriptor: descriptor, size: size)
  } else {
    return font
  }
}

func getFontTypeface(font: UIFont?, typeFace: Typeface) -> UIFont? {
  if let descriptor = font?.fontDescriptor, let size = font?.pointSize {
    var tempDescriptor: UIFontDescriptor
    switch typeFace {
    case .normal, .sansSerif:
      return UIFont(descriptor: descriptor, size: size)
    case .monospace:
      tempDescriptor = UIFontDescriptor(name: "Menlo", size: size)
      break
    case .serif:
      tempDescriptor = UIFontDescriptor(name: "Cochin", size: size)
      break
    }
    if let newDescriptor = tempDescriptor.withSymbolicTraits(descriptor.symbolicTraits) {
      return UIFont(descriptor: newDescriptor, size: size)
    } else {
      return font
    }
  } else {
    return font
  }
}

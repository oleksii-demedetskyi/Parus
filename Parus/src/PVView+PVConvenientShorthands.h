//
//  PVView+PVConvenientShorthands.h
//  Parus
//
//  Created by nekoi on 7/5/14.
//
//

#import "PVLayout.h"

#if TARGET_OS_IPHONE
    #define PVViewClass UIView
#elif TARGET_OS_MAC
    #define PVViewClass NSView
#else
    #error Can't identify platform to pick correct View class
#endif


/// convinient shorthands category to UIView/NSView
@interface PVViewClass (PVConvenientShorthands)

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeLeft
- (_PVLocationRelationSelect*)pv_left;

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeRight
- (_PVLocationRelationSelect*)pv_right;

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeTop
- (_PVLocationRelationSelect*)pv_top;

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeBottom
- (_PVLocationRelationSelect*)pv_bottom;

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeLeading
- (_PVLocationRelationSelect*)pv_leading;

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeTrailing
- (_PVLocationRelationSelect*)pv_trailing;

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeWidth
- (_PVRelationSelect*)pv_width;

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeHeight
- (_PVRelationSelect*)pv_height;

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeCenterX
- (_PVLocationRelationSelect*)pv_centerX;

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeCenterY
- (_PVLocationRelationSelect*)pv_centerY;

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeBaseline
- (_PVLocationRelationSelect*)pv_baseline;

@end

#undef PVViewClass

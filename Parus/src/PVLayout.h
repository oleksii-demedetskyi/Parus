//
//  PVLayout.h
//  Parus
//
//  Created by NekOI on 8/15/13.
//
//

#import <Foundation/Foundation.h>

@protocol _PVLocationRelationSelect, _PVRelationSelect;

@interface id_PVRelationSelect @end
typedef id_PVRelationSelect<_PVRelationSelect> _PVRelationSelect;

@interface id_PVLocationRelationSelect @end
typedef id_PVLocationRelationSelect<_PVLocationRelationSelect> _PVLocationRelationSelect;

/// Single constraint definition could be found on wiki: https://github.com/DAlOG/Parus/wiki/Single-constraint-syntax-definition

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeLeft
_PVLocationRelationSelect* PVLeftOf(UIView*);

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeRight
_PVLocationRelationSelect* PVRightOf(UIView*);

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeTop
_PVLocationRelationSelect* PVTopOf(UIView*);

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeBottom
_PVLocationRelationSelect* PVBottomOf(UIView*);

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeLeading
_PVLocationRelationSelect* PVLeadingOf(UIView*);

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeTrailing
_PVLocationRelationSelect* PVTrailingOf(UIView*);

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeWidth
_PVRelationSelect* PVWidthOf(UIView*);

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeHeight
_PVRelationSelect* PVHeightOf(UIView*);

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeCenterX
_PVLocationRelationSelect* PVCenterXOf(UIView*);

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeCenterY
_PVLocationRelationSelect* PVCenterYOf(UIView*);

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeBaseline
_PVLocationRelationSelect* PVBaselineOf(UIView*);


@protocol _PVRelationPart;

@interface id_PVRelationPart @end
typedef id_PVRelationPart<_PVRelationPart> _PVRelationPart;

/// Protocol for handling relationships in size contraints.
/// Format example: view1.(width|height) RELATIONSHIP(==,<=,>=) view2.(width|height) OR constant.

@protocol _PVRelationSelect

/// constraint.relation = NSLayoutRelationEqual
@property (readonly) _PVRelationPart* equalTo;

/// constraint.relation = NSLayoutRelationGreaterThanOrEqual
@property (readonly) _PVRelationPart* moreThan;

/// constraint.relation = NSLayoutRelationLessThanOrEqual
@property (readonly) _PVRelationPart* lessThan;

@end



@protocol _PVLocationRelationPart;

@interface id_PVLocationRelationPart @end
typedef id_PVLocationRelationPart<_PVLocationRelationPart> _PVLocationRelationPart;

@protocol _PVLocationRelationSelect

/// constraint.relation = NSLayoutRelationEqual
@property (readonly) _PVLocationRelationPart* equalTo;

/// constraint.relation = NSLayoutRelationGreaterThanOrEqual
@property (readonly) _PVLocationRelationPart* moreThan;

/// constraint.relation = NSLayoutRelationLessThanOrEqual
@property (readonly) _PVLocationRelationPart* lessThan;

@end



@protocol _PVRightHandPart, _PVConstantPart;

@interface id_PVRightHandPart @end
typedef id_PVRightHandPart<_PVRightHandPart> _PVRightHandPart;

@interface id_PVConstantPart @end
typedef id_PVConstantPart<_PVConstantPart> _PVConstantPart;

typedef _PVRightHandPart*(^_PVRightHandViewBlock)(UIView*);
typedef _PVConstantPart*(^_PVConstantBlock)(CGFloat);

@protocol _PVLocationRelationPart

/// constraint.secondItem = view
/// constraint.secondAttribute = NSLayoutAttributeLeft
@property (readonly) _PVRightHandViewBlock leftOf;

/// constraint.secondItem = view
/// constraint.secondAttribute = NSLayoutAttributeRight
@property (readonly) _PVRightHandViewBlock rightOf;

/// constraint.secondItem = view
/// constraint.secondAttribute = NSLayoutAttributeTop
@property (readonly) _PVRightHandViewBlock topOf;

/// constraint.secondItem = view
/// constraint.secondAttribute = NSLayoutAttributeBottom
@property (readonly) _PVRightHandViewBlock bottomOf;

/// constraint.secondItem = view
/// constraint.secondAttribute = NSLayoutAttributeLeading
@property (readonly) _PVRightHandViewBlock leadingOf;

/// constraint.secondItem = view
/// constraint.secondAttribute = NSLayoutAttributeTrailing
@property (readonly) _PVRightHandViewBlock trailingOf;

/// constraint.secondItem = view
/// constraint.secondAttribute = NSLayoutAttributeCenterX
@property (readonly) _PVRightHandViewBlock centerXOf;

/// constraint.secondItem = view
/// constraint.secondAttribute = NSLayoutAttributeCenterY
@property (readonly) _PVRightHandViewBlock centerYOf;

/// constraint.secondItem = view
/// constraint.secondAttribute = NSLayoutAttributeBaseline
@property (readonly) _PVRightHandViewBlock baselineOf;

@end

/// Protocol for handling secondItem and secondAttribute of size contraints
@protocol _PVRelationPart

/// constraint.secondItem = view
/// constraint.secondAttribute = NSLayoutAttributeWidth
@property (readonly) _PVRightHandViewBlock widthOf;

/// constraint.secondItem = view
/// constraint.secondAttribute = NSLayoutAttributeHeight
@property (readonly) _PVRightHandViewBlock heightOf;

/// constraint.secondItem = nil
/// constraint.secondAttribute = NSLayoutAttributeNotAnAttribute
/// constraint.constant = value
@property (readonly) _PVConstantBlock constant;

@end



@protocol _PVConstrainable, _PVMultiplierPart;

@interface id_PVConstrainable @end
typedef id_PVConstrainable<_PVConstrainable> _PVConstrainable;

@interface id_PVMultiplierPart @end
typedef id_PVMultiplierPart<_PVMultiplierPart> _PVMultiplierPart;

typedef _PVConstrainable*(^_PVPriorityBlock)(UILayoutPriority);
typedef _PVMultiplierPart*(^_PVMultiplierBlock)(CGFloat);

@protocol _PVRightHandPart <_PVMultiplierPart>

/// constraint.multiplier = value
@property (readonly) _PVMultiplierBlock multipliedTo;

@end



@protocol _PVMultiplierPart <_PVConstantPart>

/// constraint.constant = + (value).
@property (readonly) _PVConstantBlock plus;

/// constraint.constant = - (value).
@property (readonly) _PVConstantBlock minus;

@end



@protocol _PVConstantPart <_PVConstrainable>

/// constraint.priority = UILayoutPriority (value).
@property (readonly) _PVPriorityBlock withPriority;

@end


/// Protocol for building constraint.
@protocol _PVConstrainable

/// New constraint will be created on each property access.
/// Constraint is created by calling following method with collected values:
///
///  [NSLayoutConstraint constraintWithItem:firstItem
///                               attribute:firstAttribute
///                               relatedBy:relation
///                                  toItem:secondItem
///                               attribute:secondAttribute
///                              multiplier:multiplier
///                                constant:constant];
///
@property (readonly) NSLayoutConstraint* asConstraint;

@end

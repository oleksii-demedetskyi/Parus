//
//  PVLayout.h
//  Parus
//
//  Created by NekOI on 8/15/13.
//
//

@import Foundation;
#import <Parus/PVUtilities.h>
#import <Parus/PVRoot.h>

@protocol _PVLocationRelationSelect, _PVRelationSelect;

typedef _PVRoot<_PVRelationSelect> _PVRelationSelect;
typedef _PVRoot<_PVLocationRelationSelect> _PVLocationRelationSelect;

/// Single constraint definition could be found on wiki: https://github.com/DAlOG/Parus/wiki/Single-constraint-syntax-definition

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeLeft
_PVLocationRelationSelect* PVLeftOf(PVView*);

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeRight
_PVLocationRelationSelect* PVRightOf(PVView*);

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeTop
_PVLocationRelationSelect* PVTopOf(PVView*);

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeBottom
_PVLocationRelationSelect* PVBottomOf(PVView*);

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeLeading
_PVLocationRelationSelect* PVLeadingOf(PVView*);

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeTrailing
_PVLocationRelationSelect* PVTrailingOf(PVView*);

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeWidth
_PVRelationSelect* PVWidthOf(PVView*);

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeHeight
_PVRelationSelect* PVHeightOf(PVView*);

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeCenterX
_PVLocationRelationSelect* PVCenterXOf(PVView*);

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeCenterY
_PVLocationRelationSelect* PVCenterYOf(PVView*);

/// constraint.firstItem = view
/// constraint.firstAttribute = NSLayoutAttributeBaseline
_PVLocationRelationSelect* PVBaselineOf(PVView*);



#pragma mark -

@protocol _PVRelationPart;

typedef _PVRoot<_PVRelationPart> _PVRelationPart;

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

typedef _PVRoot<_PVLocationRelationPart> _PVLocationRelationPart;

@protocol _PVLocationRelationSelect

/// constraint.relation = NSLayoutRelationEqual
@property (readonly) _PVLocationRelationPart* equalTo;

/// constraint.relation = NSLayoutRelationGreaterThanOrEqual
@property (readonly) _PVLocationRelationPart* moreThan;

/// constraint.relation = NSLayoutRelationLessThanOrEqual
@property (readonly) _PVLocationRelationPart* lessThan;

@end



@protocol _PVRightHandPart, _PVConstantPart;

typedef _PVRoot<_PVRightHandPart> _PVRightHandPart;
typedef _PVRoot<_PVConstantPart> _PVConstantPart;

typedef _PVRightHandPart*(^_PVRightHandViewBlock)(PVView*);
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

typedef _PVRoot<_PVConstrainable> _PVConstrainable;
typedef _PVRoot<_PVMultiplierPart> _PVMultiplierPart;

typedef _PVConstrainable*(^_PVPriorityBlock)(PVLayoutPriority);
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

/// constraint.priority = PVLayoutPriority (value).
@property (readonly) _PVPriorityBlock withPriority;

@end


typedef void(^_PVAddToViewBlock)(PVView*);

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

/// Build constraint and add it to view
@property (readonly) _PVAddToViewBlock addToView;

@end

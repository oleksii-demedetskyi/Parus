//
//  PVLayout.h
//  Parus
//
//  Created by NekOI on 8/15/13.
//
//

#import <Foundation/Foundation.h>

@protocol _PVLocationRelationSelect, _PVRelationSelect;

// Single constraint definition could be found on wiki: https://github.com/DAlOG/Parus/wiki/Single-constraint-syntax-definition
//
// Constraint format: "view1.attr1 = view2.attr2 * multiplier + constant".

// view1 is set to passed UIView object.
// attr1 is set to NSLayoutAttributeLeft.
NSObject<_PVLocationRelationSelect>* PVLeftOf(UIView*);

// view1 is set to passed UIView object.
// attr1 is set to NSLayoutAttributeRight.
NSObject<_PVLocationRelationSelect>* PVRightOf(UIView*);

// view1 is set to passed UIView object.
// attr1 is set to NSLayoutAttributeTop.
NSObject<_PVLocationRelationSelect>* PVTopOf(UIView*);

// view1 is set to passed UIView object.
// attr1 is set to NSLayoutAttributeBottom.
NSObject<_PVLocationRelationSelect>* PVBottomOf(UIView*);

// view1 is set to passed UIView object.
// attr1 is set to NSLayoutAttributeLeading.
NSObject<_PVLocationRelationSelect>* PVLeadingOf(UIView*);

// view1 is set to passed UIView object.
// attr1 is set to NSLayoutAttributeTrailing.
NSObject<_PVLocationRelationSelect>* PVTrailingOf(UIView*);

// view1 is set to passed UIView object.
// attr1 is set to NSLayoutAttributeWidth.
NSObject<_PVRelationSelect>* PVWidthOf(UIView*);

// view1 is set to passed UIView object.
// attr1 is set to NSLayoutAttributeHeight.
NSObject<_PVRelationSelect>* PVHeightOf(UIView*);

// view1 is set to passed UIView object.
// attr1 is set to NSLayoutAttributeCenterX.
NSObject<_PVLocationRelationSelect>* PVCenterXOf(UIView*);

// view1 is set to passed UIView object.
// attr1 is set to NSLayoutAttributeCenterY.
NSObject<_PVLocationRelationSelect>* PVCenterYOf(UIView*);

// view1 is set to passed UIView object.
// attr1 is set to NSLayoutAttributeBaseline.
NSObject<_PVLocationRelationSelect>* PVBaselineOf(UIView*);


@protocol _PVRelationPart;

// Protocol for handling relationships in size contraints.
// Format example: view1.(width|height) RELATIONSHIP(==,<=,>=) view2.(width|height) OR constant.
@protocol _PVRelationSelect <NSObject>

// Relationship is set to NSLayoutRelationEqual.
@property (readonly) NSObject<_PVRelationPart>* equalTo;

// Relationship is set to NSLayoutRelationGreaterThanOrEqual.
@property (readonly) NSObject<_PVRelationPart>* moreThan;

// Relationship is set to NSLayoutRelationLessThanOrEqual.
@property (readonly) NSObject<_PVRelationPart>* lessThan;

@end



@protocol _PVLocationRelationPart;

@protocol _PVLocationRelationSelect <NSObject>

// Relationship is set to NSLayoutRelationEqual
@property (readonly) NSObject<_PVLocationRelationPart>* equalTo;

// Relationship is set to NSLayoutRelationGreaterThanOrEqual
@property (readonly) NSObject<_PVLocationRelationPart>* moreThan;

// Relationship is set to NSLayoutRelationLessThanOrEqual
@property (readonly) NSObject<_PVLocationRelationPart>* lessThan;

@end



@protocol _PVRightHandPart, _PVConstantPart;

typedef NSObject<_PVRightHandPart>*(^_PVRightHandViewBlock)(UIView*);
typedef NSObject<_PVConstantPart>*(^_PVConstantBlock)(CGFloat);

@protocol _PVLocationRelationPart <NSObject>

// view2 is set to passed UIView object.
// attr2 is set to NSLayoutAttributeLeft.
@property (readonly) _PVRightHandViewBlock leftOf;

// view2 is set to passed UIView object.
// attr2 is set to NSLayoutAttributeRight.
@property (readonly) _PVRightHandViewBlock rightOf;

// view2 is set to passed UIView object.
// attr2 is set to NSLayoutAttributeTop.
@property (readonly) _PVRightHandViewBlock topOf;

// view2 is set to passed UIView object.
// attr2 is set to NSLayoutAttributeBottom.
@property (readonly) _PVRightHandViewBlock bottomOf;

// view2 is set to passed UIView object.
// attr2 is set to NSLayoutAttributeLeading.
@property (readonly) _PVRightHandViewBlock leadingOf;

// view2 is set to passed UIView object.
// attr2 is set to NSLayoutAttributeTrailing.
@property (readonly) _PVRightHandViewBlock trailingOf;

// view2 is set to passed UIView object.
// attr2 is set to NSLayoutAttributeCenterX.
@property (readonly) _PVRightHandViewBlock centerXOf;

// view2 is set to passed UIView object.
// attr2 is set to NSLayoutAttributeCenterY.
@property (readonly) _PVRightHandViewBlock centerYOf;

// view2 is set to passed UIView object.
// attr2 is set to NSLayoutAttributeBaseline.
@property (readonly) _PVRightHandViewBlock baselineOf;

@end

// Protocol for handling view2 and attr2 of size contraints
@protocol _PVRelationPart <NSObject>

// view2 is set to passed UIView object.
// attr2 is set to NSLayoutAttributeWidth.
@property (readonly) _PVRightHandViewBlock widthOf;

// view2 is set to passed UIView object.
// attr2 is set to NSLayoutAttributeWidth.
@property (readonly) _PVRightHandViewBlock heightOf;

// view2 is set to nil.
// attr2 is set to NSLayoutAttributeNotAnAttribute.
// constant is set to passed CGFloat.
@property (readonly) _PVConstantBlock constant;

@end



@protocol _PVConstrainable, _PVMultiplierPart;

typedef NSObject<_PVConstrainable>*(^_PVPriorityBlock)(UILayoutPriority);
typedef NSObject<_PVMultiplierPart>*(^_PVMultiplierBlock)(CGFloat);

@protocol _PVRightHandPart <_PVMultiplierPart>

// multiplier is set to passed CGFloat.
@property (readonly) _PVMultiplierBlock multipliedTo;

@end



@protocol _PVMultiplierPart <_PVConstantPart>

// constant is set to passed CGFloat value with sign +.
@property (readonly) _PVConstantBlock plus;

// constant is set to passed CGFloat value with sign -.
@property (readonly) _PVConstantBlock minus;

@end



@protocol _PVConstantPart <_PVConstrainable>

// priority for constraint is set to passed UILayoutPriority value.
@property (readonly) _PVPriorityBlock withPriority;

@end


// Protocol for building constraint.
@protocol _PVConstrainable <NSObject>

// Returns NSLayoutConstraint object.
@property (readonly) NSLayoutConstraint* asConstraint;

@end

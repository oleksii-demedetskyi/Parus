//
//  PVLayout.h
//  Parus
//
//  Created by NekOI on 8/15/13.
//
//

#import <Foundation/Foundation.h>

@protocol _PVLocationRelationSelect, _PVRelationSelect;

NSObject<_PVLocationRelationSelect>* PVLeftOf(UIView*);
NSObject<_PVLocationRelationSelect>* PVRightOf(UIView*);
NSObject<_PVLocationRelationSelect>* PVTopOf(UIView*);
NSObject<_PVLocationRelationSelect>* PVBottomOf(UIView*);
NSObject<_PVLocationRelationSelect>* PVLeadingOf(UIView*);
NSObject<_PVLocationRelationSelect>* PVTrailingOf(UIView*);
NSObject<_PVRelationSelect>* PVWidthOf(UIView*);
NSObject<_PVRelationSelect>* PVHeightOf(UIView*);
NSObject<_PVLocationRelationSelect>* PVCenterXOf(UIView*);
NSObject<_PVLocationRelationSelect>* PVCenterYOf(UIView*);
NSObject<_PVLocationRelationSelect>* PVBaselineOf(UIView*);



@protocol _PVRelationPart;

@protocol _PVRelationSelect <NSObject>

@property (readonly) NSObject<_PVRelationPart>* equalTo;
@property (readonly) NSObject<_PVRelationPart>* moreThan;
@property (readonly) NSObject<_PVRelationPart>* lessThan;

@end



@protocol _PVLocationRelationPart;

@protocol _PVLocationRelationSelect <NSObject>

@property (readonly) NSObject<_PVLocationRelationPart>* equalTo;
@property (readonly) NSObject<_PVLocationRelationPart>* moreThan;
@property (readonly) NSObject<_PVLocationRelationPart>* lessThan;

@end



@protocol _PVRightHandPart, _PVConstantPart;

typedef NSObject<_PVRightHandPart>*(^_PVRightHandViewBlock)(UIView*);
typedef NSObject<_PVConstantPart>*(^_PVConstantBlock)(CGFloat);

@protocol _PVLocationRelationPart <NSObject>

@property (readonly) _PVRightHandViewBlock leftOf;
@property (readonly) _PVRightHandViewBlock rightOf;
@property (readonly) _PVRightHandViewBlock topOf;
@property (readonly) _PVRightHandViewBlock bottomOf;
@property (readonly) _PVRightHandViewBlock leadingOf;
@property (readonly) _PVRightHandViewBlock trailingOf;
@property (readonly) _PVRightHandViewBlock centerXOf;
@property (readonly) _PVRightHandViewBlock centerYOf;
@property (readonly) _PVRightHandViewBlock baselineOf;

@end



@protocol _PVRelationPart <NSObject>

@property (readonly) _PVRightHandViewBlock widthOf;
@property (readonly) _PVRightHandViewBlock heightOf;
@property (readonly) _PVConstantBlock constant;

@end



@protocol _PVConstrainable, _PVMultiplierPart;

typedef NSObject<_PVConstrainable>*(^_PVPriorityBlock)(UILayoutPriority);
typedef NSObject<_PVMultiplierPart>*(^_PVMultiplierBlock)(CGFloat);

@protocol _PVRightHandPart <_PVMultiplierPart>

@property (readonly) _PVMultiplierBlock multipliedTo;

@end



@protocol _PVMultiplierPart <_PVConstantPart>

@property (readonly) _PVConstantBlock plus;
@property (readonly) _PVConstantBlock minus;

@end



@protocol _PVConstantPart <_PVConstrainable>

@property (readonly) _PVPriorityBlock withPriority;

@end



@protocol _PVConstrainable <NSObject>

@property (readonly) NSLayoutConstraint* asConstraint;

@end

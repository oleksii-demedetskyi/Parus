//
//  PV.h
//  Parus
//
//  Created by NekOI on 7/24/13.
//
//

#import <Foundation/Foundation.h>

@protocol PVLocationRelationSelect, PVRelationSelect;

NSObject<PVLocationRelationSelect>* PVLeftOf(UIView*);
NSObject<PVLocationRelationSelect>* PVRightOf(UIView*);
NSObject<PVLocationRelationSelect>* PVTopOf(UIView*);
NSObject<PVLocationRelationSelect>* PVBottomOf(UIView*);
NSObject<PVLocationRelationSelect>* PVLeadingOf(UIView*);
NSObject<PVLocationRelationSelect>* PVTrailingOf(UIView*);
NSObject<PVRelationSelect>* PVWidthOf(UIView*);
NSObject<PVRelationSelect>* PVHeightOf(UIView*);
NSObject<PVLocationRelationSelect>* PVCenterXOf(UIView*);
NSObject<PVLocationRelationSelect>* PVCenterYOf(UIView*);
NSObject<PVLocationRelationSelect>* PVBaselineOf(UIView*);



@protocol PVRelationPart;

@protocol PVRelationSelect <NSObject>

@property (readonly) NSObject<PVRelationPart>* equalTo;
@property (readonly) NSObject<PVRelationPart>* moreThan;
@property (readonly) NSObject<PVRelationPart>* lessThan;

@end



@protocol PVLocationRelationPart;

@protocol PVLocationRelationSelect <NSObject>

@property (readonly) NSObject<PVLocationRelationPart>* equalTo;
@property (readonly) NSObject<PVLocationRelationPart>* moreThan;
@property (readonly) NSObject<PVLocationRelationPart>* lessThan;

@end



@protocol PVRightHandPart, PVConstantPart;

typedef NSObject<PVRightHandPart>*(^PVRightHandViewBlock)(UIView*);
typedef NSObject<PVConstantPart>*(^PVConstantBlock)(CGFloat);

@protocol PVLocationRelationPart <NSObject>

@property (readonly) PVRightHandViewBlock leftOf;
@property (readonly) PVRightHandViewBlock rightOf;
@property (readonly) PVRightHandViewBlock topOf;
@property (readonly) PVRightHandViewBlock bottomOf;
@property (readonly) PVRightHandViewBlock leadingOf;
@property (readonly) PVRightHandViewBlock trailingOf;
@property (readonly) PVRightHandViewBlock centerXOf;
@property (readonly) PVRightHandViewBlock centerYOf;
@property (readonly) PVRightHandViewBlock baselineOf;

@end



@protocol PVRelationPart <NSObject>

@property (readonly) PVRightHandViewBlock widthOf;
@property (readonly) PVRightHandViewBlock heightOf;
@property (readonly) PVConstantBlock constant;

@end



@protocol PVConstrainable, PVMultiplierPart;

typedef NSObject<PVConstrainable>*(^PVPriorityBlock)(UILayoutPriority);
typedef NSObject<PVMultiplierPart>*(^PVMultiplierBlock)(CGFloat);

@protocol PVRightHandPart <PVMultiplierPart>

@property (readonly) PVMultiplierBlock multipliedTo;

@end



@protocol PVMultiplierPart <PVConstantPart>

@property (readonly) PVConstantBlock plus;
@property (readonly) PVConstantBlock minus;

@end



@protocol PVConstantPart <PVConstrainable>

@property (readonly) PVPriorityBlock withPriority;

@end



@protocol PVConstrainable <NSObject>

@property (readonly) NSLayoutConstraint* asConstraint;

@end


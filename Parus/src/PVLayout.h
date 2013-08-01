//
//  PV.h
//  Parus
//
//  Created by NekOI on 7/24/13.
//
//

#import <Foundation/Foundation.h>

@protocol PVLocationRelationSelect, PVRelationSelect;

id<PVLocationRelationSelect> PVLeftOf(UIView*);
id<PVLocationRelationSelect> PVRightOf(UIView*);
id<PVLocationRelationSelect> PVTopOf(UIView*);
id<PVLocationRelationSelect> PVBottomOf(UIView*);
id<PVLocationRelationSelect> PVLeadingOf(UIView*);
id<PVLocationRelationSelect> PVTrailingOf(UIView*);
id<PVRelationSelect> PVWidthOf(UIView*);
id<PVRelationSelect> PVHeightOf(UIView*);
id<PVLocationRelationSelect> PVCenterXOf(UIView*);
id<PVLocationRelationSelect> PVCenterYOf(UIView*);
id<PVLocationRelationSelect> PVBaselineOf(UIView*);



@protocol PVRelationPart;

@protocol PVRelationSelect <NSObject>

@property (readonly) id<PVRelationPart> equalTo;
@property (readonly) id<PVRelationPart> moreThan;
@property (readonly) id<PVRelationPart> lessThan;

@end



@protocol PVLocationRelationPart;

@protocol PVLocationRelationSelect <NSObject>

@property (readonly) id<PVLocationRelationPart> equalTo;
@property (readonly) id<PVLocationRelationPart> moreThan;
@property (readonly) id<PVLocationRelationPart> lessThan;

@end



@protocol PVRightHandPart, PVConstantPart;

typedef id<PVRightHandPart>(^PVRightHandViewBlock)(UIView*);
typedef id<PVConstantPart>(^PVConstantBlock)(CGFloat);

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

typedef id<PVConstrainable>(^PVPriorityBlock)(UILayoutPriority);
typedef id<PVMultiplierPart>(^PVMultiplierBlock)(CGFloat);

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


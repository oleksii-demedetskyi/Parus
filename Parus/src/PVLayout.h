//
//  PV.h
//  Parus
//
//  Created by NekOI on 7/24/13.
//
//

#import <Foundation/Foundation.h>

@protocol PVRelationSelect;

id<PVRelationSelect> PVLeftOf(UIView*);
id<PVRelationSelect> PVRightOf(UIView*);
id<PVRelationSelect> PVTopOf(UIView*);
id<PVRelationSelect> PVBottomOf(UIView*);
id<PVRelationSelect> PVLeadingOf(UIView*);
id<PVRelationSelect> PVTrailingOf(UIView*);
id<PVRelationSelect> PVWidthOf(UIView*);
id<PVRelationSelect> PVHeightOf(UIView*);
id<PVRelationSelect> PVCenterXOf(UIView*);
id<PVRelationSelect> PVCenterYOf(UIView*);
id<PVRelationSelect> PVBaselineOf(UIView*);

@protocol PVRelationPart;

@protocol PVRelationSelect <NSObject>

@property (readonly) id<PVRelationPart> equalTo;
@property (readonly) id<PVRelationPart> moreThan;
@property (readonly) id<PVRelationPart> lessThan;

@end

@protocol PVRightHandPart, PVConstantPart;

typedef id<PVRightHandPart>(^PVRightHandViewBlock)(UIView*);
typedef id<PVConstantPart>(^PVConstantBlock)(CGFloat);

@protocol PVRelationPart <NSObject>

@property (readonly) PVRightHandViewBlock leftOf;
@property (readonly) PVRightHandViewBlock rightOf;
@property (readonly) PVRightHandViewBlock topOf;
@property (readonly) PVRightHandViewBlock bottomOf;
@property (readonly) PVRightHandViewBlock leadingOf;
@property (readonly) PVRightHandViewBlock trailingOf;
@property (readonly) PVRightHandViewBlock widthOf;
@property (readonly) PVRightHandViewBlock heightOf;
@property (readonly) PVRightHandViewBlock centerXOf;
@property (readonly) PVRightHandViewBlock centerYOf;
@property (readonly) PVRightHandViewBlock baselineOf;

@property (readonly) PVConstantBlock constant;

@end



//
//  LMMaster.h
//  PriceSnap
//
//  Created by Alexey Demedetskiy on 28.05.13.
//  Copyright (c) 2013 Ciklum. All rights reserved.
//

#import <Foundation/Foundation.h>

@class LMRelationSelectObject;

typedef LMRelationSelectObject*(^LMLeftHandBLock)(UIView*);

@interface LMMaster : NSObject

@property (nonatomic, readonly) LMLeftHandBLock leftOf;
@property (nonatomic, readonly) LMLeftHandBLock rightOf;
@property (nonatomic, readonly) LMLeftHandBLock topOf;
@property (nonatomic, readonly) LMLeftHandBLock bottomOf;
@property (nonatomic, readonly) LMLeftHandBLock leadingOf;
@property (nonatomic, readonly) LMLeftHandBLock trailingOf;
@property (nonatomic, readonly) LMLeftHandBLock widthOf;
@property (nonatomic, readonly) LMLeftHandBLock heightOf;
@property (nonatomic, readonly) LMLeftHandBLock centerXOf;
@property (nonatomic, readonly) LMLeftHandBLock centerYOf;
@property (nonatomic, readonly) LMLeftHandBLock baselineOf;

- (void)processLayout;

@end

@class LMRelationPart;

@interface LMRelationSelectObject : NSObject

@property (nonatomic, readonly) LMRelationPart* equalTo;
@property (nonatomic, readonly) LMRelationPart* moreThan;
@property (nonatomic, readonly) LMRelationPart* lessThan;

@end


@class LMRightHandPart;
@class LMConstantPart;

typedef LMRightHandPart*(^LMRightHandViewBlock)(UIView*);
typedef LMConstantPart*(^LMConstantBlock)(CGFloat);

@interface LMRelationPart : NSObject

@property (nonatomic, readonly) LMRightHandViewBlock leftOf;
@property (nonatomic, readonly) LMRightHandViewBlock rightOf;
@property (nonatomic, readonly) LMRightHandViewBlock topOf;
@property (nonatomic, readonly) LMRightHandViewBlock bottomOf;
@property (nonatomic, readonly) LMRightHandViewBlock leadingOf;
@property (nonatomic, readonly) LMRightHandViewBlock trailingOf;
@property (nonatomic, readonly) LMRightHandViewBlock widthOf;
@property (nonatomic, readonly) LMRightHandViewBlock heightOf;
@property (nonatomic, readonly) LMRightHandViewBlock centerXOf;
@property (nonatomic, readonly) LMRightHandViewBlock centerYOf;
@property (nonatomic, readonly) LMRightHandViewBlock baselineOf;

@property (nonatomic, readonly) LMConstantBlock constant;

@end

typedef void(^LMPriorityBlock)(UILayoutPriority);

@class LMMultiplierPart;
typedef LMMultiplierPart*(^LMMultiplierBlock)(CGFloat);

@interface LMRightHandPart : NSObject

@property (nonatomic, readonly) LMMultiplierBlock multipliedTo;
@property (nonatomic, readonly) LMConstantBlock plus;
@property (nonatomic, readonly) LMConstantBlock minus;
@property (nonatomic, readonly) LMPriorityBlock withPriority;

@end

@interface LMMultiplierPart : NSObject

@property (nonatomic, readonly) LMConstantBlock plus;
@property (nonatomic, readonly) LMConstantBlock minus;
@property (nonatomic, readonly) LMPriorityBlock withPriority;

@end

@interface LMConstantPart : NSObject

@property (nonatomic, readonly) LMPriorityBlock withPriority;

@end
//
//  LMMaster.m
//  PriceSnap
//
//  Created by Alexey Demedetskiy on 28.05.13.
//  Copyright (c) 2013 Ciklum. All rights reserved.
//

#import "LMMaster.h"

@interface LMConstraintHolder : NSObject

@property (nonatomic, strong) UIView* view1;
@property (nonatomic, strong) UIView* view2;
@property (nonatomic, assign) NSLayoutAttribute attr1;
@property (nonatomic, assign) NSLayoutAttribute attr2;
@property (nonatomic, assign) CGFloat constant;
@property (nonatomic, assign) CGFloat multiplier;
@property (nonatomic, assign) NSInteger priority;

@end

@implementation LMConstraintHolder
@end

@interface LMMaster ()

@property (nonatomic, strong) NSMutableArray* constraints;

@end

@interface LMRelationSelectObject ()

@property (nonatomic, strong) LMConstraintHolder* holder;

@end

@implementation LMMaster

- (void)processLayout
{
    
}

- (LMLeftHandBLock)leftHandWithAttr:(NSLayoutAttribute)attr
{
    return ^(UIView* view){
        
        LMConstraintHolder* holder = [LMConstraintHolder new];
        holder.view1 = view;
        holder.attr1 = attr;
        
        LMRelationSelectObject* select  = [LMRelationSelectObject new];
        select.holder = holder;
        return select;
    };
}


- (LMLeftHandBLock)leftOf
{
    return [self leftHandWithAttr:NSLayoutAttributeLeft];
}

- (LMLeftHandBLock)rightOf
{
    return [self leftHandWithAttr:NSLayoutAttributeRight];
}

- (LMLeftHandBLock)topOf
{
    return [self leftHandWithAttr:NSLayoutAttributeTop];
}

- (LMLeftHandBLock)bottomOf
{
    return [self leftHandWithAttr:NSLayoutAttributeBottom];
}

- (LMLeftHandBLock)leadingOf
{
    return [self leftHandWithAttr:NSLayoutAttributeLeading];
}

- (LMLeftHandBLock)trailingOf
{
    return [self leftHandWithAttr:NSLayoutAttributeTrailing];
}

- (LMLeftHandBLock)widthOf
{
    return [self leftHandWithAttr:NSLayoutAttributeWidth];
}

- (LMLeftHandBLock)heightOf
{
    return [self leftHandWithAttr:NSLayoutAttributeHeight];
}

- (LMLeftHandBLock)centerXOf
{
    return [self leftHandWithAttr:NSLayoutAttributeCenterX];
}

- (LMLeftHandBLock)centerYOf
{
    return [self leftHandWithAttr:NSLayoutAttributeCenterY];
}

- (LMLeftHandBLock)baselineOf
{
    return [self leftHandWithAttr:NSLayoutAttributeBaseline];
}

@end

@implementation LMRelationSelectObject

- (LMRelationPart *)equalTo
{
    
}



@end

@implementation LMRelationObject


@end
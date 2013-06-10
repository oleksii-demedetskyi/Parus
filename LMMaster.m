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
@property (nonatomic, assign) NSLayoutRelation relation;

@end

@implementation LMConstraintHolder
@end

@interface LMMaster ()

@property (nonatomic, strong) NSMutableArray* constraints;

@end

@interface LMRelationSelectObject ()

@property (nonatomic, strong) LMConstraintHolder* holder;

@end

@interface LMRelationPart ()

@property (nonatomic, strong) LMConstraintHolder* holder;

@end

@interface LMRightHandPart ()

@property (nonatomic, strong) LMConstraintHolder* holder;

@end

@implementation LMMaster

- (void)processLayout
{
    
}

- (LMLeftHandBLock)leftHandWithAttr:(NSLayoutAttribute)attr
{
    return ^(UIView* view){
        NSParameterAssert([view isKindOfClass:[UIView class]]);
        
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

- (LMRelationPart*)relationWithLayoutRelation:(NSLayoutRelation)relation
{
    NSParameterAssert(self.holder != nil);
    
    self.holder.relation = relation;
    
    LMRelationPart* relationPart = [LMRelationPart new];
    relationPart.holder = self.holder;
    
    return relationPart;
}

- (LMRelationPart*)equalTo
{
    return [self relationWithLayoutRelation:NSLayoutRelationEqual];
}

- (LMRelationPart*)moreThan
{
    return [self relationWithLayoutRelation:NSLayoutRelationGreaterThanOrEqual];
}

- (LMRelationPart*)lessThan
{
    return [self relationWithLayoutRelation:NSLayoutRelationLessThanOrEqual];
}

@end

@implementation LMRelationPart

- (LMRightHandViewBlock)rightHandBlockWithAttribute:(NSLayoutAttribute)attribute
{
    return ^(UIView* view) {
        NSParameterAssert([view isKindOfClass:[UIView class]]);
        NSParameterAssert(self.holder != nil);
        
        self.holder.view2 = view;
        self.holder.attr2 = attribute;
        
        LMRightHandPart* rightHandPart = [LMRightHandPart new];
        rightHandPart.holder = self.holder;
        
        return rightHandPart;
    };
}

- (LMRightHandViewBlock)leftOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeLeft];
}

- (LMRightHandViewBlock)rightOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeRight];
}


//@property (nonatomic, readonly) LMRightHandViewBlock rightOf;
//@property (nonatomic, readonly) LMRightHandViewBlock topOf;
//@property (nonatomic, readonly) LMRightHandViewBlock bottomOf;
//@property (nonatomic, readonly) LMRightHandViewBlock leadingOf;
//@property (nonatomic, readonly) LMRightHandViewBlock trailingOf;
//@property (nonatomic, readonly) LMRightHandViewBlock widthOf;
//@property (nonatomic, readonly) LMRightHandViewBlock heightOf;
//@property (nonatomic, readonly) LMRightHandViewBlock centerXOf;
//@property (nonatomic, readonly) LMRightHandViewBlock centerYOf;
//@property (nonatomic, readonly) LMRightHandViewBlock baselineOf;
//
//@property (nonatomic, readonly) LMConstantBlock constant;

@end

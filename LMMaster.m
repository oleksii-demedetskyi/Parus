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

@interface LMRelationSelectObject ()

@property (nonatomic, strong) LMConstraintHolder* holder;

@end

@interface LMRelationPart ()

@property (nonatomic, strong) LMConstraintHolder* holder;

@end

@interface LMRightHandPart ()

@property (nonatomic, strong) LMConstraintHolder* holder;

@end

@interface LMConstantPart ()

@property (nonatomic, strong) LMConstraintHolder* holder;

@end

@interface LMMultiplierPart ()

@property (nonatomic, strong) LMConstraintHolder* holder;

@end

@interface LMMaster ()

@property (nonatomic, strong) NSMutableArray* constraintHolders; // [LMConstraintHolder]

@end

@implementation LMMaster

- (instancetype)init
{
    self = [super init];
    if (self != nil)
    {
        _constraintHolders = [NSMutableArray new];
    }
    
    return self;
}

- (void)processLayout
{
    NSMutableArray* constraints = [NSMutableArray new];
    
    for (LMConstraintHolder* holder in self.constraintHolders)
    {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:holder.view1
                                     attribute:holder.attr1
                                     relatedBy:holder.relation
                                        toItem:holder.view2
                                     attribute:holder.attr2
                                    multiplier:holder.multiplier
                                      constant:holder.constant]];
    }
    
    self.constraintHolders = [NSMutableArray new];
    self.constraints = constraints;
}

- (LMLeftHandBLock)leftHandWithAttr:(NSLayoutAttribute)attr
{
    return ^(UIView* view){
        NSParameterAssert([view isKindOfClass:[UIView class]]);
        
        LMConstraintHolder* holder = [LMConstraintHolder new];
        holder.view1 = view;
        holder.attr1 = attr;
        holder.multiplier = 1.f;
        holder.constant = 0.f;
        
        [self.constraintHolders addObject:holder];
        
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

- (LMRightHandViewBlock)topOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeTop];
}

- (LMRightHandViewBlock)bottomOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeBottom];
}

- (LMRightHandViewBlock)leadingOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeLeading];
}

- (LMRightHandViewBlock)trailingOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeTrailing];
}

- (LMRightHandViewBlock)widthOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeWidth];
}

- (LMRightHandViewBlock)heightOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeHeight];
}

- (LMRightHandViewBlock)centerXOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeCenterX];
}

- (LMRightHandViewBlock)centerYOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeCenterY];
}

- (LMRightHandViewBlock)baselineOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeBaseline];
}

- (LMConstantBlock)constant
{
    NSParameterAssert(self.holder != nil);
    
    self.holder.view2 = nil;
    self.holder.attr2 = NSLayoutAttributeNotAnAttribute;
    
    return ^(CGFloat constant) {
        LMConstantPart* constantPart = [LMConstantPart new];
        constantPart.holder = self.holder;
        
        return constantPart;
    };
}

@end

@implementation LMRightHandPart

- (LMMultiplierBlock)multipliedTo
{
    NSParameterAssert(self.holder != nil);
    
    return ^(CGFloat multiplier) {
        self.holder.multiplier = multiplier;
        
        LMMultiplierPart* multiplierPart = [LMMultiplierPart new];
        multiplierPart.holder = self.holder;
        
        return multiplierPart;
    };
}

- (LMConstantBlock)constant
{
    NSParameterAssert(self.holder != nil);
    
    return ^(CGFloat constant) {
        self.holder.constant = constant;
        
        LMConstantPart* constantPart = [LMConstantPart new];
        constantPart.holder = self.holder;
        
        return constantPart;
    };
}

- (LMPriorityBlock)withPriority
{
    NSParameterAssert(self.holder != nil);
    
    return ^(UILayoutPriority priority) {
        self.holder.priority = priority;
    };
}

@end

@implementation LMMultiplierPart

- (LMConstantBlock)constant
{
    NSParameterAssert(self.holder != nil);
    
    return ^(CGFloat constant) {
        self.holder.constant = constant;
        
        LMConstantPart* constantPart = [LMConstantPart new];
        constantPart.holder = self.holder;
        
        return constantPart;
    };
}

- (LMPriorityBlock)withPriority
{
    NSParameterAssert(self.holder != nil);
    
    return ^(UILayoutPriority priority) {
        self.holder.priority = priority;
    };
}

@end

@implementation LMConstantPart

- (LMPriorityBlock)withPriority
{
    NSParameterAssert(self.holder != nil);
    
    return ^(UILayoutPriority priority) {
        self.holder.priority = priority;
    };
}

@end

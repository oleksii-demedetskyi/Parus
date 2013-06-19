//
//  LMMaster.m
//  PriceSnap
//
//  Created by Alexey Demedetskiy on 28.05.13.
//  Copyright (c) 2013 Ciklum. All rights reserved.
//

#import "LMMaster.h"
#import "PVConstraintContext.h"

LMMaster* pv_where()
{
    return [LMMaster new];
}

@interface LMRelationSelectObject ()

@property (nonatomic, strong) PVConstraintContext* holder;

@end

@interface LMRelationPart ()

@property (nonatomic, strong) PVConstraintContext* holder;

@end

@interface LMRightHandPart ()

@property (nonatomic, strong) PVConstraintContext* holder;

@end

@interface LMConstantPart ()

@property (nonatomic, strong) PVConstraintContext* holder;

@end

@interface LMMultiplierPart ()

@property (nonatomic, strong) PVConstraintContext* holder;

@end

@interface LMPriority ()

@property (nonatomic, strong) PVConstraintContext* holder;

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
    
    for (PVConstraintContext* holder in self.constraintHolders)
    {
        [constraints addObject:[NSLayoutConstraint constraintWithItem:holder.leftView
                                     attribute:holder.leftAttribute
                                     relatedBy:holder.relation
                                        toItem:holder.rightView
                                     attribute:holder.rightAttribute
                                    multiplier:holder.rightAtttributeMultiplier
                                      constant:holder.rightConstant]];
    }
    
    self.constraintHolders = [NSMutableArray new];
    self.constraints = constraints;
}

- (LMLeftHandBLock)leftHandWithAttr:(NSLayoutAttribute)attr
{
    return ^(UIView* view){
        NSParameterAssert([view isKindOfClass:[UIView class]]);
        
        PVConstraintContext* holder = [PVConstraintContext new];
        holder.leftView = view;
        holder.leftAttribute = attr;
        holder.rightAtttributeMultiplier = 0.f;
        holder.rightConstant = 0.f;
        
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
        
        self.holder.rightView = view;
        self.holder.rightAttribute = attribute;
        self.holder.rightAtttributeMultiplier = 1.0f;
        
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
    
    self.holder.rightView = nil;
    self.holder.rightAttribute = NSLayoutAttributeNotAnAttribute;
    
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
        self.holder.rightAtttributeMultiplier = multiplier;
        
        LMMultiplierPart* multiplierPart = [LMMultiplierPart new];
        multiplierPart.holder = self.holder;
        
        return multiplierPart;
    };
}

- (LMConstantBlock)constant
{
    NSParameterAssert(self.holder != nil);
    
    return ^(CGFloat constant) {
        self.holder.rightConstant = constant;
        
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
        
        LMPriority* priorityObject = [LMPriority new];
        priorityObject.holder = self.holder;
        
        return priorityObject;
    };
}

-(NSLayoutConstraint *)asConstraint
{
    return [self.holder buildConstraint];
}

@end

@implementation LMMultiplierPart

- (LMConstantBlock)constant
{
    NSParameterAssert(self.holder != nil);
    
    return ^(CGFloat constant) {
        self.holder.rightConstant = constant;
        
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
        
        LMPriority* priorityObject = [LMPriority new];
        priorityObject.holder = self.holder;
        
        return priorityObject;
    };
}

-(NSLayoutConstraint *)asConstraint
{
    return [self.holder buildConstraint];
}

@end

@implementation LMConstantPart

- (LMPriorityBlock)withPriority
{
    NSParameterAssert(self.holder != nil);
    
    return ^(UILayoutPriority priority) {
        self.holder.priority = priority;
        
        LMPriority* priorityObject = [LMPriority new];
        priorityObject.holder = self.holder;
        
        return priorityObject;
    };
}

-(NSLayoutConstraint *)asConstraint
{
    return [self.holder buildConstraint];
}

@end

@implementation LMPriority

-(NSLayoutConstraint *)asConstraint
{
    return [self.holder buildConstraint];
}

@end

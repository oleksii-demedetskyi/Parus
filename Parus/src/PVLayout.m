//
//  PVLayout.m
//  Parus
//
//  Created by NekOI on 7/24/13.
//
//

#import "PVLayout.h"

#import "PVConstraintContext.h"

@interface PVRelationSelect : NSObject<PVRelationSelect, PVLocationRelationSelect>

@property (strong) PVConstraintContext* context;

@end

@interface PVRelationPart : NSObject<PVRelationPart, PVLocationRelationPart>

@property (strong) PVConstraintContext* context;

@end

@interface PVLayout : NSObject

@property (strong) PVConstraintContext* context;

@end

@interface PVRightHandPart : NSObject<PVRightHandPart>

@property (strong) PVConstraintContext* context;

@end

@interface PVConstantPart : NSObject<PVConstantPart>

@property (strong) PVConstraintContext* context;

@end

@interface PVMultiplierPart : NSObject<PVMultiplierPart>

@property (strong) PVConstraintContext* context;

@end

@interface PVPriority : NSObject<PVConstrainable>

@property (strong) PVConstraintContext* context;

@end

@implementation PVLayout

- (instancetype)init
{
    self = [super init];
    if (self != nil)
    {
        _context = [PVConstraintContext new];
    }
    
    return self;
}

@end



@implementation PVRelationSelect

- (PVRelationPart*)equalTo
{
    return [self relationPartForRelation:NSLayoutRelationEqual];
}

- (PVRelationPart*)lessThan
{
    return [self relationPartForRelation:NSLayoutRelationLessThanOrEqual];
}

- (PVRelationPart*)moreThan
{
    return [self relationPartForRelation:NSLayoutRelationGreaterThanOrEqual];
}

- (PVRelationPart*)relationPartForRelation:(NSLayoutRelation)relation
{
    NSAssert(self.context != nil, @"Context is not set");
    
    self.context.relation = relation;
    
    PVRelationPart* relationPart = [PVRelationPart new];
    relationPart.context = self.context;
    
    return relationPart;
}

@end



@implementation PVRelationPart

- (PVRightHandViewBlock)leftOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeLeft];
}

- (PVRightHandViewBlock)rightOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeRight];
}

- (PVRightHandViewBlock)topOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeTop];
}

- (PVRightHandViewBlock)bottomOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeBottom];
}

- (PVRightHandViewBlock)leadingOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeLeading];
}

- (PVRightHandViewBlock)trailingOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeTrailing];
}

- (PVRightHandViewBlock)widthOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeWidth];
}

- (PVRightHandViewBlock)heightOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeHeight];
}

- (PVRightHandViewBlock)centerXOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeCenterX];
}

- (PVRightHandViewBlock)centerYOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeCenterY];
}

- (PVRightHandViewBlock)baselineOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeBaseline];
}

- (PVRightHandViewBlock)rightHandBlockWithAttribute:(NSLayoutAttribute)attribute
{
    return ^(UIView* view) {
        NSAssert(self.context != nil, @"Context is not set");
        NSAssert([view isKindOfClass:[UIView class]], @"Argument is not kind of UIView\nview is kind of %@", [view class]);
        
        self.context.rightView = view;
        self.context.rightAttribute = attribute;
        self.context.rightAtttributeMultiplier = 1.f;
        
        PVRightHandPart* rightHandPart = [PVRightHandPart new];
        rightHandPart.context = self.context;
        
        return rightHandPart;
    };
}

- (PVConstantBlock)constant
{
    return ^(CGFloat constant) {
        NSAssert(self.context != nil, @"Context is not set");
        
        self.context.rightConstant = constant;
        
        PVConstantPart* constantPart = [PVConstantPart new];
        constantPart.context = self.context;
        
        return constantPart;
    };
}

@end



@implementation PVRightHandPart

- (PVMultiplierBlock)multipliedTo
{
    return ^(CGFloat multiplier) {
        NSAssert(self.context != nil, @"Context is not set");
        
        self.context.rightAtttributeMultiplier = multiplier;
        
        return self.multiplierPart;
    };
}

- (PVConstantBlock)plus
{
    return ^(CGFloat constant) {
        return self.multiplierPart.plus(constant);
    };
}

- (PVConstantBlock)minus
{
    return ^(CGFloat constant) {
        return self.multiplierPart.minus(constant);
    };
}

- (PVMultiplierPart*)multiplierPart
{
    NSAssert(self.context != nil, @"Context is not set");
    
    PVMultiplierPart* multiplierPart = [PVMultiplierPart new];
    multiplierPart.context = self.context;
    
    return multiplierPart;
}

- (PVPriorityBlock)withPriority
{
    return ^(UILayoutPriority priority) {
        NSAssert(self.context != nil, @"Context is not set");
        
        PVConstantPart* constantPart = [PVConstantPart new];
        constantPart.context = self.context;
        
        return constantPart.withPriority(priority);
    };
}

- (NSLayoutConstraint *)asConstraint
{
    NSAssert(self.context != nil, @"Context is not set");
    
    return [self.context buildConstraint];
}

@end



@implementation PVConstantPart

- (PVPriorityBlock)withPriority
{
    return ^(UILayoutPriority priority) {
        NSAssert(self.context != nil, @"Context is not set");
        
        self.context.priority = priority;
        
        PVPriority* priorityObject = [PVPriority new];
        priorityObject.context = self.context;
        
        return priorityObject;
    };
}

- (NSLayoutConstraint *)asConstraint
{
    NSAssert(self.context != nil, @"Context is not set");
    
    return [self.context buildConstraint];
}

@end



@implementation PVMultiplierPart

- (PVConstantBlock)plus
{
    return ^(CGFloat constant) {
        return [self constantPartWithConstant:constant];
    };
}

- (PVConstantBlock)minus
{
    return ^(CGFloat constant) {
        return [self constantPartWithConstant:-constant];
    };
}

- (PVConstantPart*)constantPartWithConstant:(CGFloat)constant
{
    NSAssert(self.context != nil, @"Context is not set");
    
    self.context.rightConstant = constant;
    
    return self.constantPart;
}

- (PVConstantPart*)constantPart
{
    NSAssert(self.context != nil, @"Context is not set");
    
    PVConstantPart* constantPart = [PVConstantPart new];
    constantPart.context = self.context;
    
    return constantPart;
}

- (PVPriorityBlock)withPriority
{
    return ^(UILayoutPriority priority) {
        return self.constantPart.withPriority(priority);
    };
}

- (NSLayoutConstraint *)asConstraint
{
    NSAssert(self.context != nil, @"Context is not set");
    
    return [self.context buildConstraint];
}

@end



@implementation PVPriority

- (NSLayoutConstraint *)asConstraint
{
    NSAssert(self.context != nil, @"Context is not set");
    
    return [self.context buildConstraint];
}

@end



#pragma mark - Public Funtions

id<PVRelationSelect, PVLocationRelationSelect> PVLayoutWithViewAndAttribute(UIView* view, NSLayoutAttribute attribute)
{
    NSCAssert([view isKindOfClass:[UIView class]], @"Argument is not kind of UIView\nview is %@", view);
    
    PVLayout* constraint = [PVLayout new];
    constraint.context.leftView = view;
    constraint.context.leftAttribute = attribute;
    constraint.context.rightAtttributeMultiplier = 0.f;
    constraint.context.rightConstant = 0.f;
    
    PVRelationSelect* relation = [PVRelationSelect new];
    relation.context = constraint.context;
    
    return relation;
}

id<PVLocationRelationSelect> PVLeftOf(UIView* view)
{
    return PVLayoutWithViewAndAttribute(view, NSLayoutAttributeLeft);
}

id<PVLocationRelationSelect> PVRightOf(UIView* view)
{
    return PVLayoutWithViewAndAttribute(view, NSLayoutAttributeRight);
}

id<PVLocationRelationSelect> PVTopOf(UIView* view)
{
    return PVLayoutWithViewAndAttribute(view, NSLayoutAttributeTop);
}

id<PVLocationRelationSelect> PVBottomOf(UIView* view)
{
    return PVLayoutWithViewAndAttribute(view, NSLayoutAttributeBottom);
}

id<PVLocationRelationSelect> PVLeadingOf(UIView* view)
{
    return PVLayoutWithViewAndAttribute(view, NSLayoutAttributeLeading);
}

id<PVLocationRelationSelect> PVTrailingOf(UIView* view)
{
    return PVLayoutWithViewAndAttribute(view, NSLayoutAttributeTrailing);
}

id<PVRelationSelect> PVWidthOf(UIView* view)
{
    return PVLayoutWithViewAndAttribute(view, NSLayoutAttributeWidth);
}

id<PVRelationSelect> PVHeightOf(UIView* view)
{
    return PVLayoutWithViewAndAttribute(view, NSLayoutAttributeHeight);
}

id<PVLocationRelationSelect> PVCenterXOf(UIView* view)
{
    return PVLayoutWithViewAndAttribute(view, NSLayoutAttributeCenterX);
}

id<PVLocationRelationSelect> PVCenterYOf(UIView* view)
{
    return PVLayoutWithViewAndAttribute(view, NSLayoutAttributeCenterY);
}

id<PVLocationRelationSelect> PVBaselineOf(UIView* view)
{
    return PVLayoutWithViewAndAttribute(view, NSLayoutAttributeBaseline);
}

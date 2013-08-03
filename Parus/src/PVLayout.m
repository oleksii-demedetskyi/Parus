//
//  PVLayout.m
//  Parus
//
//  Created by NekOI on 7/24/13.
//
//

#import "PVLayout.h"

#import "PVConstraintContext.h"

@interface PVLayout : NSObject

@property (strong) PVConstraintContext* context;

@end

@interface PVLayout(RelationPart)<PVRelationPart, PVLocationRelationPart>
@end

@interface PVLayout(RelationSelect)<PVRelationSelect, PVLocationRelationSelect>
@end

@interface PVLayout(RightHandPart)<PVRightHandPart>
@end

@interface PVLayout(ConstantPart)<PVConstantPart>
@end

@interface PVLayout(MultiplierPart)<PVMultiplierPart>
@end

@interface PVLayout(Constrainable)<PVConstrainable>
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



@implementation PVLayout(RelationSelect)

- (instancetype)equalTo
{
    self.context.relation = NSLayoutRelationEqual;
    
    return self;
}

- (instancetype)lessThan
{
    self.context.relation = NSLayoutRelationLessThanOrEqual;
    
    return self;
}

- (instancetype)moreThan
{
    self.context.relation = NSLayoutRelationGreaterThanOrEqual;
    
    return self;
}

@end



@implementation PVLayout(RelationPart)

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
        NSAssert([view isKindOfClass:[UIView class]], @"Argument is not kind of UIView\nview is kind of %@", [view class]);
        
        self.context.rightView = view;
        self.context.rightAttribute = attribute;
        self.context.rightAtttributeMultiplier = 1.f;
        
        return self;
    };
}

- (PVConstantBlock)constant
{
    return ^(CGFloat constant) {
        self.context.rightConstant = constant;
        
        return self;
    };
}

@end



@implementation PVLayout(RightHandPart)

- (PVMultiplierBlock)multipliedTo
{
    return ^(CGFloat multiplier) {
        self.context.rightAtttributeMultiplier = multiplier;
        
        return self;
    };
}

@end



@implementation PVLayout(ConstantPart)

- (PVPriorityBlock)withPriority
{
    return ^(UILayoutPriority priority) {
        self.context.priority = priority;
        
        return self;
    };
}

@end



@implementation PVLayout(MultiplierPart)

- (PVConstantBlock)plus
{
    return ^(CGFloat constant) {
        self.context.rightConstant = constant;
        
        return self;
    };
}

- (PVConstantBlock)minus
{
    return ^(CGFloat constant) {
        self.context.rightConstant = -constant;
        
        return self;
    };
}

@end



@implementation PVLayout(Constrainable)

- (NSLayoutConstraint *)asConstraint
{
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
    
    return constraint;
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

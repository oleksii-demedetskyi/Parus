//
//  PVLayout.m
//  Parus
//
//  Created by NekOI on 7/24/13.
//
//

#import "PVLayout.h"
#import "PVLayoutImp.h"
#import "PVSingleConstraintDebugContext.h"

@interface PVLayout(RelationPart)<_PVRelationPart, _PVLocationRelationPart>
@end

@interface PVLayout(RelationSelect)<_PVRelationSelect, _PVLocationRelationSelect>
@end

@interface PVLayout(RightHandPart)<_PVRightHandPart>
@end

@interface PVLayout(ConstantPart)<_PVConstantPart>
@end

@interface PVLayout(MultiplierPart)<_PVMultiplierPart>
@end

@interface PVLayout(Constrainable)<_PVConstrainable>
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
    [self.context.debugContext appendSelector:_cmd];
    self.context.relation = NSLayoutRelationEqual;
    
    return self;
}

- (instancetype)lessThan
{
    [self.context.debugContext appendSelector:_cmd];
    self.context.relation = NSLayoutRelationLessThanOrEqual;
    
    return self;
}

- (instancetype)moreThan
{
    [self.context.debugContext appendSelector:_cmd];
    self.context.relation = NSLayoutRelationGreaterThanOrEqual;
    
    return self;
}

@end



@implementation PVLayout(RelationPart)

- (_PVRightHandViewBlock)leftOf
{
    [self.context.debugContext appendSelector:_cmd];
    return [self rightHandBlockWithAttribute:NSLayoutAttributeLeft];
}

- (_PVRightHandViewBlock)rightOf
{
    [self.context.debugContext appendSelector:_cmd];
    return [self rightHandBlockWithAttribute:NSLayoutAttributeRight];
}

- (_PVRightHandViewBlock)topOf
{
    [self.context.debugContext appendSelector:_cmd];
    return [self rightHandBlockWithAttribute:NSLayoutAttributeTop];
}

- (_PVRightHandViewBlock)bottomOf
{
    [self.context.debugContext appendSelector:_cmd];
    return [self rightHandBlockWithAttribute:NSLayoutAttributeBottom];
}

- (_PVRightHandViewBlock)leadingOf
{
    [self.context.debugContext appendSelector:_cmd];
    return [self rightHandBlockWithAttribute:NSLayoutAttributeLeading];
}

- (_PVRightHandViewBlock)trailingOf
{
    [self.context.debugContext appendSelector:_cmd];
    return [self rightHandBlockWithAttribute:NSLayoutAttributeTrailing];
}

- (_PVRightHandViewBlock)widthOf
{
    [self.context.debugContext appendSelector:_cmd];
    return [self rightHandBlockWithAttribute:NSLayoutAttributeWidth];
}

- (_PVRightHandViewBlock)heightOf
{
    [self.context.debugContext appendSelector:_cmd];
    return [self rightHandBlockWithAttribute:NSLayoutAttributeHeight];
}

- (_PVRightHandViewBlock)centerXOf
{
    [self.context.debugContext appendSelector:_cmd];
    return [self rightHandBlockWithAttribute:NSLayoutAttributeCenterX];
}

- (_PVRightHandViewBlock)centerYOf
{
    [self.context.debugContext appendSelector:_cmd];
    return [self rightHandBlockWithAttribute:NSLayoutAttributeCenterY];
}

- (_PVRightHandViewBlock)baselineOf
{
    [self.context.debugContext appendSelector:_cmd];
    return [self rightHandBlockWithAttribute:NSLayoutAttributeBaseline];
}

- (_PVRightHandViewBlock)rightHandBlockWithAttribute:(NSLayoutAttribute)attribute
{
    return ^(PVView* view) {
        NSAssert([view isKindOfClass:[PVView class]], @"Argument is not kind of PVView\nview is kind of %@", [view class]);
        
        [self.context.debugContext appendViewParameter:view];
        self.context.rightView = view;
        
        self.context.rightAttribute = attribute;
        self.context.rightAtttributeMultiplier = 1.f;
        
        return (_PVRightHandPart*)self;
    };
}

- (_PVConstantBlock)constant
{
    [self.context.debugContext appendSelector:_cmd];
    return ^(CGFloat constant) {
        
        [self.context.debugContext appendFloatParameter:constant];
        self.context.rightConstant = constant;
        
        return (_PVConstantPart*)self;
    };
}

@end



@implementation PVLayout(RightHandPart)

- (_PVMultiplierBlock)multipliedTo
{
    [self.context.debugContext appendSelector:_cmd];
    return ^(CGFloat multiplier) {
        [self.context.debugContext appendFloatParameter:multiplier];
        self.context.rightAtttributeMultiplier = multiplier;
        
        return (_PVMultiplierPart*)self;
    };
}

@end



@implementation PVLayout(ConstantPart)

- (_PVPriorityBlock)withPriority
{
    [self.context.debugContext appendSelector:_cmd];
    return ^(PVLayoutPriority priority) {
        
        [self.context.debugContext appendPriority:priority];
        self.context.priority = priority;
        
        return (_PVConstrainable*)self;
    };
}

@end



@implementation PVLayout(MultiplierPart)

- (_PVConstantBlock)plus
{
    [self.context.debugContext appendSelector:_cmd];
    return ^(CGFloat constant) {
        [self.context.debugContext appendFloatParameter:constant];
        self.context.rightConstant = constant;
        
        return (_PVConstantPart*)self;
    };
}

- (_PVConstantBlock)minus
{
    [self.context.debugContext appendSelector:_cmd];
    return ^(CGFloat constant) {
        [self.context.debugContext appendFloatParameter:constant];
        self.context.rightConstant = -constant;
        
        return (_PVConstantPart*)self;
    };
}

@end



@implementation PVLayout(Constrainable)

- (NSLayoutConstraint *)asConstraint
{
    return [self.context buildConstraint];
}

- (_PVAddToViewBlock)addToView
{
    return ^(PVView* view) {
        [view addConstraint:self.asConstraint];
    };
}

@end



#pragma mark - Public Funtions

id<_PVRelationSelect, _PVLocationRelationSelect> PVLayoutWithViewAndAttribute(PVView* view, NSLayoutAttribute attribute)
{
    NSCAssert([view isKindOfClass:[PVView class]], @"Argument is not kind of PVView\nview is %@", view);
    
    PVLayout* constraint = [PVLayout new];
    
    [constraint.context.debugContext openWithView:view andAttribute:attribute];

    constraint.context.leftView = view;
    constraint.context.leftAttribute = attribute;
    constraint.context.rightAtttributeMultiplier = 0.f;
    constraint.context.rightConstant = 0.f;
    
    return constraint;
}

id<_PVLocationRelationSelect> PVLeftOf(PVView* view)
{
    return PVLayoutWithViewAndAttribute(view, NSLayoutAttributeLeft);
}

id<_PVLocationRelationSelect> PVRightOf(PVView* view)
{
    return PVLayoutWithViewAndAttribute(view, NSLayoutAttributeRight);
}

id<_PVLocationRelationSelect> PVTopOf(PVView* view)
{
    return PVLayoutWithViewAndAttribute(view, NSLayoutAttributeTop);
}

id<_PVLocationRelationSelect> PVBottomOf(PVView* view)
{
    return PVLayoutWithViewAndAttribute(view, NSLayoutAttributeBottom);
}

id<_PVLocationRelationSelect> PVLeadingOf(PVView* view)
{
    return PVLayoutWithViewAndAttribute(view, NSLayoutAttributeLeading);
}

id<_PVLocationRelationSelect> PVTrailingOf(PVView* view)
{
    return PVLayoutWithViewAndAttribute(view, NSLayoutAttributeTrailing);
}

id<_PVRelationSelect> PVWidthOf(PVView* view)
{
    return PVLayoutWithViewAndAttribute(view, NSLayoutAttributeWidth);
}

id<_PVRelationSelect> PVHeightOf(PVView* view)
{
    return PVLayoutWithViewAndAttribute(view, NSLayoutAttributeHeight);
}

id<_PVLocationRelationSelect> PVCenterXOf(PVView* view)
{
    return PVLayoutWithViewAndAttribute(view, NSLayoutAttributeCenterX);
}

id<_PVLocationRelationSelect> PVCenterYOf(PVView* view)
{
    return PVLayoutWithViewAndAttribute(view, NSLayoutAttributeCenterY);
}

id<_PVLocationRelationSelect> PVBaselineOf(PVView* view)
{
    return PVLayoutWithViewAndAttribute(view, NSLayoutAttributeBaseline);
}

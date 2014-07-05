//
//  PVLayout.m
//  Parus
//
//  Created by NekOI on 7/24/13.
//
//

#import "PVLayout.h"
#import "PVLayoutImp.h"

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

- (_PVRightHandViewBlock)leftOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeLeft];
}

- (_PVRightHandViewBlock)rightOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeRight];
}

- (_PVRightHandViewBlock)topOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeTop];
}

- (_PVRightHandViewBlock)bottomOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeBottom];
}

- (_PVRightHandViewBlock)leadingOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeLeading];
}

- (_PVRightHandViewBlock)trailingOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeTrailing];
}

- (_PVRightHandViewBlock)widthOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeWidth];
}

- (_PVRightHandViewBlock)heightOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeHeight];
}

- (_PVRightHandViewBlock)centerXOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeCenterX];
}

- (_PVRightHandViewBlock)centerYOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeCenterY];
}

- (_PVRightHandViewBlock)baselineOf
{
    return [self rightHandBlockWithAttribute:NSLayoutAttributeBaseline];
}

- (_PVRightHandViewBlock)rightHandBlockWithAttribute:(NSLayoutAttribute)attribute
{
    return ^(PVView* view) {
        NSAssert([view isKindOfClass:[PVView class]], @"Argument is not kind of PVView\nview is kind of %@", [view class]);
        
        self.context.rightView = view;
        self.context.rightAttribute = attribute;
        self.context.rightAtttributeMultiplier = 1.f;
        
        return (_PVRightHandPart*)self;
    };
}

- (_PVConstantBlock)constant
{
    return ^(CGFloat constant) {
        self.context.rightConstant = constant;
        
        return (_PVConstantPart*)self;
    };
}

@end



@implementation PVLayout(RightHandPart)

- (_PVMultiplierBlock)multipliedTo
{
    return ^(CGFloat multiplier) {
        self.context.rightAtttributeMultiplier = multiplier;
        
        return (_PVMultiplierPart*)self;
    };
}

@end



@implementation PVLayout(ConstantPart)

- (_PVPriorityBlock)withPriority
{
    return ^(PVLayoutPriority priority) {
        self.context.priority = priority;
        
        return (_PVConstrainable*)self;
    };
}

@end



@implementation PVLayout(MultiplierPart)

- (_PVConstantBlock)plus
{
    return ^(CGFloat constant) {
        self.context.rightConstant = constant;
        
        return (_PVConstantPart*)self;
    };
}

- (_PVConstantBlock)minus
{
    return ^(CGFloat constant) {
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

@end



#pragma mark - Public Funtions

id<_PVRelationSelect, _PVLocationRelationSelect> PVLayoutWithViewAndAttribute(PVView* view, NSLayoutAttribute attribute)
{
    NSCAssert([view isKindOfClass:[PVView class]], @"Argument is not kind of PVView\nview is %@", view);
    
    PVLayout* constraint = [PVLayout new];
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



#pragma mark -

#if TARGET_OS_IPHONE
    #define PVViewClass UIView
#elif TARGET_OS_MAC
    #define PVViewClass NSView
#else
    #error Can't identify platform to pick correct View class
#endif

@implementation PVViewClass (PVConvenientShorthands)

- (_PVLocationRelationSelect*)pv_left
{
    return PVLayoutWithViewAndAttribute(self, NSLayoutAttributeLeft);
}

- (_PVLocationRelationSelect*)pv_right
{
    return PVLayoutWithViewAndAttribute(self, NSLayoutAttributeRight);
}

- (_PVLocationRelationSelect*)pv_top
{
    return PVLayoutWithViewAndAttribute(self, NSLayoutAttributeTop);
}

- (_PVLocationRelationSelect*)pv_bottom
{
    return PVLayoutWithViewAndAttribute(self, NSLayoutAttributeBottom);
}

- (_PVLocationRelationSelect*)pv_leading
{
    return PVLayoutWithViewAndAttribute(self, NSLayoutAttributeLeading);
}

- (_PVLocationRelationSelect*)pv_trailing
{
    return PVLayoutWithViewAndAttribute(self, NSLayoutAttributeTrailing);
}

- (_PVRelationSelect*)pv_width
{
    return PVLayoutWithViewAndAttribute(self, NSLayoutAttributeWidth);
}

- (_PVRelationSelect*)pv_height
{
    return PVLayoutWithViewAndAttribute(self, NSLayoutAttributeHeight);
}

- (_PVLocationRelationSelect*)pv_centerX
{
    return PVLayoutWithViewAndAttribute(self, NSLayoutAttributeCenterX);
}

- (_PVLocationRelationSelect*)pv_centerY
{
    return PVLayoutWithViewAndAttribute(self, NSLayoutAttributeCenterY);
}

- (_PVLocationRelationSelect*)pv_baseline
{
    return PVLayoutWithViewAndAttribute(self, NSLayoutAttributeBaseline);
}

@end

#undef PVViewClass

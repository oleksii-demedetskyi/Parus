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



@interface PVRelation : NSObject<PVRelationProtocol>

@property (strong) PVConstraintContext* context;

@end

@implementation PVRelation



@end



id<PVRelationProtocol> PVLeftOf(UIView* view)
{
    NSCAssert(view != nil, @"PVLeftOf() argument should not be nil");
    
    PVLayout* constraint = [PVLayout new];
    constraint.context.leftView = view;
    constraint.context.leftAttribute = NSLayoutAttributeLeft;
    constraint.context.rightAtttributeMultiplier = 0.f;
    constraint.context.rightConstant = 0.f;
    
    PVRelation* relation = [PVRelation new];
    relation.context = constraint.context;
    
    return relation;
}

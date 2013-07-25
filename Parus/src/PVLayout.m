//
//  PVLayout.m
//  Parus
//
//  Created by NekOI on 7/24/13.
//
//

#import "PVLayout.h"

#import "PVConstraintContext.h"

@interface PVRelationSelect : NSObject<PVRelationSelect>

@property (strong) PVConstraintContext* context;

@end

@interface PVRelationPart : NSObject<PVRelationPart>

@property (strong) PVConstraintContext* context;

@end

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



@implementation PVRelationSelect

- (id<PVRelationPart>)equalTo
{
    return [self relationPartForRelation:NSLayoutRelationEqual];
}

- (id<PVRelationPart>)lessThan
{
    return [self relationPartForRelation:NSLayoutRelationLessThanOrEqual];
}

- (id<PVRelationPart>)moreThan
{
    return [self relationPartForRelation:NSLayoutRelationGreaterThanOrEqual];
}

- (PVRelationPart*)relationPartForRelation:(NSLayoutRelation)relation
{
    NSAssert(self.context != nil, @"Context not set");
    
    self.context.relation = relation;
    
    PVRelationPart* relationPart = [PVRelationPart new];
    relationPart.context = self.context;
    
    return relationPart;
}

@end



@implementation PVRelationPart

// TODO: implement relation part

@end



#pragma mark - Public Funtions

id<PVRelationSelect> PVLeftOf(UIView* view)
{
    NSCAssert(view != nil, @"PVLeftOf() argument should not be nil");
    
    PVLayout* constraint = [PVLayout new];
    constraint.context.leftView = view;
    constraint.context.leftAttribute = NSLayoutAttributeLeft;
    constraint.context.rightAtttributeMultiplier = 0.f;
    constraint.context.rightConstant = 0.f;
    
    PVRelationSelect* relation = [PVRelationSelect new];
    relation.context = constraint.context;
    
    return relation;
}

//
//  PVConstraintDebugContext.m
//  Parus
//
//  Created by Алексей Демедецкий on 12.07.14.
//
//

#import "PVConstraintDebugContext.h"

@interface PVConstraintDebugContext ()

@property (nonatomic, weak) PVConstraintDebugContext* parentContext;
@property (nonatomic, strong) NSMutableArray* childContextsContainer;

- (void)removeChildContext:(PVConstraintDebugContext*)childContext;


@end

@implementation PVConstraintDebugContext

- (id)init
{
    self = [super init];
    if (self == nil) return nil;
    
    self.childContextsContainer = [NSMutableArray new];
    
    return self;
}

#pragma mark - Context hierarchy support

- (NSArray *)childContexts
{
    return [self.childContextsContainer copy];
}

- (void)addChildContext:(PVConstraintDebugContext *)context
{
    NSParameterAssert(context != nil);
    
    [context removeFromParentContext];
    NSAssert(context.parentContext == nil, @"Removal is unseccussfull");
    
    [self.childContextsContainer addObject:context];
    context.parentContext = self;
}

- (void)removeFromParentContext
{
    [self.parentContext removeChildContext:self];
}

- (void)removeChildContext:(PVConstraintDebugContext *)childContext
{
    NSParameterAssert(childContext.parentContext == self);
    NSUInteger index = [self.childContextsContainer indexOfObject:childContext];
    NSAssert(index != NSNotFound, @"Context hiererchy is unsustainable.");
    
    [self.childContextsContainer removeObject:childContext];
    childContext.parentContext = nil;
}

#pragma mark - Description generation

@end

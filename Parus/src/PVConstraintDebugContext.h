//
//  PVConstraintDebugContext.h
//  Parus
//
//  Created by Алексей Демедецкий on 12.07.14.
//
//

#import <Foundation/Foundation.h>

#define PV_DEBUG

@interface PVConstraintDebugContext : NSObject

/// List of nested contexts. This list is immutable and just a copy of container.
@property (nonatomic, readonly) NSArray/*PVConstraintDebugContext*/ * childContexts;

/// Append context to list of childs. Context will be removed from other hiererchies first
- (void)addChildContext:(PVConstraintDebugContext*)context;

/// Remove context from parent list.
- (void)removeFromParentContext;

@end

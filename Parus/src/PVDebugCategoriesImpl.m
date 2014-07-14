//
//  PVDebugCategoriesImpl.m
//  Parus
//
//  Created by Алексей Демедецкий on 12.07.14.
//
//

#import "PVDebugCategoriesImpl.h"

/// For association object api
#import <objc/runtime.h>

#pragma mark - Single constraint

#import "PVSingleConstraintDebugContext.h"

@implementation NSLayoutConstraint (PVDebugContext)

- (NSString *)pv_description
{
    NSString* description = objc_getAssociatedObject(self, @selector(pv_description));
    if (description == nil) {
        description = @"Unknown";
    }
    
    return description;
}

@end

@implementation NSLayoutConstraint (PVDebugContextImpl)

- (void)attachDebugContext:(PVSingleConstraintDebugContext *)context
{
    NSString* description = [context buildDescription];
    
    objc_setAssociatedObject(self, @selector(pv_description),
                             description, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
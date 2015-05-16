//
//  PVSingleConstraintDebugContext.h
//  Parus
//
//  Created by Алексей Демедецкий on 12.07.14.
//
//

#import "PVConstraintDebugContext.h"

@interface PVSingleConstraintDebugContext : PVConstraintDebugContext

- (void)openWithView:(PVView*)view andAttribute:(NSLayoutAttribute)attribute;

- (void)appendSelector:(SEL)selector;
- (void)appendViewParameter:(PVView*)view;
- (void)appendFloatParameter:(CGFloat)paramter;
- (void)appendPriority:(PVLayoutPriority)priority;

- (NSString*)buildDescription;

@end

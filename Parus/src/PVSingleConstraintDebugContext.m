//
//  PVSingleConstraintDebugContext.m
//  Parus
//
//  Created by Алексей Демедецкий on 12.07.14.
//
//

#import "PVSingleConstraintDebugContext.h"

@interface PVSingleConstraintDebugContext ()

@property (nonatomic, strong) NSMutableString* descriptionContainer;

@end

@implementation PVSingleConstraintDebugContext

- (id)init
{
    self = [super init];
    if (self == nil) return nil;
    
    self.descriptionContainer = [NSMutableString new];
    
    return self;
}

- (NSString*)descriptionOfView:(PVView*)view
{
    NSString* address = [NSString stringWithFormat:@"%p", view];
    NSString* viewClass = NSStringFromClass([view class]);
    
    return [NSString stringWithFormat: @"<%@: %@>", viewClass, address];
}

- (void)openWithView:(PVView *)view andAttribute:(NSLayoutAttribute)attribute
{
    NSParameterAssert(view != nil);
    NSAssert(self.descriptionContainer.length == 0,
             @"Try to open non empty debug description: %@", self.descriptionContainer);
    
    
    NSString* attributeDescription = nil; {
        NSDictionary* map =
        @{ @(NSLayoutAttributeLeft): @"Left of",
           @(NSLayoutAttributeRight): @"Right of",
           @(NSLayoutAttributeTop): @"Top of",
           @(NSLayoutAttributeBottom): @"Bottom of",
           @(NSLayoutAttributeLeading): @"Leading of",
           @(NSLayoutAttributeTrailing): @"Trailing of",
           @(NSLayoutAttributeWidth): @"Width of",
           @(NSLayoutAttributeHeight): @"Height of",
           @(NSLayoutAttributeCenterX): @"Center X of",
           @(NSLayoutAttributeCenterY): @"Center Y of",
           @(NSLayoutAttributeBaseline): @"Baseline of",
           };
        
        attributeDescription = map[@(attribute)];
        NSAssert(attributeDescription != nil, @"Unknown attribute: %@", @(attribute));
    }

    [self.descriptionContainer appendFormat:@"%@ %@", attributeDescription, [self descriptionOfView:view]];
}

- (void)appendSelector:(SEL)selector
{
    NSString* stringRepresentation = NSStringFromSelector(selector);
    NSAssert(stringRepresentation != nil, @"Cannot extract string from selector.");
    
    [self.descriptionContainer appendFormat:@" %@", stringRepresentation];
}

- (void)appendViewParameter:(PVView *)view
{
    NSParameterAssert(view != nil);
    [self.descriptionContainer appendFormat:@" %@", [self descriptionOfView:view]];
}

- (void)appendFloatParameter:(CGFloat)paramter
{
    [self.descriptionContainer appendFormat:@" %@", @(paramter)];
}

- (void)appendPriority:(PVLayoutPriority)priority
{
    [self appendFloatParameter:priority];
}

- (NSString *)buildDescription
{
    return [self.descriptionContainer copy];
}

@end

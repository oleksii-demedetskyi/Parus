//
//  PVVFL.m
//  Parus
//
//  Created by Andrey Moskvin on 6/21/13.
//
//

#import "PVVFL.h"
#import "PVVFLContext.h"

@interface PVVFLLayout : NSObject

@property (strong) PVVFLContext* context;

@end

@implementation PVVFLLayout

-(instancetype)init
{
    self = [super init];
    if (self != nil)
    {
        _context = [PVVFLContext new];
    }
    return self;
}

@end

@interface PVVFLLayout (PVAlignmentOptionSelect) <PVAlignmentOptionSelect>

@end

@interface PVVFLLayout (DirectionOptionSelect) <PVDirectionOptionSelect>

@end

@interface PVVFLLayout (ViewsPart) <PVViewsPart>

@end

@interface PVVFLLayout (MetricsPart) <PVMetricsPart>

@end

@interface PVVFLLayout (ArrayConstrainable) <PVArrayConstrainable>

@end

@implementation PVVFLLayout (DirectionOptionSelect)

-(NSObject<PVViewsPart> *)fromLeadingToTrailing
{
    return [self directionOptionPart:NSLayoutFormatDirectionLeadingToTrailing];
}

-(NSObject<PVViewsPart> *)fromLeftToRight
{
    return [self directionOptionPart:NSLayoutFormatDirectionLeftToRight];
}

-(NSObject<PVViewsPart> *)fromRightToLeft
{
    return [self directionOptionPart:NSLayoutFormatDirectionRightToLeft];
}

-(NSObject<PVViewsPart> *)directionOptionPart:(NSLayoutFormatOptions)options
{
    NSAssert(self.context != nil, @"Context is not set");
    
    self.context.directionOptions = options;
    
    return self;
}

@end

@implementation PVVFLLayout (PVAlignmentOptionSelect)

-(NSObject<PVDirectionOptionSelect> *)alignAllLeft
{
    return [self alignmentOptionPart:NSLayoutFormatAlignAllLeft];
}

-(NSObject<PVDirectionOptionSelect> *)alignAllRight
{
    return [self alignmentOptionPart:NSLayoutFormatAlignAllRight];
}

-(NSObject<PVDirectionOptionSelect> *)alignAllTop
{
    return [self alignmentOptionPart:NSLayoutFormatAlignAllTop];
}

-(NSObject<PVDirectionOptionSelect> *)alignAllBottom
{
    return [self alignmentOptionPart:NSLayoutFormatAlignAllBottom];
}

-(NSObject<PVDirectionOptionSelect> *)alignAllLeading
{
    return [self alignmentOptionPart:NSLayoutFormatAlignAllLeading];
}

-(NSObject<PVDirectionOptionSelect> *)alignAllTrailing
{
    return [self alignmentOptionPart:NSLayoutFormatAlignAllTrailing];
}

-(NSObject<PVDirectionOptionSelect> *)alignAllCenterX
{
    return [self alignmentOptionPart:NSLayoutFormatAlignAllCenterX];
}

-(NSObject<PVDirectionOptionSelect> *)alignAllCenterY
{
    return [self alignmentOptionPart:NSLayoutFormatAlignAllCenterY];
}

-(NSObject<PVDirectionOptionSelect> *)alignAllBaseline
{
    return [self alignmentOptionPart:NSLayoutFormatAlignAllBaseline];
}

-(NSObject<PVDirectionOptionSelect> *)alignmentOptionPart:(NSLayoutFormatOptions)options
{
    NSAssert(self.context != nil, @"Context is not set");
    
    self.context.alignmentOptions = options;
    
    return self;
}

@end

@implementation PVVFLLayout (ViewsPart)

-(PVViewsPartBlock)withViews
{
    return ^(NSDictionary* views)
    {
        NSAssert(self.context != nil, @"Context is not set");
        
        self.context.views = views;
        
        return self;
    };
}

@end

@implementation PVVFLLayout (MetricsPart)

-(PVMetricsBlock)metrics
{
    return ^(NSDictionary *metrics)
    {
        NSAssert(self.context != nil, @"Context is not set");
        
        self.context.metrics = metrics;
        
        return self;
    };
}

@end

@implementation PVVFLLayout (ArrayConstrainable)

-(NSArray *)asArray
{
    NSAssert(self.context != nil, @"Context is not set");

    return [self.context buildConstraints];
}

@end

NSObject<PVAlignmentOptionSelect>* PVVFL(NSString* format)
{
    NSCAssert([format isKindOfClass:[NSString class]], @"Format should be NSString");

    PVVFLLayout* layout = [PVVFLLayout new];
    layout.context.format = format;
    
    return layout;
}   
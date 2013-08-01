//
//  PVVFL.m
//  Parus
//
//  Created by Andrey Moskvin on 6/21/13.
//
//

#import "PVVFL.h"

PVVFL* vfl(NSString* format)
{
    PVVFL* vfl = [[PVVFL alloc] initWithFormat:format];
    return vfl;
}

@interface PVVFLContext : NSObject

@property(nonatomic, strong) NSString* format;
@property(nonatomic) NSLayoutFormatOptions options;
@property(nonatomic, strong) NSDictionary* metrics;
@property(nonatomic, strong) NSDictionary* views;

@end

@implementation PVVFLContext

@end

@interface PVVFLOptions ()

@property(nonatomic, strong) PVVFLContext* context;

@end

@interface PVVFLMetrics ()

@property(nonatomic, strong) PVVFLContext* context;

@end

@interface PVVFLBuilder ()

@property(nonatomic, strong) PVVFLContext* context;

@end

@interface PVVFL ()

@property(nonatomic, readonly) PVVFLContext* context;

@end

@implementation PVVFL

- (instancetype)initWithFormat:(NSString *)format
{
    self = [super init];
    if (self)
    {
        _context = [PVVFLContext new];
        _context.format = format;
    }
    return self;
}

-(PVVFLOptionsBlock)options
{
    NSAssert(self.context != nil, @"Context have to be set!");
    return ^(NSLayoutFormatOptions options)
    {
        self.context.options = options;
        
        PVVFLOptions* vflOptions = [PVVFLOptions new];
        vflOptions.context = self.context;
        
        return vflOptions;
    };
}

@end

@implementation PVVFLOptions

-(PVVFLMetricsBlock)withMetrics
{
    NSAssert(self.context != nil, @"Context have to be set!");
    return ^(NSDictionary* metrics)
    {
        self.context.metrics = metrics;
        
        PVVFLMetrics* vflMetrics = [PVVFLMetrics new];
        vflMetrics.context = self.context;
        return vflMetrics;
    };
}

@end

@implementation PVVFLMetrics

-(PVVFLViews)andViews
{
    NSAssert(self.context != nil, @"Context have to be set!");
    return ^(NSDictionary* views)
    {
        self.context.views = views;
        
        PVVFLBuilder* builder = [PVVFLBuilder new];
        builder.context = self.context;
        
        return builder;
    };
}

@end

@implementation PVVFLBuilder

-(NSArray *)asConstraints
{
    NSAssert(self.context != nil, @"Context have to be set!");

    NSArray* constraints = [NSLayoutConstraint   constraintsWithVisualFormat:self.context.format
                                                                     options:self.context.options
                                                                     metrics:self.context.metrics
                                                                       views:self.context.views];
    return constraints;
}

@end
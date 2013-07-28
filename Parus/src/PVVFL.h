//
//  PVVFL.h
//  Parus
//
//  Created by Andrey Moskvin on 6/21/13.
//
//

#import <Foundation/Foundation.h>


@class PVVFL;
PVVFL* vfl(NSString* format);

@class PVVFLOptions;
typedef PVVFLOptions*(^PVVFLOptionsBlock)(NSLayoutFormatOptions);
@interface PVVFL : NSObject

@property(nonatomic, readonly) PVVFLOptionsBlock options;

- (instancetype)initWithFormat:(NSString *)format;

@end

@class PVVFLMetrics;

typedef PVVFLMetrics*(^PVVFLMetricsBlock)(NSDictionary*);
@interface PVVFLOptions : NSObject

@property(nonatomic, readonly) PVVFLMetricsBlock withMetrics;

@end

@class PVVFLBuilder;

typedef PVVFLBuilder*(^PVVFLViews)(NSDictionary*);
@interface PVVFLMetrics : NSObject

@property(nonatomic, readonly) PVVFLViews andViews;

@end

@interface PVVFLBuilder : NSObject

@property(nonatomic, readonly) NSArray* asConstraints;

@end
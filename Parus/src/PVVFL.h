//
//  PVVFL.h
//  Parus
//
//  Created by Andrey Moskvin on 6/21/13.
//
//

#import <Foundation/Foundation.h>

@protocol PVDirectionOptionSelect, PVAlignmentOptionSelect, PVArrayConstrainable, PVViewsPart, PVMetricsPart;

NSObject<PVAlignmentOptionSelect>* PVVFL(NSString* format);

@protocol PVAlignmentOptionSelect <PVDirectionOptionSelect, PVViewsPart, PVArrayConstrainable>

@property (readonly) NSObject<PVDirectionOptionSelect>* alignAllLeft;
@property (readonly) NSObject<PVDirectionOptionSelect>* alignAllRight;
@property (readonly) NSObject<PVDirectionOptionSelect>* alignAllTop;
@property (readonly) NSObject<PVDirectionOptionSelect>* alignAllBottom;
@property (readonly) NSObject<PVDirectionOptionSelect>* alignAllLeading;
@property (readonly) NSObject<PVDirectionOptionSelect>* alignAllTrailing;
@property (readonly) NSObject<PVDirectionOptionSelect>* alignAllCenterX;
@property (readonly) NSObject<PVDirectionOptionSelect>* alignAllCenterY;
@property (readonly) NSObject<PVDirectionOptionSelect>* alignAllBaseline;

@end

@protocol PVViewsPart;

@protocol PVDirectionOptionSelect <PVViewsPart, PVArrayConstrainable>

@property (readonly) NSObject<PVViewsPart>* fromLeadingToTrailing;
@property (readonly) NSObject<PVViewsPart>* fromLeftToRight;
@property (readonly) NSObject<PVViewsPart>* fromRightToLeft;

@end

@protocol PVMetricsPart;
typedef  NSObject<PVMetricsPart>*(^PVViewsPartBlock)(NSDictionary* views);

@protocol PVViewsPart <PVMetricsPart, PVArrayConstrainable>

@property (readonly) PVViewsPartBlock withViews;

@end

typedef NSObject<PVArrayConstrainable>*(^PVMetricsBlock)(NSDictionary* metrics);

@protocol PVMetricsPart <PVArrayConstrainable>

@property (readonly) PVMetricsBlock metrics;

@end

@protocol PVArrayConstrainable <NSObject>

@property (readonly) NSArray* asArray;

@end
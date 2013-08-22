//
//  PVVFL.h
//  Parus
//
//  Created by Andrey Moskvin on 6/21/13.
//
//

#import <Foundation/Foundation.h>

@protocol
    _PVDirectionOptionSelect,
    _PVAlignmentOptionSelect,
    _PVArrayConstrainable,
    _PVViewsPart,
    _PVMetricsPart;

NSObject<_PVAlignmentOptionSelect>* PVVFL(NSString* format);

@protocol _PVAlignmentOptionSelect <_PVDirectionOptionSelect, _PVViewsPart, _PVArrayConstrainable>

@property (readonly) NSObject<_PVDirectionOptionSelect>* alignAllLeft;
@property (readonly) NSObject<_PVDirectionOptionSelect>* alignAllRight;
@property (readonly) NSObject<_PVDirectionOptionSelect>* alignAllTop;
@property (readonly) NSObject<_PVDirectionOptionSelect>* alignAllBottom;
@property (readonly) NSObject<_PVDirectionOptionSelect>* alignAllLeading;
@property (readonly) NSObject<_PVDirectionOptionSelect>* alignAllTrailing;
@property (readonly) NSObject<_PVDirectionOptionSelect>* alignAllCenterX;
@property (readonly) NSObject<_PVDirectionOptionSelect>* alignAllCenterY;
@property (readonly) NSObject<_PVDirectionOptionSelect>* alignAllBaseline;

@end


@protocol _PVViewsPart;

@protocol _PVDirectionOptionSelect <_PVViewsPart, _PVArrayConstrainable>

@property (readonly) NSObject<_PVViewsPart>* fromLeadingToTrailing;
@property (readonly) NSObject<_PVViewsPart>* fromLeftToRight;
@property (readonly) NSObject<_PVViewsPart>* fromRightToLeft;

@end


@protocol _PVMetricsPart;
typedef  NSObject<_PVMetricsPart>*(^_PVViewsPartBlock)(NSDictionary* views);


@protocol _PVViewsPart <_PVMetricsPart, _PVArrayConstrainable>

@property (readonly) _PVViewsPartBlock withViews;

@end


typedef NSObject<_PVArrayConstrainable>*(^_PVMetricsBlock)(NSDictionary* metrics);
@protocol _PVMetricsPart <_PVArrayConstrainable>

@property (readonly) _PVMetricsBlock metrics;

@end


@protocol _PVArrayConstrainable <NSObject>

@property (readonly) NSArray* asArray;

@end
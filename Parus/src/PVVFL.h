//
//  PVVFL.h
//  Parus
//
//  Created by Andrey Moskvin on 6/21/13.
//
//

#import <Foundation/Foundation.h>

// PVVFL() allows to build constraints using Visual Format Language.
//
// Description could be found on wiki: https://github.com/DAlOG/Parus/wiki/PVVFL()-description

// Constraints are built with this method:
// + (NSArray *)constraintsWithVisualFormat:(NSString *)format
//                                  options:(NSLayoutFormatOptions)opts
//                                  metrics:(NSDictionary *)metrics
//                                    views:(NSDictionary *)views;
//
// By default method params are set to:
// opts is set to NSLayoutFormatDirectionLeadingToTrailing
// views is set to nil
// metrics is set to nil

@protocol
    _PVDirectionOptionSelect,
    _PVAlignmentOptionSelect,
    _PVArrayConstrainable,
    _PVViewsPart,
    _PVMetricsPart;

// Start function that receives NSString object with VFL and set its to the format.
NSObject<_PVAlignmentOptionSelect>* PVVFL(NSString* format);

// Protocol that describes alignment part of NSLayoutFormatOptions.
@protocol _PVAlignmentOptionSelect <_PVDirectionOptionSelect, _PVViewsPart, _PVArrayConstrainable>

// Adds NSLayoutFormatAlignAllLeft to options.
@property (readonly) NSObject<_PVDirectionOptionSelect>* alignAllLeft;

// Adds NSLayoutFormatAlignAllRight to options.
@property (readonly) NSObject<_PVDirectionOptionSelect>* alignAllRight;

// Adds NSLayoutFormatAlignAllTop to options.
@property (readonly) NSObject<_PVDirectionOptionSelect>* alignAllTop;

// Adds NSLayoutFormatAlignAllBottom to options.
@property (readonly) NSObject<_PVDirectionOptionSelect>* alignAllBottom;

// Adds NSLayoutFormatAlignAllLeading to options.
@property (readonly) NSObject<_PVDirectionOptionSelect>* alignAllLeading;

// Adds NSLayoutFormatAlignAllTrailing to options.
@property (readonly) NSObject<_PVDirectionOptionSelect>* alignAllTrailing;

// Adds NSLayoutFormatAlignAllCenterX to options.
@property (readonly) NSObject<_PVDirectionOptionSelect>* alignAllCenterX;

// Adds NSLayoutFormatAlignAllCenterY to options.
@property (readonly) NSObject<_PVDirectionOptionSelect>* alignAllCenterY;

// Adds NSLayoutFormatAlignAllBaseline to options.
@property (readonly) NSObject<_PVDirectionOptionSelect>* alignAllBaseline;

@end


@protocol _PVViewsPart;

// Protocol that describes direction option of NSLayoutFormatOptions.
@protocol _PVDirectionOptionSelect <_PVViewsPart, _PVArrayConstrainable>

// Adds NSLayoutFormatDirectionLeadingToTrailing to options.
@property (readonly) NSObject<_PVViewsPart>* fromLeadingToTrailing;

// Adds NSLayoutFormatDirectionLeftToRight to options.
@property (readonly) NSObject<_PVViewsPart>* fromLeftToRight;

// Adds NSLayoutFormatDirectionRightToLeft to options.
@property (readonly) NSObject<_PVViewsPart>* fromRightToLeft;

@end


@protocol _PVMetricsPart;
typedef  NSObject<_PVMetricsPart>*(^_PVViewsPartBlock)(NSDictionary* views);

// Protocol that describes views part that are specified in VFL string.
@protocol _PVViewsPart <_PVMetricsPart, _PVArrayConstrainable>

// Sets passed views dictionary to the views part of constraints.
@property (readonly) _PVViewsPartBlock withViews;

@end


typedef NSObject<_PVArrayConstrainable>*(^_PVMetricsBlock)(NSDictionary* metrics);

// Protocol that describes metrics part that are specified in VFL string.
@protocol _PVMetricsPart <_PVArrayConstrainable>

// Sets passed metrics dictionary to the metrics part of constraints.
@property (readonly) _PVMetricsBlock metrics;

@end

// Protocol that allows to finish constraint building and receive an array of NSLayoutConstraint objects.
@protocol _PVArrayConstrainable <NSObject>

// Returns array of constraints.
@property (readonly) NSArray* asArray;

@end
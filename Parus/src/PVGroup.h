//
//  PVGroup.h
//  Parus
//
//  Created by Алексей Демедецкий on 10.08.13.
//
//

#import <Foundation/Foundation.h>

@protocol _PVGroupProtocol;

NSObject<_PVGroupProtocol>* PVGroup(NSArray* array);


@protocol _PVGroupArrayConversionProtocol <NSObject>

@property (readonly) NSArray* asArray;

@end


typedef NSObject<_PVGroupArrayConversionProtocol>* _PVGroupWithMetricsResult;
typedef _PVGroupWithMetricsResult(^_PVGroupWithMetricsBlock)(NSDictionary*);
@protocol _PVGroupWithMetricsProtocol <NSObject>

@property (readonly) _PVGroupWithMetricsBlock withMetrics;

@end


typedef NSObject
        <
            _PVGroupArrayConversionProtocol,
            _PVGroupWithMetricsProtocol
        >* _PVGroupWithViewsResult;
typedef _PVGroupWithViewsResult(^_PVGroupWithViewsBlock)(NSDictionary*);
@protocol _PVGroupWithViewsProtocol <NSObject>

@property (readonly) _PVGroupWithViewsBlock withViews;

@end


typedef NSObject
        <
            _PVGroupArrayConversionProtocol,
            _PVGroupWithViewsProtocol,
            _PVGroupWithMetricsProtocol
        > *
        _PVGroupDiretionChooseResult;
@protocol _PVGroupDirectionChooseProtocol <NSObject>

@property (readonly) _PVGroupDiretionChooseResult fromLeftToRight;
@property (readonly) _PVGroupDiretionChooseResult fromRightToLeft;
@property (readonly) _PVGroupDiretionChooseResult fromLeadingToTrailing;

@end



@protocol _PVGroupProtocol
<
    NSObject,
    _PVGroupDirectionChooseProtocol,
    _PVGroupArrayConversionProtocol,
    _PVGroupWithViewsProtocol,
    _PVGroupWithMetricsProtocol
>

@end



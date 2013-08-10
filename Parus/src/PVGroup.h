//
//  PVGroup.h
//  Parus
//
//  Created by Алексей Демедецкий on 10.08.13.
//
//

#import <Foundation/Foundation.h>

@protocol PVGroupProtocol;

NSObject<PVGroupProtocol>* PVGroup(NSArray* array);


@protocol PVGroupArrayConversionProtocol <NSObject>

@property (readonly) NSArray* asArray;

@end


typedef NSObject<PVGroupArrayConversionProtocol>* PVGroupWithMetricsResult;
typedef PVGroupWithMetricsResult(^PVGroupWithMetricsBlock)(NSDictionary*);
@protocol PVGroupWithMetricsProtocol <NSObject>

@property (readonly) PVGroupWithMetricsBlock withMetrics;

@end

typedef NSObject
        <
            PVGroupArrayConversionProtocol,
            PVGroupWithMetricsProtocol
        >* PVGroupWithViewsResult;
typedef PVGroupWithViewsResult(^PVGroupWithViewsBlock)(NSDictionary*);
@protocol PVGroupWithViewsProtocol <NSObject>

@property (readonly) PVGroupWithViewsBlock withViews;

@end


typedef NSObject
        <
            PVGroupArrayConversionProtocol,
            PVGroupWithViewsProtocol,
            PVGroupWithMetricsProtocol
        > *
        PVGroupDiretionChooseResult;
@protocol PVGroupDirectionChooseProtocol <NSObject>

@property (readonly) PVGroupDiretionChooseResult fromLeftToRight;
@property (readonly) PVGroupDiretionChooseResult fromRightToLeft;
@property (readonly) PVGroupDiretionChooseResult fromLeadingToTrailing;

@end

@protocol PVGroupProtocol
<
    NSObject,
    PVGroupDirectionChooseProtocol,
    PVGroupArrayConversionProtocol,
    PVGroupWithViewsProtocol,
    PVGroupWithMetricsProtocol
>

@end



@interface PVGroupImp : NSObject

@end



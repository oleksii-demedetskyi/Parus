#import "PVGroup.h"

SpecBegin(PVGroup)

describe(@"PVGroup syntax", ^{
    it(@"should accept literal array", ^{
        id r = PVGroup(@[]);
        expect(r).toNot.beNil;
    });
    
    it(@"should be convertable to array", ^{
        id r = PVGroup(@[]).asArray;
        expect(r).beKindOf([NSArray class]);
    });
    
    it(@"should allow setting group direction", ^{
        expect(PVGroup(@[]).fromLeftToRight).toNot.beNil;
        expect(PVGroup(@[]).fromRightToLeft).toNot.beNil;
        expect(PVGroup(@[]).fromLeadingToTrailing).toNot.beNil;
    });
    
    it(@"shoud be convertable to array after direction", ^{
        expect(PVGroup(@[]).fromLeadingToTrailing.asArray).beKindOf([NSArray class]);
        expect(PVGroup(@[]).fromLeftToRight.asArray).beKindOf([NSArray class]);
        expect(PVGroup(@[]).fromRightToLeft.asArray).beKindOf([NSArray class]);
    });
    
    it(@"should allow to set common views", ^{
        expect(PVGroup(@[]).withViews(@{})).toNot.beNil;
    });
    
    it(@"should allow conversion to array after views setting", ^{
        expect(PVGroup(@[]).withViews(@{}).asArray).beKindOf([NSArray class]);
    });
    
    it(@"should allow to set common views after direction", ^{
        expect(PVGroup(@[]).fromLeftToRight.withViews(@{})).toNot.beNil;
        expect(PVGroup(@[]).fromRightToLeft.withViews(@{})).toNot.beNil;
        expect(PVGroup(@[]).fromLeadingToTrailing.withViews(@{})).toNot.beNil;
    });
    
    it(@"should allow to [-> direction -> commonViews -> asArray]", ^{
        expect(PVGroup(@[]).fromLeftToRight.withViews(@{}).asArray).beKindOf([NSArray class]);
        expect(PVGroup(@[]).fromRightToLeft.withViews(@{}).asArray).beKindOf([NSArray class]);
        expect(PVGroup(@[]).fromLeadingToTrailing.withViews(@{}).asArray).beKindOf([NSArray class]);
    });
    
    it(@"should allow to set metrics", ^{
        expect(PVGroup(@[]).withMetrics(@{})).toNot.beNil;
    });
    
    it(@"should allow conversion to array after metrics", ^{
        expect(PVGroup(@[]).withMetrics(@{}).asArray).beKindOf([NSArray class]);
    });
    
    it(@"should allow set metrics after views", ^{
        expect(PVGroup(@[]).withViews(@{}).withMetrics(@{})).toNot.beNil;
    });
    
    it(@"should allow conversion to array after views and metrics setting", ^{
        expect(PVGroup(@[]).withViews(@{}).withMetrics(@{}).asArray).beKindOf([NSArray class]);
    });
    
    it(@"should allow to set common metrics after direction", ^{
        expect(PVGroup(@[]).fromLeftToRight.withMetrics(@{})).toNot.beNil;
        expect(PVGroup(@[]).fromRightToLeft.withMetrics(@{})).toNot.beNil;
        expect(PVGroup(@[]).fromLeadingToTrailing.withMetrics(@{})).toNot.beNil;
    });
    
    it(@"should allow to [-> direction -> metrics -> asArray]", ^{
        expect(PVGroup(@[]).fromLeftToRight.withMetrics(@{}).asArray).beKindOf([NSArray class]);
        expect(PVGroup(@[]).fromRightToLeft.withMetrics(@{}).asArray).beKindOf([NSArray class]);
        expect(PVGroup(@[]).fromLeadingToTrailing.withMetrics(@{}).asArray).beKindOf([NSArray class]);
    });
    
    it(@"should allow to set common views after direction", ^{
        expect(PVGroup(@[]).fromLeftToRight.withViews(@{}).withMetrics(@{})).toNot.beNil;
        expect(PVGroup(@[]).fromRightToLeft.withViews(@{}).withMetrics(@{})).toNot.beNil;
        expect(PVGroup(@[]).fromLeadingToTrailing.withViews(@{}).withMetrics(@{})).toNot.beNil;
    });
    
    it(@"should allow to [-> direction -> views -> metrics -> asArray]", ^{
        expect(PVGroup(@[]).fromLeftToRight.withViews(@{}).withMetrics(@{}).asArray)
        .beKindOf([NSArray class]);
        
        expect(PVGroup(@[]).fromRightToLeft.withViews(@{}).withMetrics(@{}).asArray)
        .beKindOf([NSArray class]);
        
        expect(PVGroup(@[]).fromLeadingToTrailing.withViews(@{}).withMetrics(@{}).asArray)
        .beKindOf([NSArray class]);
    });
});

describe(@"PVGroup data conversion", ^{
    it(@"should return array from single array of constraints", ^{
        
    });
    it(@"should return array from several indepenedend constraints", ^{
       
    });
    it(@"should return empty array from empty input", ^{
        
    });
});

SpecEnd
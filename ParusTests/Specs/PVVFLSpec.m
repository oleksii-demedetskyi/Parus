#import "PVVFL.h"

SpecBegin(PVVFL)

describe(@"PVVFL", ^{
    __block UIView* view1 = nil;
    __block UIView* view2 = nil;
    
    beforeEach(^{
        view1 = [UIView new];
        view2 = [UIView new];
        UIView* container = [UIView new];
        [container addSubview:view1];
        [container addSubview:view2];
    });
  
    it(@"should create constraints", ^{
        expect(PVVFL(@"|-50-[view1]-50-|").alignAllTop.withViews(NSDictionaryOfVariableBindings(view1)).asArray);
    });
});

SpecEnd
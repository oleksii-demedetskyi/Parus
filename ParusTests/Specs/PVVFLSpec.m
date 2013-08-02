#import "PVVFL.h"

SpecBegin(PVVFL)

describe(@"PVVFL", ^{
    __block UIView* view1 = nil;
    __block UIView* view2 = nil;
    
    before(^{
        view1 = [UIView new];
        view2 = [UIView new];
        UIView* container = [UIView new];
        [container addSubview:view1];
        [container addSubview:view2];
    });
  
    
    it(@"should create constraints", ^{
        expect(PVVFL(@"[view1][view2]").withViews(NSDictionaryOfVariableBindings(view1,view2)).asArray).toNot.beNil();
        
        expect(PVVFL(@"[view1][view2]").alignAllTop.fromLeadingToTrailing.withViews(NSDictionaryOfVariableBindings(view1,view2)).metrics(nil).asArray).toNot.beNil();
    });
});

SpecEnd
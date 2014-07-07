#import "PVVFL.h"

SpecBegin(PVVFL)

describe(@"PVVFL", ^{
    __block PVView* view1 = nil;
    __block PVView* view2 = nil;
    __block PVView* container = nil;
    
    beforeEach(^{
        view1 = [PVView new];
        view2 = [PVView new];
        container = [PVView new];
        [container addSubview:view1];
        [container addSubview:view2];
    });
    
    it(@"should create constraints", ^{
        expect(PVVFL(@"|-50-[view1]-50-|").withViews(NSDictionaryOfVariableBindings(view1)).asArray).toNot.beNil();
        expect(PVVFL(@"[view1(==view2)]").fromLeadingToTrailing.withViews(NSDictionaryOfVariableBindings(view1, view2)).asArray).toNot.beNil();
        
        expect(PVVFL(@"|[view1]-20-[view2]|").withViews(NSDictionaryOfVariableBindings(view1, view2)).asArray).toNot.beNil();
        expect(PVVFL(@"V:|-20-[view1]-20-|").fromLeftToRight.withViews(NSDictionaryOfVariableBindings(view1)).asArray).toNot.beNil();
        expect(PVVFL(@"V:|[view1]-20-[view2]|").alignAllLeft.fromLeadingToTrailing.withViews(NSDictionaryOfVariableBindings(view1, view2)).asArray).toNot.beNil();
        
        expect(PVVFL(@"[view1(>=width)]").withViews(NSDictionaryOfVariableBindings(view1)).metrics(@{@"width" : @200}).asArray).toNot.beNil();
    });
    
    it(@"should produce simple constraint", ^{
        NSDictionary* views = NSDictionaryOfVariableBindings(view1, view2);
        
        NSLayoutConstraint* expected =
        [[NSLayoutConstraint constraintsWithVisualFormat:@"[view1]-20-[view2]"
                                                 options:NSLayoutFormatDirectionRightToLeft
                                                 metrics:nil
                                                   views:views] lastObject];
        NSLayoutConstraint* actual =
        [PVVFL(@"[view1]-20-[view2]").fromRightToLeft.withViews(views).asArray lastObject];
        
        expect(actual.firstItem).to.equal(expected.firstItem);
        expect(actual.firstAttribute).to.equal(expected.firstAttribute);
        expect(actual.relation).to.equal(expected.relation);
        expect(actual.secondItem).to.equal(expected.secondItem);
        expect(actual.secondAttribute).to.equal(expected.secondAttribute);

        
    });
    
    it(@"should produce constraints with formatting option mask", ^{
        NSDictionary* views = NSDictionaryOfVariableBindings(view1, view2);
        
        NSArray* expected = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view1]-20-[view2]"
                                                                    options:(NSLayoutFormatAlignAllLeft | NSLayoutFormatAlignAllRight)
                                                                    metrics:nil
                                                                      views:views];
        NSLayoutConstraint* lastExpected = expected.lastObject;
        NSArray* actual = PVVFL(@"V:[view1]-20-[view2]").alignAllLeftAndRight.withViews(views).asArray;
        NSLayoutConstraint* lastActual = actual.lastObject;
        
        expect(actual.count).to.equal(expected.count);
        expect(lastActual.firstItem).to.equal(lastExpected.firstItem);
        expect(lastActual.firstAttribute).to.equal(lastExpected.firstAttribute);
        expect(lastActual.relation).to.equal(lastExpected.relation);
        expect(lastActual.secondItem).to.equal(lastExpected.secondItem);
        expect(lastActual.secondAttribute).to.equal(lastExpected.secondAttribute);
    });
    
    it(@"should not be equal if different masks", ^{
        NSDictionary* views = NSDictionaryOfVariableBindings(view1, view2);
        
        NSArray* expected = [NSLayoutConstraint constraintsWithVisualFormat:@"V:[view1]-20-[view2]"
                                                                    options:(NSLayoutFormatAlignAllLeft | NSLayoutFormatAlignAllRight)
                                                                    metrics:nil
                                                                      views:views];
        NSLayoutConstraint* lastExpected = expected.lastObject;
        NSArray* actual = PVVFL(@"V:[view1]-20-[view2]").alignAllLeadingAndTrailing.withViews(views).asArray;
        NSLayoutConstraint* lastActual = actual.lastObject;
        
        expect(actual.count).to.equal(expected.count);
        expect(lastActual.firstItem).to.equal(lastExpected.firstItem);
        expect(lastActual.firstAttribute).toNot.equal(lastExpected.firstAttribute);
        expect(lastActual.relation).to.equal(lastExpected.relation);
        expect(lastActual.secondItem).to.equal(lastExpected.secondItem);
        expect(lastActual.secondAttribute).toNot.equal(lastExpected.secondAttribute);
    });
});

SpecEnd

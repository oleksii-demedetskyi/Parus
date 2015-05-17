@import Specta;
@import Expecta;
#import "PVLayout.h"
#import "PVConstraintContext.h"
#import "PVView+PVConvenientShorthands.h"

SpecBegin(PVSpec)

describe(@"PVLayout", ^{
    it(@"should raise when argument is nil not of PVView class", ^{
        expect(^{
            PVLeftOf(nil);
        }).to.raiseAny();
        
        expect(^{
            PVLeftOf((id)[NSObject new]);
        }).to.raiseAny();
    });
    
    describe(@"constraints without right item", ^{
        __block PVView* view1 = nil;
        __block PVView* view2 = nil;
        
        beforeEach(^{
            view1 = [PVView new];
            view2 = [PVView new];
        });
        
        it(@"should return valid constraint", ^{
            NSLayoutConstraint* constraint = PVWidthOf(view1).equalTo.constant(20.f).asConstraint;
            
            expect(constraint).toNot.beNil();
            expect(constraint).to.beInstanceOf([NSLayoutConstraint class]);
            
            expect(constraint.firstItem).to.equal(view1);
            expect(constraint.firstAttribute).to.equal(NSLayoutAttributeWidth);
            expect(constraint.relation).to.equal(NSLayoutRelationEqual);
            expect(constraint.secondItem).to.beNil();
            expect(constraint.secondAttribute).to.equal(NSLayoutAttributeNotAnAttribute);
            expect(constraint.multiplier).to.equal(1.f);
            expect(constraint.constant).to.equal(20.f);
        });
    });
    
    describe(@"constraint of attreibutes equality of two items ", ^{
        __block PVView* view1 = nil;
        __block PVView* view2 = nil;
        
        beforeEach(^{
            view1 = [PVView new];
            view2 = [PVView new];
        });
        
        it(@"should return valid constraint", ^{
            NSLayoutConstraint* constraint = PVLeftOf(view1).equalTo.leftOf(view2).multipliedTo(2.f).minus(20.f).withPriority(PVLayoutPriorityFittingSizeLevel).asConstraint;
            
            expect(constraint).toNot.beNil();
            expect(constraint).to.beInstanceOf([NSLayoutConstraint class]);
            
            expect(constraint.firstItem).to.equal(view1);
            expect(constraint.firstAttribute).to.equal(NSLayoutAttributeLeft);
            expect(constraint.relation).to.equal(NSLayoutRelationEqual);
            expect(constraint.secondItem).to.equal(view2);
            expect(constraint.secondAttribute).to.equal(NSLayoutAttributeLeft);
            expect(constraint.multiplier).to.equal(2.f);
            expect(constraint.constant).to.equal(-20.f);
        });
        
        it(@"should raise when view2 is not a PVView", ^{
            expect(^{
                PVLeftOf(view1).equalTo.leftOf((id)[NSObject new]);
            }).to.raiseAny();
        });
        
        it(@"should raise when view2 is nil", ^{
            expect(^{
                PVWidthOf(view1).equalTo.widthOf(nil);
            }).to.raiseAny();
        });
    });
    
    describe(@"view category", ^{
        __block PVView* view1 = nil;
        __block PVView* view2 = nil;
        
        beforeEach(^{
            view1 = [PVView new];
            view2 = [PVView new];
        });
        
        it(@"should return valid constraint", ^{
            NSLayoutConstraint* constraint = view1.pv_left.equalTo.leftOf(view2).multipliedTo(2.f).minus(20.f).withPriority(PVLayoutPriorityFittingSizeLevel).asConstraint;
            
            expect(constraint).toNot.beNil();
            expect(constraint).to.beInstanceOf([NSLayoutConstraint class]);
            
            expect(constraint.firstItem).to.equal(view1);
            expect(constraint.firstAttribute).to.equal(NSLayoutAttributeLeft);
            expect(constraint.relation).to.equal(NSLayoutRelationEqual);
            expect(constraint.secondItem).to.equal(view2);
            expect(constraint.secondAttribute).to.equal(NSLayoutAttributeLeft);
            expect(constraint.multiplier).to.equal(2.f);
            expect(constraint.constant).to.equal(-20.f);
        });
    });
    
});

SpecEnd

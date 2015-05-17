@import Specta;
@import Expecta;
@import Parus;

SpecBegin(ConstraintContextSpec)

describe(@"Constraint Context", ^{
    __block PVConstraintContext* context = nil;
    __block PVView* view1 = nil;
    __block PVView* view2 = nil;
    
    beforeEach(^{
        context = [PVConstraintContext new];
        view1 = [PVView new];
        view2 = [PVView new];
    });
    
    it(@"should have constraint built", ^{        
        context.leftView = view1;
        context.leftAttribute = NSLayoutAttributeLeft;
        context.relation = NSLayoutRelationEqual;
        context.rightView = view2;
        context.rightAttribute = NSLayoutAttributeRight;
        context.rightAtttributeMultiplier = 1.0f;
        context.rightConstant = 10.0f;
        context.priority = PVLayoutPriorityDefaultLow;
        
        NSLayoutConstraint* constraint = [context buildConstraint];
        expect(constraint.firstItem).to.equal(view1);
        expect(constraint.firstAttribute).to.equal(NSLayoutAttributeLeft);
        expect(constraint.relation).to.equal(NSLayoutRelationEqual);
        expect(constraint.secondItem).to.equal(view2);
        expect(constraint.secondAttribute).to.equal(NSLayoutAttributeRight);
        expect(constraint.multiplier).to.equal(1.0f);
        expect(constraint.constant).to.equal(10.0f);
        expect(constraint.priority).to.equal(PVLayoutPriorityDefaultLow);
    });
    
    it(@"should not be build withouth left view", ^{
        expect(^{
            [context buildConstraint];
        }).to.raise(kLeftViewNotSet);
    });
    
    it(@"should not be built without left attribute", ^{
        expect(^{
            context.leftView = view1;
            [context buildConstraint];
        }).to.raise(kLeftViewAttributeNotSet);
    });
    
    describe(@"Left constraint context", ^{
        
        beforeEach(^{
            context.leftView = view1;
            context.leftAttribute = NSLayoutAttributeLeft;
        });
        
        it(@"should not be built while right view is nil and attribute is set", ^{
            expect(^{
                context.rightAttribute = NSLayoutAttributeBaseline;
                [context buildConstraint];
            }).to.raise(kRightViewIsNilButAttributeIsAttribute);
        });
        
        before(^{
            context.rightAttribute = NSLayoutAttributeBaseline;
        });
        
        it(@"should not be build while right view is nil and multiplier is zero", ^{
            expect(^{
                context.rightAtttributeMultiplier = 0.0f;
                [context buildConstraint];
            }).to.raise(kRightViewAttributeMultiplierIsZero);
        });
    });

});

SpecEnd

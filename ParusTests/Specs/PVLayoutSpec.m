#import "PVLayout.h"

#import "PVConstraintContext.h"

SpecBegin(PVSpec)

describe(@"PVLeftOf", ^{
    it(@"should raise when argument is nil", ^{
        expect(^{
            PVLeftOf(nil);
        }).to.raiseAny();
    });
    
    context(@"has valid given left view", ^{
        __block UIView* view1 = nil;
        
        beforeEach(^{
            view1 = [UIView new];
        });
        
        it(@"should return relation object", ^{
            id relationSelectObj = PVLeftOf(view1);
            BOOL isConforms = [relationSelectObj conformsToProtocol:@protocol(PVRelationSelect)];
            expect(isConforms).to.beTruthy();
        });
        
        describe(@"Relation select object", ^{
            __block id<PVRelationSelect> relationObj = nil;
            
            beforeEach(^{
                relationObj = PVLeftOf(view1);
            });
            
            it(@"should set relation", ^{
                id relationEqualObj = relationObj.equalTo;
                expect([relationEqualObj conformsToProtocol:@protocol(PVRelationPart)]).to.beTruthy();
                id relationLessObj = relationObj.lessThan;
                expect([relationLessObj conformsToProtocol:@protocol(PVRelationPart)]).to.beTruthy();
                id relationMoreObj = relationObj.moreThan;
                expect([relationMoreObj conformsToProtocol:@protocol(PVRelationPart)]).to.beTruthy();
            });
            
            describe(@"Relation part object", ^{
                __block id<PVRelationPart> relationPartObj = nil;
                
                beforeAll(^{
                    relationPartObj = relationObj.equalTo;
                });
                
                it(@"should set right part of equation", ^{
                    // TODO: implement tests for RelationPart
                });
            });
        });
        
    });
    
    
    
});

SpecEnd
//
//  NSArray+PVConvenientShorthands.h
//  Parus
//
//  Created by nekoi on 7/6/14.
//
//

#import <Parus/PVGroup.h>

@interface NSArray (PVConvenientShorthands)

/// This call allow to perform next syntax:
/// @[].pv_group
///     (.fromLeftToRight OR .fromRightToLeft OR .fromLeadingToTrailing)
///     (.withViews)
///     (.withMetrics)
///     .asArray
/// NSArray*;
///
/// Whrere, (...) is an optionall part.
/// All calls should be finished via .asArray; call. Or behavior is undefined.
/// Please, do not store any intermediate results.
/// Constraint inequality are guaranteed.

- (_PVGroup*)pv_group;

@end

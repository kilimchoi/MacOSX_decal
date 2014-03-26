//
//  FCStackCalculatorController.h
//  FractionCalculator
//
//  Created by Kilim Choi on 2/24/14.
//
//

#import <Foundation/Foundation.h>
#import "FCStack.h"

@interface FCStackCalculatorController : NSObject
{
    FCStack *stack;
}

- (void) respondToInput: (NSString *) input;



@end

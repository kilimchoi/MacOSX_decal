//
//  FCStackCalculatorController.m
//  FractionCalculator
//
//  Created by Kilim Choi on 2/24/14.
//
//

#import "FCStackCalculatorController.h"
#import "FCStack.h"
#import "FCConsole.h"
#import "Fraction.h"
@implementation FCStackCalculatorController


- (id) init
{
    self = [super init];
    if (self) {
        stack =[[FCStack alloc] init];
    }
    return self;
}

- (void) respondToInput: (NSString *) input
{
    [FCConsole writeLine: input];
    if ([input hasPrefix: @"push"]) {
        NSString *fractionString = [input substringFromIndex: 5];
        NSUInteger slash = [fractionString rangeOfString: @"/"].location;
        int numer = [[fractionString substringToIndex: slash] intValue];
        int denom = [[fractionString substringFromIndex: slash + 1] intValue];
        
        Fraction *fraction = [[Fraction alloc] initWithNumerator: numer
                                                  andDenominator: denom];
        [stack push: fraction];
        [stack print];
    } else if ([input hasPrefix: @"pop"]) {
        [stack pop];
        [stack print];
    } else if ([input isEqualToString: @"clear"]) {
        [stack clear];
        [stack print];
    } else if ([input isEqualToString: @"+"]) {
        Fraction *frac1 = [stack firstOperand];
        Fraction *frac2 = [stack secondOperand];
        Fraction *result = [frac1 add: frac2];
        [stack pop];
        [stack pop];
        [stack push: result];
        [stack print];
    } else if ([input isEqualToString: @"-"]) {
        Fraction *frac1 = [stack firstOperand];
        Fraction *frac2 = [stack secondOperand];
        Fraction *result = [frac1 subtract: frac2];
        [stack pop];
        [stack pop];
        [stack push: result];
        [stack print];
    } else if ([input isEqualToString: @"*"]) {
        Fraction *frac1 = [stack firstOperand];
        Fraction *frac2 = [stack secondOperand];
        Fraction *result = [frac1 multiply: frac2];
        [stack pop];
        [stack pop];
        [stack push: result];
        [stack print];
    } else if ([input isEqualToString: @"/"]) {
        Fraction *frac1 = [stack firstOperand];
        Fraction *frac2 = [stack secondOperand];
        Fraction *result = [frac1 divide: frac2];
        [stack pop];
        [stack pop];
        [stack push: result];
        [stack print];
    } else if ([input isEqualToString: @"invert"]) {
        Fraction *fraction = [stack topOperand];
        Fraction *result = [fraction inverse];
        [stack pop];
        [stack push: result];
        [stack print];
    }
}

@end

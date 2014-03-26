//
//  main.m
//  FractionCalculator
//
//  Created by Kevin Jorgensen on 7/16/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FCStackCalculatorController.h"
#import "FCConsole.h"
int main (int argc, const char * argv[])
{
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    
    /* Your code goes here! */
    FCStackCalculatorController *stackController;
    stackController = [[FCStackCalculatorController alloc] init];
    while (true) {
        [FCConsole writePrompt];
        NSString *input = [FCConsole readLine];
        if ([input isEqual: @"quit"])
            break;
        [stackController respondToInput:input];
    }
    [pool drain];
    
    return 0;
}


//
//  KLChatBot.m
//  ChatBot
//
//  Created by Kilim Choi on 3/26/14.
//
//

#import "KLChatBot.h"

@implementation KLChatBot

+ (NSString *)screenName
{
    return @"Awesome bot";
}
- (void) timerTriggered: (NSTimer *) timer {
    [self sendMessage: @"ding!"];
}
- (void) respondToChatMessage: (NSString *) chatMessage {
    if ([chatMessage isEqual: @"hello"]) {
        [super sendMessage: @"hello"];
    } else if ([chatMessage isEqual: @"date"]) {
        [super sendMessage: [[NSDate date] description]];
    } else if ([chatMessage hasPrefix: @"remember"]) {
        rememberedString = [chatMessage retain];
    } else if ([chatMessage isEqual: @"recall"]) {
        [super sendMessage: rememberedString];
    } else if ([chatMessage hasPrefix:@"timer"]) {
        NSString * time = [chatMessage substringFromIndex: 6];
        [NSTimer scheduledTimerWithTimeInterval: [time floatValue]
                                         target: self
                                       selector: @selector(timerTriggered:)
                                       userInfo:nil
                                        repeats:NO];
    }
}

@end

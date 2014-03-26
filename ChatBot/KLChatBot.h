//
//  KLChatBot.h
//  ChatBot
//
//  Created by Kilim Choi on 3/26/14.
//
//

#import <Foundation/Foundation.h>
#import "CBChatBot.h"
@interface KLChatBot : CBChatBot {
    NSString *rememberedString;
}
+ (NSString *)screenName;
- (void)respondToChatMessage:(NSString *)chatMessage;
- (void) timerTriggered: (NSTimer *) timer;
@end

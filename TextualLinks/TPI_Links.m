//
//  TPI_Links.m
//  TextualLinks
//
//  Created by Zack Hovatter on 1/16/14.
//  Copyright (c) 2014 Zack Hovatter. All rights reserved.
//

#import "TPI_Links.h"

#define LINK_REGEX @"https?:\\/\\/([\\da-z\\.-]+)\\.([a-z\\.]{2,6})([\\/\\w \\.-]*)*\\/?"

@implementation TPI_Links

- (void)pluginLoadedIntoMemory:(IRCWorld *)world {
    urls_ = [NSMutableDictionary dictionary];
    nextId_ = 0;
}

- (NSArray *)pluginSupportsUserInputCommands
{
    return @[@"links"];
}

- (void)messageSentByUser:(IRCClient *)client
                  message:(NSString *)messageString
                  command:(NSString *)commandString
{
    if ([messageString length] == 0) {
        NSArray *sorted = [urls_ keysSortedByValueUsingComparator:
                           ^NSComparisonResult(id obj1, id obj2) {
                               return [obj2 intValue] < [obj1 intValue];
                           }];
        
        NSString *total = [NSString stringWithFormat:@"Links: %lu", urls_.count];
        [self print:client message:total];

        for (NSNumber *key in sorted) {
            NSString *line = [NSString stringWithFormat:@"%d: %@", [key intValue], urls_[key]];
            [self print:client message:line];
        }
    } else {
        NSNumberFormatter *formatter = [[NSNumberFormatter alloc] init];
        NSNumber *key = [formatter numberFromString:messageString];
        [[NSWorkspace sharedWorkspace] openURL:[NSURL URLWithString:urls_[key]]];
    }
}

- (void)messageReceivedByServer:(IRCClient *)client
                         sender:(NSDictionary *)senderDict
                        message:(NSDictionary *)messageDict
{
    [self parseMessage:[messageDict[@"messageSequence"] stripIRCEffects]];
}

- (IRCMessage *)interceptServerInput:(IRCMessage *)input
                                 for:(IRCClient *)client
{
    // Only handle regular messages
    if ([input.command isEqualToString:IRCPrivateCommandIndex("privmsg")] == NO) {
        return input;
    }

    [self parseMessage:[[input.params safeObjectAtIndex:1] stripIRCEffects]];

    return input;
}

- (id)interceptUserInput:(id)input
                 command:(NSString *)command
{
    if ([input isKindOfClass:[NSAttributedString class]] == NO) {
        return input;
    }

    [self parseMessage:[[input string] stripIRCEffects]];

    return input;
}

- (void)print:(IRCClient *)client
      message:(NSString *)message
{
    [client print:self.worldController.selectedChannel type:TVCLogLineDebugType nick:nil text: message encrypted:NO receivedAt:[NSDate date] command:TXLogLineDefaultRawCommandValue];
}

- (void)parseMessage:(NSString *)message
{
    NSArray *matches = [TLORegularExpression matchesInString:message
                                                   withRegex:LINK_REGEX
                                                 withoutCase:true];
    for (NSString *url in matches) {
        [urls_ setObject:url forKey:[NSNumber numberWithInt:nextId_]];
        nextId_ = (nextId_ + 1) % 10; // 10 is max urls
    }
}

@end

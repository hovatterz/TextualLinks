//
//  TPI_Links.h
//  TextualLinks
//
//  Created by Zack Hovatter on 1/16/14.
//  Copyright (c) 2014 Zack Hovatter. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface TPI_Links : NSObject <THOPluginProtocol> {
    NSMutableDictionary *urls_;
    int nextId_;
}

- (void)pluginLoadedIntoMemory:(IRCWorld *)world;

- (NSArray *)pluginSupportsUserInputCommands;

- (void)messageSentByUser:(IRCClient *)client message:(NSString *)messageString command:(NSString *)commandString;

- (void)messageReceivedByServer:(IRCClient *)client sender:(NSDictionary *)senderDict message:(NSDictionary *)messageDict;
- (IRCMessage *)interceptServerInput:(IRCMessage *)input for:(IRCClient *)client;
- (id)interceptUserInput:(id)input command:(NSString *)command;

@end
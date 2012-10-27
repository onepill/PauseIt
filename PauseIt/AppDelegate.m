//
//  AppDelegate.m
//  PauseIt
//
//  Created by Siyuan Zhang on 10/13/12.
//  Copyright (c) 2012 Siyuan Zhang. All rights reserved.
//

#import "AppDelegate.h"
#import <IOKit/hidsystem/ev_keymap.h>
#import "AppleMediaKeyController.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [AppleMediaKeyController sharedController];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(playPauseKeyNotification) name:MediaKeyPlayPauseNotification object:nil];
    [center addObserver:self selector:@selector(nextKeyNotification) name:MediaKeyNextNotification object:nil];
    [center addObserver:self selector:@selector(previousKeyNotification) name:MediaKeyPreviousNotification object:nil];
}

- (void)playPauseKeyNotification {
    NSLog(@"play pause key pressed");
}

- (void)nextKeyNotification {
    NSLog(@"next key pressed");
}

- (void)previousKeyNotification {
    NSLog(@"previous key pressed");
    NSString *myScript = @"tell application \"iTunes\" \n activate \n end tell";
    NSAppleScript *script = [[NSAppleScript alloc] initWithSource:myScript];
    [script executeAndReturnError:nil];
}

@end

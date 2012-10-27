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

//@synthesize window;
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
    [AppleMediaKeyController sharedController];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(playPause) name:MediaKeyPlayPauseNotification object:nil];
    [center addObserver:self selector:@selector(next) name:MediaKeyNextNotification object:nil];
    [center addObserver:self selector:@selector(previous) name:MediaKeyPreviousNotification object:nil];
}

- (void)runAppleScriptWithFileName:(NSString *)fileName
{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"scpt"];
    NSURL * url = [NSURL fileURLWithPath:path];
    NSAppleScript *script = [[NSAppleScript alloc] initWithContentsOfURL:url error:nil];
    [script executeAndReturnError:nil];

}

- (void)playPause {
    NSLog(@"play pause");
    [self runAppleScriptWithFileName:@"playpause"];
}

- (void)next {
    NSLog(@"next key");
    [self runAppleScriptWithFileName:@"next"];
}

- (void)previous {
    NSLog(@"previous key");

}

- (void)awakeFromNib{
    statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSVariableStatusItemLength];
    [statusItem setMenu:statusMenu];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"menuIcon" ofType:@"png"];
    NSImage * menuIcon = [[NSImage alloc] initWithContentsOfFile:path];
    [statusItem setImage:menuIcon];
//    [statusItem setTitle:@"PauseIt"];
    [statusItem setHighlightMode:YES];
}

- (IBAction) playPauseMenuPressed:(id)sender{
    [self playPause];
}

@end

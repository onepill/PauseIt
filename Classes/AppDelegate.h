//
//  AppDelegate.h
//  PauseIt
//
//  Created by Siyuan Zhang on 10/13/12.
//  Copyright (c) 2012 Siyuan Zhang. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSApplication <NSObject>{
//    NSWindow * window;
    IBOutlet NSMenu * statusMenu;
    NSStatusItem * statusItem;
}

- (IBAction) playPauseMenuPressed:(id)sender;

@property (assign) IBOutlet NSWindow *window;

@end

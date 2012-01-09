//
//  AppDelegate.m
//  Simon
//
//  Created by William Estoque on 1/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#include <ApplicationServices/ApplicationServices.h>

@implementation AppDelegate

@synthesize window = _window,
            theMenu,
            theItem,
            showHubotMenuItem;

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSStatusBar *bar = [NSStatusBar systemStatusBar];

    theMenu  = [[NSMenu alloc] initWithTitle:@"Menu"];
    showHubotMenuItem = [[NSMenuItem alloc] initWithTitle:@"Preferences"
                                                   action:NULL 
                                            keyEquivalent:@""];
    [theMenu addItem:showHubotMenuItem];   
    theItem = [bar statusItemWithLength:NSVariableStatusItemLength];
    [theItem setTitle:@"Hubot"];
    [theItem setHighlightMode:YES];
    [theItem setMenu:theMenu];
    
//    NSString *scriptPath = [[NSBundle mainBundle] pathForResource:@"crap" 
//                                                           ofType:@"scpt"];
//    NSLog(@"PATH: %@", scriptPath);
//    NSString *scriptContents = [[NSString alloc] initWithContentsOfFile:scriptPath 
//                                                               encoding:NSUTF8StringEncoding 
//                                                                  error:nil];
//    NSLog(@"WHATTTTTTT: %@", scriptContents);
    
//    NSString *scriptContents = @"";
    
    NSAppleScript *scriptArrowDown = [[NSAppleScript alloc] initWithSource:
                             @"tell application \"System Events\"\n"
                             @"    key code 125\n"
                             @"end tell"];
    NSAppleScript *scriptArrowUp = [[NSAppleScript alloc] initWithSource:
                                 @"tell application \"System Events\"\n"
                                 @"    key code 126\n"
                                 @"end tell"];
    NSAppleScript *scriptArrowLeft = [[NSAppleScript alloc] initWithSource:
                                 @"tell application \"System Events\"\n"
                                 @"    key code 123\n"
                                 @"end tell"];
    NSAppleScript *scriptArrowRight = [[NSAppleScript alloc] initWithSource:
                                 @"tell application \"System Events\"\n"
                                 @"    key code 124\n"
                                 @"end tell"];
    
//    __block BOOL shouldExecutedScript = NO;
    
    [NSEvent addGlobalMonitorForEventsMatchingMask:NSKeyDownMask handler:^(NSEvent *incomingEvent){
        NSLog(@"==================================");
        NSLog(@"TYPE: %d", [incomingEvent keyCode]);
        NSUInteger ctrlMaskValue = 1 << 20;
        NSUInteger modifierMaskValue = [NSEvent modifierFlags];
        
        BOOL ctrlPressed = (ctrlMaskValue == modifierMaskValue ? YES : NO);
        if (YES)
        {
            int keyCode = [incomingEvent keyCode];

            switch (keyCode)     
            {
                case 4:
                    [scriptArrowLeft executeAndReturnError:nil];
                    break;
                case 38:
                    [scriptArrowDown executeAndReturnError:nil];
                    break;
                case 40:
                    [scriptArrowUp executeAndReturnError:nil];
                    break;
                case 37:
                    [scriptArrowRight executeAndReturnError:nil];
                    break;
            }

        }
    }];
    
//    [NSEvent addGlobalMonitorForEventsMatchingMask:NSKeyUpMask handler:^(NSEvent *incomingEvent){
//        if (shouldExecutedScript)
//        {
//            shouldExecutedScript = NO;
//            NSLog(@"==================AFTER================");
//
//        }
//    }];
}

@end

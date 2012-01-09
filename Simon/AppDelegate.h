//
//  AppDelegate.h
//  Simon
//
//  Created by William Estoque on 1/7/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (retain) NSMenu       *theMenu;
@property (retain) NSStatusItem *theItem;
@property (retain) NSMenuItem   *showHubotMenuItem;

@end

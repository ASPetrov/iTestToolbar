//
//  MyWindowController.m
//  iTestToolbar
//
//  Created by Alexander Petrov on 4.07.18.
//  Copyright © 2018 Alexander Petrov. All rights reserved.
//

#import "MyWindowController.h"

#import "MyToolbarDelegate.h"
#import "ToolbarItemFactory.h"

///

@interface MyWindowController ()

@property (nonatomic) NSToolbar *toolbar;
@property (nonatomic) ToolbarItemFactory *toolbarFactory;
@property (nonatomic) MyToolbarDelegate *toolbarDelegate;

@end

@implementation MyWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    [self setupWindow];
    [self.window setToolbar:self.toolbar];
}

#pragma mark - Window

- (void)setupWindow {
    self.window.titlebarAppearsTransparent = YES;
    [self.window setTitle:@"Test"];
    CGRect frame = self.window.frame;
    frame.size = NSMakeSize(1000, 600);
    [self.window setFrame:frame display:YES];
}

#pragma mark - Toolbar

- (NSToolbar *)toolbar {
    if (_toolbar == nil) {
        _toolbar = [[NSToolbar alloc] initWithIdentifier:toolbarID];
        _toolbar.allowsUserCustomization = NO;
        _toolbar.autosavesConfiguration = NO;
        _toolbar.delegate = self.toolbarDelegate;
        _toolbar.displayMode = NSToolbarDisplayModeIconOnly;

        for (NSUInteger i = 0; i < self.toolbarFactory.itemIdentifiers.count; i++) {
            [_toolbar insertItemWithItemIdentifier:self.toolbarFactory.itemIdentifiers[i] atIndex:i];
        }
    }

    return _toolbar;
}

- (MyToolbarDelegate *)toolbarDelegate {
    if (_toolbarDelegate == nil) {
        _toolbarDelegate = [[MyToolbarDelegate alloc] initWithFactory:self.toolbarFactory];
    }

    return _toolbarDelegate;
}

- (ToolbarItemFactory *)toolbarFactory {
    if (_toolbarFactory == nil) {
        _toolbarFactory = [[ToolbarItemFactory alloc] init];
    }

    return _toolbarFactory;
}

@end

NSString * const toolbarID = @"test_toolbar";

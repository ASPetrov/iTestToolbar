//
//  ViewController.m
//  iTestToolbar
//
//  Created by Alexander Petrov on 4.07.18.
//  Copyright © 2018 Alexander Petrov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController()

@property (weak) IBOutlet NSButton *toggleButton;

@property (assign) BOOL toolbarVisible;

@end

///

@implementation ViewController

#pragma mark - Actions

- (IBAction)toggleToolbarVisibilityAction:(NSButton *)sender {
    self.toolbarVisible = !self.toolbarVisible;
    [self.view.window.toolbar setVisible:self.toolbarVisible];
    [self updateToggleButtonTitle];
}

#pragma mark - Lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    self.toolbarVisible = YES; // Initially visible
    [self updateToggleButtonTitle];

    self.view.wantsLayer = YES;
    self.view.layer = [CALayer layer];
    self.view.layer.backgroundColor = [NSColor blueColor].CGColor;
}

#pragma mark - Helpers

- (void)updateToggleButtonTitle {
    NSString *title = self.toolbarVisible ? @"Hide toolbar" : @"Show toolbar";
    [self.toggleButton setTitle:title];
}

@end



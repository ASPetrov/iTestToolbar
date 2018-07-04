//
//  MyToolbarDelegate.h
//  iTestToolbar
//
//  Created by Alexander Petrov on 4.07.18.
//  Copyright © 2018 Alexander Petrov. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class ToolbarItemFactory;

@interface MyToolbarDelegate : NSObject <NSToolbarDelegate>

- (instancetype)initWithFactory:(ToolbarItemFactory *)factory;

@end

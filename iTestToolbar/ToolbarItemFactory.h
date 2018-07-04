//
//  ToolbarItemFactory.h
//  iTestToolbar
//
//  Created by Alexander Petrov on 4.07.18.
//  Copyright © 2018 Alexander Petrov. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class MyTitleToolbarItem;

@interface ToolbarItemFactory : NSObject

@property (nonatomic, readonly) NSArray<NSToolbarItemIdentifier> *itemIdentifiers;

@property (nonatomic, readonly) MyTitleToolbarItem *titleToolbarItem;

@end

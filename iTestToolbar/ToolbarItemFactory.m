//
//  ToolbarItemFactory.m
//  iTestToolbar
//
//  Created by Alexander Petrov on 4.07.18.
//  Copyright © 2018 Alexander Petrov. All rights reserved.
//

#import "ToolbarItemFactory.h"
#import "MyToolbarItem.h"

@interface ToolbarItemFactory()
@end

@implementation ToolbarItemFactory
@synthesize itemIdentifiers = _itemIdentifiers;
@synthesize titleToolbarItem = _titleToolbarItem;

- (NSArray<NSToolbarItemIdentifier> *)itemIdentifiers {
    if (_itemIdentifiers == nil) {
        _itemIdentifiers = [NSArray arrayWithObjects: [MyTitleToolbarItem identifier],
                            NSToolbarFlexibleSpaceItemIdentifier, nil];
    }

    return _itemIdentifiers;
}

- (MyTitleToolbarItem *)titleToolbarItem {
    if (_titleToolbarItem == nil) {
        _titleToolbarItem = [[MyTitleToolbarItem alloc] initWithTitle:@"Test App"];
    }

    return _titleToolbarItem;
}

@end

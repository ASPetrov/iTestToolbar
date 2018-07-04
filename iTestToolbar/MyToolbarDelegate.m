//
//  MyToolbarDelegate.m
//  iTestToolbar
//
//  Created by Alexander Petrov on 4.07.18.
//  Copyright © 2018 Alexander Petrov. All rights reserved.
//

#import "MyToolbarDelegate.h"
#import "ToolbarItemFactory.h"
#import "MyToolbarItem.h"

@interface MyToolbarDelegate()

@property (nonatomic) ToolbarItemFactory *factory;

@end

@implementation MyToolbarDelegate

#pragma mark - Lifecycle

- (instancetype)initWithFactory:(ToolbarItemFactory *)factory {
    self = [super init];
    if (self) {
        self.factory = factory;
    }
    return self;
}

#pragma mark - NSToolbarDelegate

- (NSArray<NSToolbarItemIdentifier> *)toolbarAllowedItemIdentifiers:(NSToolbar *)toolbar {
    return self.factory.itemIdentifiers;
}

- (NSArray<NSToolbarItemIdentifier> *)toolbarDefaultItemIdentifiers:(NSToolbar *)toolbar {
    return self.factory.itemIdentifiers;
}

- (NSToolbarItem *)toolbar:(NSToolbar *)toolbar itemForItemIdentifier:(NSString *)itemIdentifier willBeInsertedIntoToolbar:(BOOL)flag {
    if ([itemIdentifier isEqualToString:NSToolbarFlexibleSpaceItemIdentifier]) {
        return [[NSToolbarItem alloc] initWithItemIdentifier:NSToolbarFlexibleSpaceItemIdentifier];
    }

    if ([itemIdentifier isEqualToString:[MyTitleToolbarItem identifier]]) {
        return self.factory.titleToolbarItem;
    }

    return nil;
}

@end

//
//  MyToolbarItem.h
//  iTestToolbar
//
//  Created by Alexander Petrov on 4.07.18.
//  Copyright © 2018 Alexander Petrov. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MyToolbarItem : NSToolbarItem

+ (NSToolbarItemIdentifier)identifier;

@end

@interface MyTitleToolbarItem: MyToolbarItem

@property (nonatomic) NSString *title;

- (instancetype)initWithTitle:(NSString *)title;

@end

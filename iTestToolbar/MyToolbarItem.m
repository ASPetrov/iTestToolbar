//
//  MyToolbarItem.m
//  iTestToolbar
//
//  Created by Alexander Petrov on 4.07.18.
//  Copyright © 2018 Alexander Petrov. All rights reserved.
//

#import "MyToolbarItem.h"

const CGFloat toolbarItemHeight = 50.0f;

@interface MyToolbarItem (Internal)

- (void)setup;

@end

@implementation MyToolbarItem

+ (NSToolbarItemIdentifier)identifier {
    return NSStringFromClass(self);
}

#pragma mark - Lifecycle

- (instancetype)init {
    self = [super initWithItemIdentifier:[[self class] identifier]];
    if (self) {
        [self setup];
    }
    return self;
}

#pragma mark - Internal

- (void)setup {
    self.minSize = CGSizeMake(self.minSize.width, toolbarItemHeight);
    self.maxSize = CGSizeMake(self.maxSize.width, toolbarItemHeight);
}

@end

///

@interface MyTitleToolbarItem ()

@property (nonatomic) NSTextField *titleTextField;

@end

@implementation MyTitleToolbarItem
@dynamic title;

#pragma mark - Lifecycle

- (instancetype)initWithTitle:(NSString *)title {
    self = [super init];
    if (self) {
        self.title = title;
    }
    return self;
}

#pragma mark - Title

- (NSTextField *)titleTextField {
    if (_titleTextField == nil) {
        CGRect frame = CGRectMake(0, 0, 100, toolbarItemHeight);
        _titleTextField = [[NSTextField alloc] initWithFrame:frame];
        [_titleTextField setFont:[NSFont systemFontOfSize:20]];
        [_titleTextField setStringValue:@""];
        [_titleTextField setEditable:NO];
        [_titleTextField setAlignment:NSTextAlignmentLeft];
        [_titleTextField setBezeled:NO];
        [_titleTextField setBackgroundColor:[NSColor clearColor]];
//        [_titleTextField setTextColor:[NSColor whiteColor]];
    }

    return _titleTextField;
}

- (NSString *)title {
    return self.titleTextField.stringValue;
}

- (void)setTitle:(NSString *)title {
    self.titleTextField.stringValue = title;
    [self.titleTextField sizeToFit];
    CGFloat width = self.titleTextField.frame.size.width;
    self.minSize = CGSizeMake(width, self.minSize.height);
    self.maxSize = CGSizeMake(width, self.maxSize.height);
}

#pragma mark - Internal

- (void)setup {
    [super setup];
    [self setView:self.titleTextField];
}

@end

//
//  HqBarButtonItem.m
//  HqPullRefresh
//
//  Created by hqmac on 2018/12/3.
//  Copyright © 2018 solar. All rights reserved.
//

#import "HqBarButtonItem.h"

@implementation HqBarButtonItem

- (instancetype)initWithNormalTitle:(NSString *)normalTitle seletedTitle:(NSString *)selectedTitle{
    if (self = [super init]) {
        self.title = normalTitle;
        self.normalTitle = normalTitle;
        self.selectedTitle = selectedTitle;
    }
    return self;
}
- (void)addTarget:(id)target action:(SEL)action{
    self.target = target;
    self.action = action;
}
- (void)setSelected:(BOOL)selected{
    _selected = selected;
    if (_selected) {
        self.title = self.selectedTitle;
    }else{
        self.title = self.normalTitle;
    }
}

@end

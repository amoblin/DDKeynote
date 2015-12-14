//
//  DDBasePage.h
//  DDKeynote
//
//  Created by amoblin on 15/12/14.
//  Copyright © 2015年 marboo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabel+WA.h"
#import <JSONModel/JSONModel.h>
#import <Masonry/Masonry.h>

@interface DDBaseData : JSONModel

@property (nonatomic, strong) NSString *title;

@end

@interface DDBasePage : UIViewController

@property (nonatomic, strong) DDBaseData *data;

- (instancetype)initWithDataArray:(NSArray *)dataArray;

- (void)configConstraints;
- (void)loadData;

@end

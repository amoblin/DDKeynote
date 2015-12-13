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

@end

@interface DDBasePage : UIViewController

@property (nonatomic, strong) id data;

- (DDBasePage *)pageByData:(id)data;

@end

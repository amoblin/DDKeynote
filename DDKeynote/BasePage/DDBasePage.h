//
//  DDBasePage.h
//  DDKeynote
//
//  Created by amoblin on 15/12/14.
//  Copyright © 2015年 marboo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UILabel+WA.h"

@interface DDBaseData : NSObject

- (instancetype)initWithDictionary:(NSDictionary *)dict;
@end

@interface DDBasePage : UIViewController

@property (nonatomic, strong) id data;

- (DDBasePage *)pageByData:(id)data;

@end

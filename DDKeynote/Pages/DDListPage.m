//
//  DDListPage.m
//  DDKeynote
//
//  Created by amoblin on 15/12/14.
//  Copyright © 2015年 marboo. All rights reserved.
//

#import "DDListPage.h"

@implementation DDListData

@end

@interface DDListPage ()

@property (nonatomic, strong) NSMutableArray *viewArray;

@end

@implementation DDListPage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)loadView;
{
    [super loadView];
    NSArray *items = ((DDListData *)self.data).items;
    self.viewArray = [NSMutableArray arrayWithCapacity:items.count];
    for (NSString *info in items) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bullet"]];
        [self.view addSubview:imageView];
        UILabel *label = [UILabel labelWithFont:[UIFont systemFontOfSize:20] textColor:[UIColor blackColor]];
        label.text = info;
        [self.view addSubview:label];
        [self.viewArray addObject:@[imageView, label]];
    }
}

- (void)configConstraints;
{
    [super configConstraints];
    NSInteger i = 0;
    for (NSArray *array in self.viewArray) {
        UIView *imageView = array[0];
        UIView *label = array[1];
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(20);
            make.top.mas_equalTo(64 + 30 * i);
        }];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(imageView.mas_right).with.offset(5);
            make.centerY.equalTo(imageView);
        }];
        i++;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

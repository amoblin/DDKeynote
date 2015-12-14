//
//  DDDetailPage.m
//  DDKeynote
//
//  Created by amoblin on 15/12/14.
//  Copyright © 2015年 marboo. All rights reserved.
//

#import "DDDetailPage.h"

@implementation DDDetailData

@end

@interface DDDetailPage ()

@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation DDDetailPage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)loadView;
{
    [super loadView];
    self.contentLabel = [UILabel labelWithFont:[UIFont systemFontOfSize:32] textColor:[UIColor blackColor]];
    [self.view addSubview:self.contentLabel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)configConstraints;
{
    [super configConstraints];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.bottom.equalTo(self.view);
    }];
}

- (void)loadData;
{
    [super loadData];
    if (self.data == nil) {
        return;
    }
    self.contentLabel.text = ((DDDetailData *)self.data).content;
}

@end

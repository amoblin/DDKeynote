//
//  DDEndPage.m
//  DDKeynote
//
//  Created by amoblin on 15/12/14.
//  Copyright © 2015年 marboo. All rights reserved.
//

#import "DDEndPage.h"

@implementation DDEndData

@end

@interface DDEndPage ()

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation DDEndPage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)loadView;
{
    [super loadView];
    self.titleLabel = [UILabel labelWithFont:[UIFont systemFontOfSize:48.0] textColor:[UIColor blackColor]];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.titleLabel];
}

- (void)configConstraints;
{
    [super configConstraints];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view);
    }];
}

- (void)loadData;
{
    [super loadData];
    if (self.data == nil) {
        return;
    }
    self.titleLabel.text = ((DDEndData *)self.data).contentTitle;
}

@end

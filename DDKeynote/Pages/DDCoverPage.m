//
//  DDCoverPage.m
//  DDKeynote
//
//  Created by amoblin on 15/12/14.
//  Copyright © 2015年 marboo. All rights reserved.
//

#import "DDCoverPage.h"

@implementation DDCoverData

@end

@interface DDCoverPage ()

@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subtitleLabel;
@property (nonatomic, strong) NSArray *pageDataArray;
@end

@implementation DDCoverPage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.pageDataArray = @[
                           @{@"title": @"Title", @"subtitle": @"Subtitle", @"layout": @"cover"}];
    
    NSMutableArray *dataArray = [NSMutableArray array];
    for (NSDictionary *item in self.pageDataArray) {
        if ([item[@"layout"] isEqualToString:@"cover"]) {
            DDCoverData *data = [[DDCoverData alloc] initWithDictionary:item error:nil];
            [dataArray addObject:data];
        }
    }
    self.pageDataArray = dataArray;

    [self loadData];
    [self configConstraints];
}

- (void)loadView;
{
    [super loadView];
    self.titleLabel = [UILabel labelWithFont:[UIFont systemFontOfSize:48.0] textColor:[UIColor blackColor]];
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.titleLabel];
    self.subtitleLabel = [UILabel labelWithFont:[UIFont systemFontOfSize:48.0] textColor:[UIColor blackColor]];
    self.subtitleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.subtitleLabel];
}

- (void)configConstraints;
{
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).with.offset(-30);
    }];
    [self.subtitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view);
        make.centerY.equalTo(self.view).with.offset(30);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)loadData;
{
    NSInteger index = [self.navigationController.viewControllers indexOfObject:self];
    if (index < self.pageDataArray.count) {
        self.data = self.pageDataArray[index];
    }

    if (self.data == nil) {
        return;
    }

    DDCoverData *data = (DDCoverData *)self.data;
    self.titleLabel.text = data.title;
    self.subtitleLabel.text = data.subtitle;
}

@end

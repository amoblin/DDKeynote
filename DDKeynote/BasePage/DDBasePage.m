//
//  DDBasePage.m
//  DDKeynote
//
//  Created by amoblin on 15/12/14.
//  Copyright © 2015年 marboo. All rights reserved.
//

#import "DDBasePage.h"
#import "DDCoverPage.h"

@implementation DDBaseData

@end

@interface DDBasePage ()

@property (nonatomic, strong) NSArray *dataArray;

@property (nonatomic, strong) UILabel *label;

@end

@implementation DDBasePage

- (instancetype)initWithDataArray:(NSArray *)dataArray;
{
    self = [super init];
    if (self) {
        self.dataArray = dataArray;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setHidden:YES];

    [self addPreviousNextPageAction];

    [self loadData];
    [self configConstraints];
}

- (void)loadView;
{
    [super loadView];
    self.label = [UILabel labelWithFont:[UIFont systemFontOfSize:10] textColor:[UIColor lightGrayColor]];
    [self.view addSubview:self.label];
}

- (void)configConstraints;
{
    [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.bottom.mas_equalTo(-15);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Class)pageByData:(id)data;
{
    Class dataClass = [data class];
    NSString *dataClassName = NSStringFromClass(dataClass);
    NSString *pageClassName = nil;
    if([dataClassName hasSuffix:@"Data"]) {
        pageClassName = [[dataClassName substringToIndex:dataClassName.length-@"Data".length] stringByAppendingString:@"Page"];
    }
    Class pageClass;
    if (pageClassName && NSClassFromString(pageClassName)) {
        pageClass = NSClassFromString(pageClassName);
    } else {
        pageClass = [DDBasePage class];
    }
    return pageClass;
}

- (void)addPreviousNextPageAction;
{
    self.view.userInteractionEnabled = YES;

    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapViewAction:)];
    [self.view addGestureRecognizer:tap];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeViewAction:)];
    swipe.direction = UISwipeGestureRecognizerDirectionLeft | UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
    
    swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeViewAction:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
}

- (void)tapViewAction:(UITapGestureRecognizer *)tap;
{
    [self pushToNextPage];
}

- (void)swipeViewAction:(UISwipeGestureRecognizer *)swipe;
{
    if (swipe.direction & UISwipeGestureRecognizerDirectionLeft) {
        [self pushToNextPage];
    } else if (swipe.direction & UISwipeGestureRecognizerDirectionRight) {
        [self popToPreviousPage];
    }
}

- (void)popToPreviousPage;
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)pushToNextPage;
{
    DDBaseData *data;
    NSInteger index = [self.navigationController.viewControllers indexOfObject:self];
    index++;
    if (index < self.dataArray.count) {
        data = self.dataArray[index];
    }
    
    if (data == nil) {
        return;
    }
    
    Class pageClass = [self pageByData:data];

    DDBasePage *page = [[pageClass alloc] init];
    page.dataArray = self.dataArray;
    
    [self.navigationController pushViewController:page animated:YES];
}

- (void)loadData;
{
    NSInteger index = [self.navigationController.viewControllers indexOfObject:self];
    if (index < self.dataArray.count) {
        self.data = self.dataArray[index];
    }
    
    NSString *info = [NSString stringWithFormat:@"%@-%@", @(self.dataArray.count), @(index+1)];
    self.label.text = info;
}

@end

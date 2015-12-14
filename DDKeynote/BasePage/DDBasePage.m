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

    [self addNextPageAction];

    [self loadData];
    [self configConstraints];
}

- (void)configConstraints;
{
    // do nothing
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

- (void)addNextPageAction;
{
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapViewAction:)];
    self.view.userInteractionEnabled = YES;
    [self.view addGestureRecognizer:tap];
}

- (void)tapViewAction:(UITapGestureRecognizer *)tap;
{
    [self pushToNextPage];
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
}

@end

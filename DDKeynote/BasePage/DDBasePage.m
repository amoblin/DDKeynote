//
//  DDBasePage.m
//  DDKeynote
//
//  Created by amoblin on 15/12/14.
//  Copyright © 2015年 marboo. All rights reserved.
//

#import "DDBasePage.h"

@implementation DDBaseData

@end

@interface DDBasePage ()

@end

@implementation DDBasePage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self.navigationController.navigationBar setHidden:YES];
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

- (DDBasePage *)pageByData:(id)data;
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

@end

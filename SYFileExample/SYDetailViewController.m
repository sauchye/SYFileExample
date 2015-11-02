//
//  SYDetailViewController.m
//  SYFileExample
//
//  Created by Saucheong Ye on 6/30/15.
//  Copyright © 2015 Saucheong Ye. All rights reserved.
//

#import "SYDetailViewController.h"
#import "SYFileManager.h"
static NSString * const fileName = @"test";

@interface SYDetailViewController ()

@end

@implementation SYDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Read Data";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    SYFileManager *fileManager = [SYFileManager sharedInstance];
    
    NSArray *data = [fileManager readArrayFileName:@"test"];
    
    UILabel *readDataLbl = [[UILabel alloc] initWithFrame:self.view.bounds];
    readDataLbl.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:readDataLbl];
    
    if (data) {
        readDataLbl.text = @"Read Success";
    }else{
        readDataLbl.text = @"Read Failed";
    }
    
    NSLog(@"%@", data);
}


@end

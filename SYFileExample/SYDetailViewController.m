//
//  SYDetailViewController.m
//  SYFileExample
//
//  Created by Saucheong Ye on 6/30/15.
//  Copyright © 2015 Saucheong Ye. All rights reserved.
//

#import "SYDetailViewController.h"
#import "SYFileManager.h"

@interface SYDetailViewController ()

@end

@implementation SYDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"Read Data";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    SYFileManager *fileManager = [SYFileManager sharedInstance];
    
    
    UILabel *readDataLbl = [[UILabel alloc] initWithFrame:self.view.bounds];
    readDataLbl.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:readDataLbl];
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc]
                                     initWithTarget:self
                                     action:@selector(tapAction)]];

    NSArray *data = [fileManager readArrayFileName:@"Test"];

    if (!data) {
        readDataLbl.text = @"Read Failed";

    }else{
        readDataLbl.text = @"Read Success";
    }
    
    NSMutableArray *d = [NSMutableArray arrayWithArray:data];

    if (d.count) {
        [d removeObjectAtIndex:0];
        [fileManager removeObject:d fileName:@"Test"];
    }
    NSLog(@"%@", data);
}

- (void)tapAction{
    [self.navigationController popViewControllerAnimated:YES];
}


@end

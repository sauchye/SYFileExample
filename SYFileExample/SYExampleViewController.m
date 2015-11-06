//
//  SYExampleViewController.m
//  SYFileExample
//
//  Created by Saucheong Ye on 6/30/15.
//  Copyright © 2015 Saucheong Ye. All rights reserved.
//

#import "SYExampleViewController.h"
#import "SYDetailViewController.h"
#import "SYFileManager.h"

@interface SYExampleViewController ()

@end

@implementation SYExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setup];
}

- (void)setup{
    
    SYFileManager *fileManager = [SYFileManager sharedInstance];
    NSArray *data = @[@"Apple", @"Google", @"Facebook", @"Twitter"];
    
    if (data.count) {
        [fileManager writeArrayWithfileName:@"Test" array:data];
    }
    UILabel *writeDataLbl = [[UILabel alloc] initWithFrame:self.view.bounds];
    writeDataLbl.text = @"Write Data";
    writeDataLbl.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:writeDataLbl];
    
    [self.view addGestureRecognizer:[[UITapGestureRecognizer alloc]
                                     initWithTarget:self
                                     action:@selector(tapAction)]];
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];

}


- (void)tapAction{
    
    [self.navigationController pushViewController:[[SYDetailViewController alloc] init] animated:YES];
    
}

@end

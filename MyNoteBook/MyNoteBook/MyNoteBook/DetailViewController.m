//
//  DetailViewController.m
//  MyNoteBook
//
//  Created by Ivan_deng on 2016/12/15.
//  Copyright © 2016年 Ivan_deng. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.width;
    UITextView *textView = [[UITextView alloc]initWithFrame:CGRectMake(20, 20 + 64, screenWidth - 40, screenHeight - 40)];
    [textView setEditable:false];
    textView.layer.borderWidth = 2;
    textView.layer.cornerRadius = 5;
    textView.text = self.textContent.noteText;
    textView.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:textView];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationItem.title = @"详情页";
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

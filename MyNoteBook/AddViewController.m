//
//  AddViewController.m
//  MyNoteBook
//
//  Created by Ivan_deng on 2016/12/15.
//  Copyright © 2016年 Ivan_deng. All rights reserved.
//

#import "AddViewController.h"
#import "NoteLog.h"

@interface AddViewController ()<UITextFieldDelegate>

@end

@implementation AddViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(doneAction:)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveAction:)];
    [self createTextFieldText];
    // Do any additional setup after loading the view.
    
}

- (void)passNoteLog:(callNoteLog)noteLog{
    packedNoteLog = [noteLog copy];
}
- (void)createTextFieldText{
    UITextField *textField = [[UITextField alloc]initWithFrame:CGRectMake(0, 110, [UIScreen mainScreen].bounds.size.width, 200)];
    textField.tag = 100;
    textField.layer.borderWidth = 1;
    [textField.layer setCornerRadius:5];
    [textField setPlaceholder:@"  Input any thing that you wanna noted..."];
    textField.delegate = self;
    [self.view addSubview:textField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationItem.title = @"增加";
}

#pragma mark - Button action selection

- (void)doneAction:(UIBarButtonItem *)sender{
    [self dismissViewControllerAnimated:true completion:^{
        NSLog(@"Leave without save");
    }];
}

- (void)saveAction:(UIBarButtonItem *)sender{
    
    UITextField *textField = [self.view viewWithTag:100];
    
    NoteLog *noteSending = [[NoteLog alloc]initWithContent:textField.text];
    packedNoteLog(noteSending);
    [self dismissViewControllerAnimated:true completion:^{
        NSLog(@"Save and leave");
    }];
}

#pragma mark - textField delegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return true;
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

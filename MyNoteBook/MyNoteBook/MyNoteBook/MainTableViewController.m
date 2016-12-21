//
//  MainTableViewController.m
//  MyNoteBook
//
//  Created by Ivan_deng on 2016/12/15.
//  Copyright © 2016年 Ivan_deng. All rights reserved.
//

#import "MainTableViewController.h"
#import "AddViewController.h"
#import "DetailViewController.h"
#import "NoteTableViewCell.h"
#import "NoteDataStorage.h"

@interface MainTableViewController ()

{
    NoteDataStorage * _storage;
}

@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
    
    UILabel *fotter = [[UILabel alloc]initWithFrame:CGRectMake(0,0 , [UIScreen mainScreen].bounds.size.width, 44)];
    fotter.text = @"Buttom";
    fotter.textAlignment = NSTextAlignmentCenter;
    fotter.backgroundColor = [UIColor grayColor];
    self.tableView.tableFooterView = fotter;
    
    [self.tableView registerClass:[NoteTableViewCell class] forCellReuseIdentifier:@"notes"];
    self.navigationItem.leftBarButtonItem = [self editButtonItem];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addAction:)];
}

- (void)loadData{
    _storage = [NoteDataStorage getInstance];
}

#pragma mark - App status monitor

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated{
    self.navigationItem.title = @"备忘录";
}


#pragma mark - Button action selection

- (void)addAction:(UIBarButtonItem *)sender{
    NSLog(@"Add button pressed");
    AddViewController *addView = [[AddViewController alloc]init];
    UINavigationController *navAdd = [[UINavigationController alloc]initWithRootViewController:addView];
    [addView passNoteLog:^(NoteLog *noteLog) {
        [NoteDataStorage addingNote:noteLog];
        [self.tableView reloadData];
    }];
    [self.tableView setEditing:false animated:true];
    [self presentViewController:navAdd animated:true completion:^{
        NSLog(@"Presented addViewController");
    }];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(_storage.noteCollection.count == 0){
        NSLog(@"No note file was found");
    }
    return _storage.noteCollection.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"notes"forIndexPath:indexPath];
    
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    NoteLog *note = _storage.noteCollection[indexPath.row];
    cell.timeStamp.text = note.noteDate;
    cell.titleLabel.text = note.noteTitle;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DetailViewController *detail = [[DetailViewController alloc]init];
    if(_storage.noteCollection[indexPath.row] == nil){
        detail.textContent = [[NoteLog alloc]init];
    }else{
        detail.textContent = _storage.noteCollection[indexPath.row];
    }
    [self.navigationController pushViewController:detail animated:true];
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_storage.noteCollection removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    [self.tableView reloadData];
}


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

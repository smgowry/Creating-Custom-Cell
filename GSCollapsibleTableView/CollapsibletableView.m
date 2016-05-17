//
//  ViewController.m
//  GSCollapsibleTableView
//
//  Created by Gowri Sammandhamoorthy on 09/24/15.
//  Copyright © 2015 Gowri Sammandhamoorthy. All rights reserved.
//

#import "CollapsibletableView.h"

@interface CollapsibletableView ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation CollapsibletableView{
    NSArray* arrayOfSections;
    NSMutableArray* boolArray;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _tableVw.delegate = self;
    _tableVw.dataSource =self;
    _tableVw.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _tableVw.separatorColor = [UIColor blueColor];
    
    arrayOfSections = [NSArray new];
    arrayOfSections = @[@"Home", @"Favourite",@"Add",@"Contact", @"More"];
    
    boolArray = [NSMutableArray new];
    
    for (int i = 0; i < [arrayOfSections count]; i++) {
        [boolArray addObject:[NSNumber numberWithBool:NO]];
    }
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [arrayOfSections count];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if ([[boolArray objectAtIndex:section] boolValue]){
        return 4;
    }
    else{
        return 0;
    }
    return 0;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = @"Enter Your Text Here";
    cell.backgroundColor = [UIColor colorWithRed:229.0/255.0 green:200.0/255.0 blue:204.0/255.0 alpha:1.0];
    
    cell.layer.borderWidth = 0.5f;
    cell.layer.borderColor = [UIColor blueColor].CGColor;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55.0f;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 65.0f;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
  
    UIView* sectionView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.tableVw.frame.size.height, 65)];
    sectionView.backgroundColor = [UIColor colorWithRed:181.0/255.0 green:152.0/255.0 blue:255.0/255.0 alpha:1.0];
    
    //Title label.
    UILabel *viewLabel=[[UILabel alloc]initWithFrame:CGRectMake(15, 20, 200 , 25)];
    viewLabel.backgroundColor=[UIColor clearColor];
    viewLabel.textColor=[UIColor blackColor];
    viewLabel.font=[UIFont fontWithName:@"Helvetica" size:20.0f];
    viewLabel.text=[NSString stringWithFormat:@"%@",[arrayOfSections objectAtIndex:section]];
    [sectionView addSubview:viewLabel];
    
    
    //Expand ImageVw
     UIImageView* detailAccessoryImgVw = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.frame.size.width-40, 20, 25, 25)];
    if ([[boolArray objectAtIndex:section] boolValue]){
       [detailAccessoryImgVw setImage:[UIImage imageNamed:@"minimize-button-white.png"]];
    }
    else{
         [detailAccessoryImgVw setImage:[UIImage imageNamed:@"expand-button-white.png"]];
    }
    
    [sectionView addSubview:detailAccessoryImgVw];
    
//Expand Clear button
    UIButton* btn  = [[UIButton alloc]initWithFrame:CGRectMake(sectionView.frame.origin.x, sectionView.frame.origin.y, sectionView.frame.size.width, sectionView.frame.size.height)];
    btn.backgroundColor = [UIColor clearColor];
    [sectionView addSubview:btn];
    btn.tag = section;
    
    for (int i=0; i<[arrayOfSections  count]; i++) {
        [btn addTarget:self action:@selector(expandClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    
    UIImageView* imgVw = [[UIImageView alloc]initWithFrame:CGRectMake(0, 63, self.tableVw.frame.size.height, 2)];
    imgVw.backgroundColor = [UIColor whiteColor];
    [sectionView addSubview:imgVw];

    return sectionView;
}

#pragma mark - Expand Action.

-(void)expandClicked:(id)sender{
  
    UIButton *button=(id)sender;
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:button.tag];
    if (indexPath.row == 0) {
        BOOL collapsed  = [[boolArray objectAtIndex:indexPath.section] boolValue];
        
        for (int i=0; i<[arrayOfSections  count]; i++) {
            if (indexPath.section==i) {
                [boolArray replaceObjectAtIndex:i withObject:[NSNumber numberWithBool:!collapsed]];
            }
        }
        
        [_tableVw reloadSections:[NSIndexSet indexSetWithIndex:button.tag] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
    
}


@end

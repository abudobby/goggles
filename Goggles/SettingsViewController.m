//
//  SettingsViewController.m
//  Goggles
//
//  Created by Abdi on 10/24/16.
//  Copyright © 2016 Goggles. All rights reserved.
//


#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#import "SettingsViewController.h"
#import "SettingsViewCell.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController{
    NSMutableArray *account;
    NSMutableArray *socials;
    
    NSMutableArray *tableArray;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    account = [[NSMutableArray alloc]initWithObjects:@"Name",@"Job",@"Bio", nil];
    
    socials = [[NSMutableArray alloc]initWithObjects:@"Linkedin",@"Twitter",@"Instagram", nil];

    
    tableArray = [[NSMutableArray alloc] init];
    
    [tableArray addObject:account];
    [tableArray addObject:socials];

    
    [self.tableView setSeparatorColor:[UIColor groupTableViewBackgroundColor]];

    
    [self.tableView registerClass:[SettingsViewCell class] forCellReuseIdentifier:@"cell"];
    
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

    
    
//    self.tableView.backgroundColor = UIColorFromRGB(0xecf0f1);

    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return tableArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    
    if (section==0) {
        return [tableArray[0] count];
    }
    else{
        return [tableArray[1] count];

    }
    
}

-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    
    if (section==0) {
        header.textLabel.text = @"My Account";

    }
    else{
        header.textLabel.text = @"Social Media";

        
    }
    
    header.textLabel.font = [UIFont fontWithName:@"AvenirNext-Medium" size:14];
    header.textLabel.textColor = UIColorFromRGB(0x3498db);
}
- (CGFloat) tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SettingsViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    if (indexPath.section==0) {
        cell.listLabel.text = [account objectAtIndex:indexPath.row];
        cell.input.placeholder = [account objectAtIndex:indexPath.row];


    }
    else{
        cell.listLabel.text = [socials objectAtIndex:indexPath.row];
        cell.input.placeholder = @"@username";


    }

    
   cell.listLabel.font = [UIFont fontWithName:@"AvenirNext-Regular" size:13];
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];

    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

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

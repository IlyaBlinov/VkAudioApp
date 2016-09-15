//
//  IBViewController.m
//  VkAudioApp
//
//  Created by ilyablinov on 13.09.16.
//  Copyright (c) 2016 IB. All rights reserved.
//

#import "IBViewController.h"
#import "IBServerManager.h"

@interface IBViewController ()

@property (strong, nonatomic) NSMutableArray *friends;

@end

@implementation IBViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.friends = [NSMutableArray array];
    
    [self getAudioFilesFromServer];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void) getAudioFilesFromServer{
    
    
    
    [[IBServerManager sharedManager] getAudioFilesWithOffset:0 count:10 onSuccess:^(NSArray *friends) {
        
        [self.friends addObjectsFromArray:friends];
        
        [self.tableView reloadData];
        
    } onFailure:^(NSError *error, NSInteger statusCode) {
        
    }];

    
    
}



#pragma mark - UITableViewDataSource


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return [self.friends count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *identifier = @"cell";
    
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    return cell;
    
}





@end

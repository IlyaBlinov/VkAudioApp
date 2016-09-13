//
//  IBServerManager.m
//  VkAudioApp
//
//  Created by ilyablinov on 13.09.16.
//  Copyright (c) 2016 IB. All rights reserved.
//

#import "IBServerManager.h"
#import "AFNetworking.h"




@implementation IBServerManager


- (void) getAudioFilesWithOffset: (NSInteger) offset
                        count: (NSInteger) count
                    onSuccess:(void(^) (NSArray *audioFiles)) success
                    onFailure:(void (^)(NSError *error, NSInteger statusCode)) failure{
    
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"https://api.vk.com/method/audio.get" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    
    
    
    
}


@end

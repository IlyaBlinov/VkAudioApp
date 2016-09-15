//
//  IBServerManager.m
//  VkAudioApp
//
//  Created by ilyablinov on 13.09.16.
//  Copyright (c) 2016 IB. All rights reserved.
//

#import "IBServerManager.h"
#import "AFNetworking.h"

@interface IBServerManager ()

@property (strong, nonatomic) AFHTTPRequestOperationManager *requestOperationManager;


@end


@implementation IBServerManager


+ (IBServerManager*) sharedManager{
    
    static IBServerManager *manager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[IBServerManager alloc] init];
    });
    
    return manager;
    
}



- (instancetype)init
{
    self = [super init];
    if (self) {
  
        NSURL *url = [NSURL URLWithString:@"https://api.vk.com/method/"];
        
        self.requestOperationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:url];
 
    }
    return self;
}





- (void) getAudioFilesWithOffset: (NSInteger) offset
                        count: (NSInteger) count
                    onSuccess:(void(^) (NSArray *audioFiles)) success
                    onFailure:(void (^)(NSError *error, NSInteger statusCode)) failure{
    
    
    NSDictionary *parameters = [[NSDictionary alloc] initWithObjectsAndKeys:
                                @"237073493", @"user_id",
                                @"name",      @"order",
                                @(count),     @"count",
                                @(offset),    @"offset",
                                @"photo_50",  @"fields",
                                @"nom",       @"name_case", 
                                nil];

    [self.requestOperationManager GET:@"friends.get" parameters:parameters success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {
        
        NSArray *allFriends = [responseObject objectForKey:@"response"];
        
        NSLog(@"JSON: %@", allFriends);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        NSLog(@"Error: %@", error);
        
    }];
 
    
    
}


@end

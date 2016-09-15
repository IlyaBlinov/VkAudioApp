//
//  IBUser.m
//  VkAudioApp
//
//  Created by ilyablinov on 15.09.16.
//  Copyright (c) 2016 IB. All rights reserved.
//

#import "IBUser.h"

@implementation IBUser



- (id) initWithServerResponse: (NSDictionary*) responseObject{
    
    self = [super init];
    if (self) {
        
        self.firstName = [responseObject objectForKey:@"first_name"];
        self.lastName = [responseObject objectForKey:@"last_name"];
        
        self.photoURL = [NSURL URLWithString:
                         [responseObject objectForKey:@"photo_50"]];
        
        
    }
    return self;
    
    
    
}







@end

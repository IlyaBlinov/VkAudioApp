//
//  IBServerManager.h
//  VkAudioApp
//
//  Created by ilyablinov on 13.09.16.
//  Copyright (c) 2016 IB. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IBServerManager : NSObject

+ (IBServerManager*) sharedManager;





- (void) getAudioFilesWithOffset: (NSInteger) offset
                        count: (NSInteger) count
                    onSuccess:(void(^) (NSArray *audioFiles)) success
                    onFailure:(void (^)(NSError *error, NSInteger statusCode)) failure;





@end

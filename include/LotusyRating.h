//
//  LotusyRating.h
//  LotusySDK
//
//  Created by pshen on 2014-07-30.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LotusyRating : NSObject

- (id) initWithParam:(double)overall
                food:(double)food
         environment:(double)environment
             service:(double)service;

- (double) overall;
- (double) food;
- (double) environment;
- (double) service;

@end

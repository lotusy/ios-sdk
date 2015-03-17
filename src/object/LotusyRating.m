//
//  LotusyRating.m
//  LotusySDK
//
//  Created by pshen on 2014-07-30.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import "LotusyRating.h"

@interface LotusyRating()

@property (nonatomic) double _overall;
@property (nonatomic) double _food;
@property (nonatomic) double _environment;
@property (nonatomic) double _service;
@end


@implementation LotusyRating

- (id) initWithParam:(double)overall
                food:(double)food
         environment:(double)environment
             service:(double)service {
    self._overall = overall;
    self._food = food;
    self._environment = environment;
    self._service = service;

    return self;
}

- (double) overall { return self._overall; }
- (double) food { return self._food; }
- (double) environment { return self._environment; }
- (double) service { return self._service; }

@end

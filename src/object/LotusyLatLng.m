//
//  LotusyLatLng.m
//  LotusySDK
//
//  Created by pshen on 2014-07-30.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import "LotusyLatLng.h"

@interface LotusyLatLng()

@property (nonatomic) double _lat;
@property (nonatomic) double _lng;

@end

@implementation LotusyLatLng

- (id) initWithLatLng:(double)lat
                  lng:(double)lng {
    self._lat = lat;
    self._lng = lng;

    return self;
}

- (double) lat {return self._lat; }
- (double) lng {return self._lng; }
@end

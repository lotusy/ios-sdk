//
//  LotusyLatLng.h
//  LotusySDK
//
//  Created by pshen on 2014-07-30.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LotusyLatLng : NSObject

- (id) initWithLatLng:(double)lat
                  lng:(double)lng;

- (double) lat;
- (double) lng;

@end

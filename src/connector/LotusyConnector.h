//
//  LotusyConnector.h
//  LotusySDK
//
//  Created by pshen on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LotusyConnectorParam.h"
#import "LotusyRESTResult.h"

@interface LotusyConnector : NSObject<NSURLConnectionDelegate>

- (id) initWithParam:(LotusyConnectorParam*)parameter;

- (void) execute:(void(^)(LotusyRESTResult*, NSDictionary*))callback;

@end

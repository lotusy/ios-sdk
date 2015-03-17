//
//  LotusyConnectorParam.m
//  LotusySDK
//
//  Created by pshen on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import "LotusyConnectorParam.h"

@interface LotusyConnectorParam()

@property (strong, nonatomic) NSString* _uri;
@property (strong, nonatomic) NSString* _method;
@property (strong, nonatomic) NSDictionary* _headers;
@property (strong, nonatomic) NSDictionary* _body;
@property (strong, nonatomic) NSData* _file;

@end


@implementation LotusyConnectorParam

- (id) initWithParam:(NSString*)uri
              method:(NSString*)method
             headers:(NSDictionary*)headers
                body:(NSDictionary*)body
                file:(NSData*)file {
    self._uri = uri;
    self._method = method;
    self._headers = headers;
    self._body = body;
    self._file = file;

    return self;
}

- (NSString*) uri {
    return self._uri;
}

- (NSString*) method {
    return self._method;
}

- (NSDictionary*) headers {
    return self._headers;
}

- (NSDictionary*) body {
    return self._body;
}

- (NSData*) file {
    return self._file;
}
@end

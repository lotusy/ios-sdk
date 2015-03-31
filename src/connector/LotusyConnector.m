//
//  LotusyConnector.m
//  LotusySDK
//
//  Created by pshen on 2014-07-29.
//  Copyright (c) 2014 lotusy. All rights reserved.
//

#import "LotusyConnector.h"

@interface LotusyConnector()

@property (nonatomic, strong) LotusyConnectorParam* param;
@property (nonatomic, strong) NSMutableData* dataJSON;
@property (nonatomic, copy) void (^_callback)(LotusyRESTResult* result, NSDictionary* response);

@end


@implementation LotusyConnector

- (id) initWithParam:(LotusyConnectorParam*)parameter {
    self.dataJSON = [[NSMutableData alloc]init];
    self.param = parameter;

    return self;
}

- (void) execute:(void(^)(LotusyRESTResult*, NSDictionary*))callback {
    self._callback = callback;

    NSString* urlStr = self.param.uri;
    NSURL *url = [NSURL URLWithString:urlStr];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:30.0];
    [request setHTTPMethod:self.param.method];

    NSDictionary* headers = self.param.headers;
    for (NSString* key in headers.allKeys) {
        [request setValue:[headers objectForKey:key] forHTTPHeaderField:key];
    }

    NSDictionary* body = self.param.body;
    if (body!=nil) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:self.param.body
                                                           options:0
                                                             error:&error];
        [request setHTTPBody:jsonData];
    }

    NSData* file = self.param.file;
    if (file!=nil) {
        [request setHTTPBody:file];
    }

    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];

    if(!connection) {
        NSLog(@"connection failed");
    }
}


- (void) connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSHTTPURLResponse* httpResponse = (NSHTTPURLResponse*)response;
    NSInteger responseStatusCode = [httpResponse statusCode];
    NSLog(@"%lu", (long)responseStatusCode);
}


- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.dataJSON appendData:data];
}


- (void) connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    LotusyRESTResult* result = nil;

    result = [[LotusyRESTResult alloc]initWithParam:NO statusCode:2];
    [result addError:error.description];

    self._callback(result, nil);
}


- (void) connectionDidFinishLoading:(NSURLConnection *)connection {
    NSError* error;
    NSDictionary* response = [NSJSONSerialization JSONObjectWithData:self.dataJSON options:kNilOptions error:&error];

    LotusyRESTResult* result = nil;

    if (error==nil) {
        NSString* status = [response objectForKey:@"status"];
        if ([status isEqualToString:@"success"]) {
            result = [[LotusyRESTResult alloc]initWithParam:YES statusCode:0];
        } else {
            result = [[LotusyRESTResult alloc]initWithParam:NO statusCode:1];
            [result addError:[response objectForKey:@"description"]];
        }
    } else {
        result = [[LotusyRESTResult alloc]initWithParam:NO statusCode:2];
        [result addError:error.description];
    }

    self._callback(result, response);
}


- (void)connection:(NSURLConnection *)connection willSendRequestForAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge
{
    NSArray *trustedHosts = [NSArray arrayWithObjects:@"192.168.175.197", nil];
    if ([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]){
        if ([trustedHosts containsObject:challenge.protectionSpace.host]) {
            [challenge.sender useCredential:[NSURLCredential credentialForTrust:challenge.protectionSpace.serverTrust] forAuthenticationChallenge:challenge];
        }
    }
    [challenge.sender continueWithoutCredentialForAuthenticationChallenge:challenge];
}

@end

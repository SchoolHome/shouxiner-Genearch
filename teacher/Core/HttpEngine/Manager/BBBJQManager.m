//
//  BBBJQManager.m
//  teacher
//
//  Created by xxx on 14-3-27.
//  Copyright (c) 2014年 ws. All rights reserved.
//

#import "BBBJQManager.h"
#import "JSONKit.h"

#define K_HOST_NAME_OF_BB_SERVER      @"http://115.29.224.151"

@implementation BBBJQManager

+(BBBJQManager *)sharedInstace{
    static BBBJQManager *sharedBJQInstance = nil;
    if (sharedBJQInstance == nil){
        sharedBJQInstance = [[BBBJQManager alloc] init];
    }
    return sharedBJQInstance;
}

-(id)init{
    if (self = [super init]) {
        //
    }
    return self;
}

-(NSMutableArray *)getCookiesArray{
    
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    //[arr addObject:[PalmUIManagement sharedInstance].suid];
    [arr addObject:[PalmUIManagement sharedInstance].php];
    
    return arr;
}

-(NSString *)urlWithPath:(NSString *) path{

    NSString *urlString = [NSString stringWithFormat:@"%@/%@",K_HOST_NAME_OF_BB_SERVER,path];
    return [NSURL URLWithString:urlString];
}

-(void)getGroupList{

    //NSString *urlString = @"http://115.29.224.151/mapi/getGroupList";
    NSURL *url = [self urlWithPath:@"mapi/getGroupList"];
    
    ASIFormDataRequest *req = [ASIFormDataRequest requestWithURL:url];
    [req setRequestMethod:@"GET"];
    //[req addRequestHeader:@"User-Agent" value:self.agentString];
    [req addRequestHeader:@"Content-Type" value:@"application/json"];
    [req setRequestCookies:(NSMutableArray *)[self getCookiesArray]];
    
    /*
    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc]init];
    NSMutableData *postData =(NSMutableData *)[[paramDic JSONString] dataUsingEncoding:NSUTF8StringEncoding] ;
    [req setPostBody:postData];
    */
    
    __weak ASIFormDataRequest *weakReq = req;
    [req setCompletionBlock:^{
        NSDictionary *data = [weakReq.responseData objectFromJSONData];
        NSLog(@"data    %@",data);
    }];
    
    [req setFailedBlock:^{
        NSLog(@"getGroupList fail");
        
        NSLog(@"%@",weakReq.error);
    }];
    
    [req startAsynchronous];
}


-(void)getTopicInfoListWithGroupID:(NSNumber *)groupid
                                ts:(NSString *)ts
                            offset:(NSNumber *)offset
                              size:(NSNumber *)size{
    
    NSURL *url = [self urlWithPath:@"mapi/getTopicList"];
    
    ASIFormDataRequest *req = [ASIFormDataRequest requestWithURL:url];
    [req setRequestMethod:@"GET"];
    //[req addRequestHeader:@"User-Agent" value:self.agentString];
    [req addRequestHeader:@"Content-Type" value:@"application/json"];
    [req setRequestCookies:(NSMutableArray *)[self getCookiesArray]];
    
    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc]init];
    [paramDic setObject:groupid forKey:groupid];
    [paramDic setObject:ts forKey:ts];
    [paramDic setObject:offset forKey:offset];
    [paramDic setObject:size forKey:size];
    
    NSMutableData *postData =(NSMutableData *)[[paramDic JSONString] dataUsingEncoding:NSUTF8StringEncoding] ;
    [req setPostBody:postData];
    
    
    __weak ASIFormDataRequest *weakReq = req;
    [req setCompletionBlock:^{
        NSDictionary *data = [weakReq.responseData objectFromJSONData];
        NSLog(@"data    %@",data);
    }];
    
    [req setFailedBlock:^{
        NSLog(@"getTopicListWithGroupID fail");
        
        NSLog(@"%@",weakReq.error);
    }];
    
    [req startAsynchronous];


}

-(void)praiseWithTopicID:(NSNumber *)topicid{

    NSURL *url = [self urlWithPath:@"mapi/praise"];
    
    ASIFormDataRequest *req = [ASIFormDataRequest requestWithURL:url];
    [req setRequestMethod:@"GET"];
    //[req addRequestHeader:@"User-Agent" value:self.agentString];
    [req addRequestHeader:@"Content-Type" value:@"application/json"];
    [req setRequestCookies:(NSMutableArray *)[self getCookiesArray]];
    
    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc]init];
    [paramDic setObject:topicid forKey:topicid];

    NSMutableData *postData =(NSMutableData *)[[paramDic JSONString] dataUsingEncoding:NSUTF8StringEncoding] ;
    [req setPostBody:postData];
    
    __weak ASIFormDataRequest *weakReq = req;
    [req setCompletionBlock:^{
        NSDictionary *data = [weakReq.responseData objectFromJSONData];
        NSLog(@"data    %@",data);
    }];
    
    [req setFailedBlock:^{
        
        NSLog(@"%@",weakReq.error);
    }];
    
    [req startAsynchronous];

}

-(void)replyWithTopicID:(NSNumber *)topicid
                comment:(NSString *)comment
                    uid:(NSNumber *)replyto{

    NSURL *url = [self urlWithPath:@"mapi/comment"];
    
    ASIFormDataRequest *req = [ASIFormDataRequest requestWithURL:url];
    [req setRequestMethod:@"GET"];
    //[req addRequestHeader:@"User-Agent" value:self.agentString];
    [req addRequestHeader:@"Content-Type" value:@"application/json"];
    [req setRequestCookies:(NSMutableArray *)[self getCookiesArray]];
    
    NSMutableDictionary *paramDic = [[NSMutableDictionary alloc]init];
    [paramDic setObject:topicid forKey:topicid];
    [paramDic setObject:comment forKey:comment];
    [paramDic setObject:replyto forKey:replyto];
    
    NSMutableData *postData =(NSMutableData *)[[paramDic JSONString] dataUsingEncoding:NSUTF8StringEncoding] ;
    [req setPostBody:postData];
    
    __weak ASIFormDataRequest *weakReq = req;
    [req setCompletionBlock:^{
        NSDictionary *data = [weakReq.responseData objectFromJSONData];
        NSLog(@"data    %@",data);
    }];
    
    [req setFailedBlock:^{
        
        NSLog(@"%@",weakReq.error);
    }];
    
    [req startAsynchronous];

}

@end

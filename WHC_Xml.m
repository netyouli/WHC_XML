//
//  WHC_Xml.m
//  BankCallNumber
//
//  Created by 吴海超 on 15/4/29.
//  Copyright (c) 2015年 吴海超. All rights reserved.
//

/*
 *  qq:712641411
 *  gitHub:https://github.com/netyouli
 *  csdn:http://blog.csdn.net/windwhc/article/category/3117381
 */

#import "WHC_Xml.h"

@interface WHC_Xml (){
    NSMutableString              * _xmlString;
    NSString                     * _rootAttribute;
}

@end

@implementation WHC_Xml

- (instancetype)initWithEncode:(NSString *)encode attribute:(NSString*)attribute{
    self = [super init];
    if(self){
        _rootAttribute = attribute;
        _xmlString = [NSMutableString new];
        [_xmlString appendFormat:@"<?xml version=\"1.0\" encoding=\"%@\"?>",encode];
    }
    return self;
}

+ (NSString*)xmlWithDictionary:(NSDictionary*)dict encode:(NSString*)encode rootAttribute:(NSString*)rootAttribute{
    WHC_Xml  * whcXml = [[WHC_Xml alloc]initWithEncode:encode attribute:rootAttribute];
    return [whcXml handleDictEngine:dict arrKey:@"" root:YES];
}

+ (NSString*)xmlWithDictionary:(NSDictionary*)dict encode:(NSString*)encode{
    return [WHC_Xml xmlWithDictionary:dict encode:encode rootAttribute:@""];
}

+ (NSString*)xmlWithDictionary:(NSDictionary*)dict{
    return [WHC_Xml xmlWithDictionary:dict encode:@"utf-8"];
}

+ (NSString*)xmlWithDictionary:(NSDictionary*)dict rootAttribute:(NSString*)rootAttribute{
    return [WHC_Xml xmlWithDictionary:dict encode:@"utf-8" rootAttribute:rootAttribute];
}

- (NSString*)handleDictEngine:(id)object arrKey:(NSString*)arrKey root:(BOOL)root{
    if([object isKindOfClass:[NSDictionary class]]){
        NSDictionary  * dict = object;
        NSInteger       count = dict.count;
        NSArray       * keyArr = [dict allKeys];
        for (NSInteger i = 0; i < count; i++) {
            id subObject = dict[keyArr[i]];
            if([subObject isKindOfClass:[NSDictionary class]]){
                if(root && _rootAttribute && _rootAttribute.length){
                    [_xmlString appendFormat:@"<%@ %@>",keyArr[i],_rootAttribute];
                }else{
                    [_xmlString appendFormat:@"<%@>",keyArr[i]];
                }
                [self handleDictEngine:subObject arrKey:@"" root:NO];
                [_xmlString appendFormat:@"</%@>",keyArr[i]];
            }else if ([subObject isKindOfClass:[NSArray class]]){
                [self handleDictEngine:subObject arrKey:keyArr[i] root:NO];
            }else{
                [_xmlString appendFormat:@"<%@>%@</%@>",keyArr[i],subObject,keyArr[i]];
            }
        }
    }else if([object isKindOfClass:[NSArray class]]){
        NSArray  * dictArr = object;
        NSInteger  count = dictArr.count;
        for (NSInteger i = 0; i < count; i++) {
            [_xmlString appendFormat:@"<%@>",arrKey];
            [self handleDictEngine:dictArr[i] arrKey:arrKey root:NO];
            [_xmlString appendFormat:@"</%@>",arrKey];
        }
    }
    if(_rootAttribute && _rootAttribute.length){
        
    }
    return _xmlString;
}
@end

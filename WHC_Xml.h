//
//  WHC_Xml.h
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

#import <Foundation/Foundation.h>

@interface WHC_Xml : NSObject

- (instancetype)initWithEncode:(NSString *)encode attribute:(NSString*)attribute;
+ (NSString*)xmlWithDictionary:(NSDictionary*)dict encode:(NSString*)encode rootAttribute:(NSString*)rootAttribute;
+ (NSString*)xmlWithDictionary:(NSDictionary*)dict encode:(NSString*)encode;
+ (NSString*)xmlWithDictionary:(NSDictionary*)dict;
+ (NSString*)xmlWithDictionary:(NSDictionary*)dict rootAttribute:(NSString*)rootAttribute;
@end

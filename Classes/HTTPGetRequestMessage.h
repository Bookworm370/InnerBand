//
//  HTTPGetRequestMessage.h
//  MessageCenter
//
//  Created by John Blanco on 3/16/10.
//  Copyright 2010 Effective UI. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DispatchMessage.h"

/*
 * 
 * MessageCenter will dispatch an HTTPGetRequestMessage after it processes the URL request you provide it.
 * When specifying a URL, you can provide substitution parameters using the syntax [MYPARAM] and
 * then providing the values for those parameters in the userInfo dictionary.
 *
 * INPUT: none
 * OUTPUT: the HTTP response data on success, nil on error
 *
 * USER INFO:
 *    HTTP_STATUS_CODE - HTTP status code of result
 *
 */

#define HTTP_STATUS_CODE @"HTTP_STATUS_CODE"

@interface HTTPGetRequestMessage : DispatchMessage {
	NSString *_url;
	NSMutableData *_responseData;
}

+ (id)messageWithName:(NSString *)name userInfo:(NSDictionary *)userInfo url:(NSString *)url;
	
@end

//
// Copyright 2009-2010 Facebook
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//    http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//

#import "IBGlobalNetwork.h"

@protocol IBURLRequestDelegate;
@protocol IBURLResponse;

/**
 * The Three20 network request object, built to work with the Three20 cache and co.
 *
 * Allows customization of the http method, body, and parameters, as well as natural response
 * processing using IBURLResponse objects.
 */
@interface IBURLRequest : NSObject {
  NSString*             _URL;

  NSString*             _httpMethod;
  NSData*               _httpBody;
  NSMutableDictionary*  _parameters;
  NSMutableDictionary*  _headers;

  NSString*             _contentType;
  NSStringEncoding      _charsetForMultipart;

  NSMutableArray*       _files;

  id<IBURLResponse>     _response;

  IBURLRequestCachePolicy _cachePolicy;
  NSTimeInterval          _cacheExpirationAge;
  NSString*               _cacheKey;

  NSDate*               _timestamp;

  NSInteger             _totalBytesLoaded;
  NSInteger             _totalBytesExpected;

  id    _userInfo;

  BOOL  _isLoading;
  BOOL  _shouldHandleCookies;
  BOOL  _respondedFromCache;
  BOOL  _filterPasswordLogging;

  NSMutableArray* _delegates;
}

/**
 * The URL to be loaded by the request.
 */
@property(nonatomic,copy) NSString* URL;

/**
 * The HTTP method to send with the request.
 *
 * @example @"POST"
 * @example @"GET"
 * @example @"PUT"
 * @default nil (equivalent to @"GET")
 */
@property(nonatomic,copy) NSString* httpMethod;

/**
 * An object that handles the response data and may parse and validate it.
 *
 * @see IBURLDataResponse
 * @see IBURLImageResponse
 */
@property(nonatomic,retain) id<IBURLResponse> response;

/**
 * The HTTP body to send with the request.
 *
 * If provided, will always be used. Please consider this when using POST/PUT methods: if
 * httpBody is provided, then the POST/PUT data generated from the parameters property will not
 * be used.
 */
@property(nonatomic,retain) NSData* httpBody;

/**
 * The content type of the data in the request.
 *
 * If not provided and httpMethod is POST/PUT, then contentType is multipart/form-data.
 */
@property(nonatomic,copy) NSString* contentType;

/**
 * Parameters to use for an HTTP POST/PUT.
 */
@property(nonatomic,readonly) NSMutableDictionary* parameters;

/**
 * Custom HTTP headers.
 */
@property(nonatomic,readonly) NSMutableDictionary* headers;

/**
 * @default IBURLRequestCachePolicyDefault
 */
@property(nonatomic) IBURLRequestCachePolicy cachePolicy;

/**
 * The maximum age of cached data that can be used as a response.
 *
 * @default IB_DEFAULT_CACHE_EXPIRATION_AGE (1 week)
 */
@property(nonatomic) NSTimeInterval cacheExpirationAge;

/**
 * If no cache key is provided, a unique key is generated from the request data. If the request
 * is a POST/PUT request, then the POST/PUT parameters are also used to generate the cache key.
 *
 * By setting the cacheKey, you may override the default cache key generator with your own.
 */
@property(nonatomic,retain) NSString* cacheKey;

/**
 * A dummy object used to uniquely identify this request object once it's been sent into the fray.
 * Generally IBUserInfo objects are used here.
 *
 * @see IBUserInfo
 */
@property(nonatomic,retain) id userInfo;

@property(nonatomic,retain) NSDate* timestamp;

/**
 * Whether or not the request is currently active.
 */
@property(nonatomic) BOOL isLoading;

/**
 * Decide whether default cookie handling will happen for this request.
 *
 * @param YES if cookies should be sent with and set for this request;
 *        otherwise NO.
 * @discussion The default is YES - in other words, cookies are sent from and
 *             stored to the cookie manager by default.
 *
 * @default YES
 */
@property(nonatomic) BOOL shouldHandleCookies;

/**
 * The number of bytes loaded by this request.
 */
@property(nonatomic) NSInteger totalBytesLoaded;

/**
 * The number of expected bytes from this request.
 */
@property(nonatomic) NSInteger totalBytesExpected;

/**
 * Whether or not the request was loaded from the cache.
 *
 * This is only valid after the request has completed.
 */
@property(nonatomic) BOOL respondedFromCache;

/**
 * Whether parameters named "password" should be suppressed in log messages.
 */
@property(nonatomic,assign) BOOL filterPasswordLogging;

/**
 * Charset to use when creating multipart/form-data data.
 *
 * @default NSUTF8StringEncoding to remain backwards compatible.
 */
@property(nonatomic) NSStringEncoding charsetForMultipart;

/**
 * An array of non-retained objects that receive messages about the progress of the request.
 */
@property(nonatomic,readonly) NSMutableArray* delegates;

+ (IBURLRequest*)request;

+ (IBURLRequest*)requestWithURL:(NSString*)URL delegate:(id /*<IBURLRequestDelegate>*/)delegate;

- (id)initWithURL:(NSString*)URL delegate:(id /*<IBURLRequestDelegate>*/)delegate;

- (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field;

/**
 * Add a file whose data will be posted.
 */
- (void)addFile:(NSData*)data mimeType:(NSString*)mimeType fileName:(NSString*)fileName;

/**
 * Attempt to send a request.
 *
 * If the request can be resolved by the cache, it will happen synchronously.  Otherwise,
 * the request will respond to its delegate asynchronously.
 *
 * @return YES if the request was loaded synchronously from the cache.
 */
- (BOOL)send;

/**
 * Attempt to send a synchronous request.
 *
 * The request will happen synchronously, regardless of whether the data is being grabbed from
 * the network or from the cache.
 *
 * @return YES if the request was loaded from the cache.
 */
- (BOOL)sendSynchronously;

/**
 * Cancel the request.
 *
 * If there are multiple requests going to the same URL as this request, the others will
 * not be cancelled.
 */
- (void)cancel;

- (NSURLRequest*)createNSURLRequest;

@end

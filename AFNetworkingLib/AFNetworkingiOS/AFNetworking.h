//
//  AFNetworkingLib.h
//  AFNetworkingLib
//
//  Created by Rupert on 09/02/2015.
//  Copyright (c) 2015 Alamofire. All rights reserved.
//

#import <UIKit/UIKit.h>

//! Project version number for AFNetworkingLib.
FOUNDATION_EXPORT double AFNetworkingLibVersionNumber;

//! Project version string for AFNetworkingLib.
FOUNDATION_EXPORT const unsigned char AFNetworkingLibVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <AFNetworkingLib/PublicHeader.h>


#import <Foundation/Foundation.h>
#import <Availability.h>

#import "AFURLRequestSerialization.h"
#import "AFURLResponseSerialization.h"
#import "AFSecurityPolicy.h"
#import "AFNetworkReachabilityManager.h"

#import "AFURLConnectionOperation.h"
#import "AFHTTPRequestOperation.h"
#import "AFHTTPRequestOperationManager.h"

#import "UIKit+AFNetworking.h"

#if ( ( defined(__MAC_OS_X_VERSION_MAX_ALLOWED) && __MAC_OS_X_VERSION_MAX_ALLOWED >= 1090) || \
( defined(__IPHONE_OS_VERSION_MAX_ALLOWED) && __IPHONE_OS_VERSION_MAX_ALLOWED >= 70000 ) )

    #import "AFURLSessionManager.h"
    #import "AFHTTPSessionManager.h"

#endif
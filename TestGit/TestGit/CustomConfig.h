//
//  CustomConfig.h
//  TestGit
//
//  Created by apple on 2018/8/2.
//  Copyright © 2018年 apple. All rights reserved.
//

#ifndef CustomConfig_h
#define CustomConfig_h

#ifdef DEBUG
#define NSLog(format, ...) printf("[%s] %s [line %d] %s\n", __TIME__, __FUNCTION__, __LINE__, [[NSString stringWithFormat:format, ## __VA_ARGS__] UTF8String]);
#else
#define NSLog(format, ...)
#endif


#endif /* CustomConfig_h */

//
//  LocalNotificationManager.h
//  Pong
//
//  Created by Ades on 11/09/2015.
//  Copyright (c) 2015 Ades. All rights reserved.
//



#import <Foundation/Foundation.h>



@interface LocalNotificationManager : NSObject



+ (void)registerLocalNotifications;
+ (void)schedulLocalNotification:(UILocalNotification*)localNotification
                         withKey:(NSString*)notificationKey;
+ (void)cancelScheduledLocalNotificationWithKey:(NSString*)notificationKey;



@end

//
//  LocalNotificationManager.m
//  Pong
//
//  Created by Ades on 11/09/2015.
//  Copyright (c) 2015 Ades. All rights reserved.
//



#import "LocalNotificationManager.h"



@implementation LocalNotificationManager



#pragma mark -
#pragma mark Public Methods



+ (void)registerLocalNotifications
{
    UIUserNotificationType lTypes =  UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    UIUserNotificationSettings* lMySettings = [UIUserNotificationSettings settingsForTypes:lTypes categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:lMySettings];
}


+ (void)schedulLocalNotification:(UILocalNotification*)localNotification
                         withKey:(NSString*)notificationKey
{
    NSMutableDictionary* lUserInfo = [NSMutableDictionary dictionaryWithDictionary:localNotification.userInfo];
    [lUserInfo setObject:notificationKey forKey:@"LocalNotificationManager_NotificationKey"];
    localNotification.userInfo = lUserInfo;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}


+ (void)cancelScheduledLocalNotificationWithKey:(NSString*)notificationKey
{
    for (UILocalNotification* aNotification in [[UIApplication sharedApplication] scheduledLocalNotifications])
    {
        if ([aNotification.userInfo valueForKey:@"LocalNotificationManager_NotificationKey"] &&
            [[aNotification.userInfo valueForKey:@"LocalNotificationManager_NotificationKey"] isKindOfClass:[NSString class]] &&
            [[aNotification.userInfo valueForKey:@"LocalNotificationManager_NotificationKey"] isEqualToString:notificationKey])
        {
            [[UIApplication sharedApplication] cancelLocalNotification:aNotification];
        }
    }
}



@end

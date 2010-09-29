//
//  Macros.h
//  iBoost
//
//  iBoost - The iOS Booster!
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import <MobileCoreServices/UTCoreTypes.h>
#import <CoreMotion/CoreMotion.h>

// TYPES

#define BOX_BOOL(x) [NSNumber numberWithBool:(x)]
#define BOX_INT(x) [NSNumber numberWithInt:(x)]
#define BOX_LONG(x) [NSNumber numberWithLong:(x)]
#define BOX_UINT(x) [NSNumber numberWithUnsignedInt:(x)]
#define BOX_FLOAT(x) [NSNumber numberWithFloat:(x)]
#define BOX_DOUBLE(x) [NSNumber numberWithDouble:(x)]

#define UNBOX_BOOL(x) [(x) boolValue]
#define UNBOX_INT(x) [(x) intValue]
#define UNBOX_LONG(x) [(x) longValue]
#define UNBOX_UINT(x) [(x) unsignedIntValue]
#define UNBOX_FLOAT(x) [(x) floatValue]
#define UNBOX_DOUBLE(x) [(x) doubleValue]

// MEMORY

#define RELEASE_AND_NIL(obj) ([obj release], obj = nil)
#define RETAIN_RELEASE_AND_ASSIGN_TO(obj, expr) ([(expr) retain], [obj release], obj = (expr))

// BOUNDS

#define RECT_INSET_BY_LEFT_TOP_RIGHT_BOTTOM(rect, left, top, right, bottom) CGRectMake(rect.origin.x + (left), rect.origin.y + (top), rect.size.width - (left) - (right), rect.size.height - (top) - (bottom))
#define RECT_INSET_BY_TOP_BOTTOM(rect, top, bottom) CGRectMake(rect.origin.x, rect.origin.y + (top), rect.size.width, rect.size.height - (top) - (bottom))
#define RECT_INSET_BY_TOP(rect, top) CGRectMake(rect.origin.x, rect.origin.y + (top), rect.size.width, rect.size.height - (top))
#define RECT_INSET_BY_BOTTOM(rect, bottom) CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height - (bottom))
#define RECT_INSET_BY_LEFT_RIGHT(rect, left, right) CGRectMake(rect.origin.x + (left), rect.origin.y, rect.size.width - (left) - (right), rect.size.height)
#define RECT_INSET_BY_LEFT(rect, left) CGRectMake(rect.origin.x + (left), rect.origin.y, rect.size.width - (left), rect.size.height)
#define RECT_INSET_BY_RIGHT(rect, right) CGRectMake(rect.origin.x, rect.origin.y, rect.size.width - (right), rect.size.height)
#define RECT_INSET_BY_TOP_LEFT(rect, top, left) CGRectMake(rect.origin.x + (left), rect.origin.y + (top), rect.size.width - (left), rect.size.height - (top))
#define RECT_INSET_BY_BOTTOM_RIGHT(rect, bottom, right) CGRectMake(rect.origin.x, rect.origin.y, rect.size.width - (right), rect.size.height - (bottom))
#define RECT_INSET_BY(rect, inset) CGRectMake(rect.origin.x + (inset), rect.origin.y + (inset), rect.size.width - (inset) * 2, rect.size.height - (inset) * 2)
#define RECT_DUPLICATED_AND_OFFSET_FROM_BY_X(rect, offset) CGRectMake(rect.origin.x + rect.size.width + (offset), rect.origin.y, rect.size.width, rect.size.height)
#define RECT_DUPLICATED_AND_OFFSET_FROM_BY_Y(rect, offset) CGRectMake(rect.origin.x, rect.origin.y + rect.size.height + (offset), rect.size.width, rect.size.height)
#define RECT_OFFSET_BY_X_Y(rect, x, y) CGRectMake(rect.origin.x + (x), rect.origin.y + (y), rect.size.width, rect.size.height)

// SELECTORS

#define SEL(x) @selector(x)

// STRINGS

#define IS_EMPTY_STRING(str) (!(str) || ![(str) isKindOfClass:NSString.class] || [(str) length] == 0)
#define IS_POPULATED_STRING(str) ((str) && [(str) isKindOfClass:NSString.class] && [(str) length] > 0)

// SCREEN/DISPLAY

#define IS_DEVICE_ORIENTATION_PORTRAIT ([UIDevice currentDevice].orientation == UIDeviceOrientationPortrait)
#define IS_DEVICE_ORIENTATION_LANDSCAPE ([UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeLeft || [UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeRight)
#define IS_DEVICE_ORIENTATION_LANDSCAPE_LEFT ([UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeLeft)
#define IS_DEVICE_ORIENTATION_LANDSCAPE_RIGHT ([UIDevice currentDevice].orientation == UIDeviceOrientationLandscapeRight)
#define IS_DEVICE_ORIENTATION_PORTRAIT_UPSIDE_DOWN ([UIDevice currentDevice].orientation == UIDeviceOrientationPortraitUpsideDown)
#define IS_DEVICE_ORIENTATION_FACE_UP ([UIDevice currentDevice].orientation == UIDeviceOrientationFaceUp)
#define IS_DEVICE_ORIENTATION_FACE_DOWN ([UIDevice currentDevice].orientation == UIDeviceOrientationFaceDown)

#define HARDWARE_SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define HARDWARE_SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

// DUMPS
#define RECT_TO_STR(r) ([NSString stringWithFormat:@"X=%0.1f Y=%0.1f W=%0.1f H=%0.1f", (r).origin.x, (r).origin.y, (r).size.width, (r).size.height])
#define POINT_TO_STR(p) ([NSString stringWithFormat:@"X=%0.1f Y=%0.1f", (p).x, (p).y])
#define SIZE_TO_STR(s) ([NSString stringWithFormat:@"W=%0.1f H=%0.1f", (s).width, (s).height])

// HARDWARE/OS SUPPORT

#define DEVICE_UDID ([UIDevice currentDevice].uniqueIdentifier)

#define IS_CLASSIC_DISPLAY (([UIScreen mainScreen].scale < 1.5F))
#define IS_RETINAL_DISPLAY (([UIScreen mainScreen].scale > 1.5F))

#define IS_MULTITASKING_IN_SDK ([[UIDevice currentDevice] respondsToSelector:@selector(isMultitaskingSupported)] && [[UIDevice currentDevice] isMultitaskingSupported] == YES) 
#define IS_CAMERA_IN_SDK ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
#define IS_VIDEO_IN_SDK ([[UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera] containsObject:(NSString *)kUTTypeMovie])
#define IS_GYROSCOPE_IN_SDK ([[[[CMMotionManager alloc] init] autorelease] isAccelerometerAvailable] == YES)

// COLORS

#define RGB256_TO_COL(col) ((col) / 255.0f)
#define COL_TO_RGB256(col) ((int)((col) * 255.0))

/*
#define IS_OS_2_0_CAPABLE
#define IS_OS_3_0_CAPABLE
#define IS_OS_3_1_CAPABLE
#define IS_OS_3_1_3_CAPABLE
#define IS_OS_3_2_CAPABLE
#define IS_OS_4_0_CAPABLE

#define IS_IPHONE ([UIDevice currentDevice].name)
#define IS_IPOD_TOUCH ([UIDevice currentDevice].name)
#define IS_IPAD ([UIDevice currentDevice].name)

#define IS_BLUETOOTH_IN_SDK

#define IS_BLUETOOTH_SUPPORTED
#define IS_GYROSCOPE_SUPPORTED
*/
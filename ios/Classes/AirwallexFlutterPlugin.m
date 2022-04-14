#import "AirwallexFlutterPlugin.h"
#if __has_include(<airwallex_flutter/airwallex_flutter-Swift.h>)
#import <airwallex_flutter/airwallex_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "airwallex_flutter-Swift.h"
#endif

@implementation AirwallexFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAirwallexFlutterPlugin registerWithRegistrar:registrar];
}
@end

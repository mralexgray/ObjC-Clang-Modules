/*/../bin/ls > /dev/null; COMPILED="${0%.*}"
/usr/bin/clang -v "$0" -isysroot / -o "$COMPILED" -fmodules
ECHO=$("$COMPILED"); SUCCESS=$(osascript -e "tell app \"System Events\" to display dialog \"$ECHO\"")
rm "$COMPILED"; exit;
*/

@import Foundation;
@import ModularFramework;

int main(int argc, char *argv[]) { @autoreleasepool {

	  	SubLibPrint(@"Hello %s (pid:%i)", [NSProcessInfo.processInfo.environment[@"USER"] UTF8String],
                                         NSProcessInfo.processInfo.processIdentifier);

} return EXIT_SUCCESS; }

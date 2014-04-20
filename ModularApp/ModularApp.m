
@import   ModularFramework ;
//@import   ModularFramework.SubUmbrella;


@interface      ModularApp : NSObject @end

@implementation ModularApp - (void) awakeFromNib {


  [ModularFramework beModular];

  PrivateIvar * prvt = PrivateIvar.new;

  [self testPrivateIvars:prvt];

  [prvt setValue:@"clang" forKey:@"a"];
  [prvt setValue:@NO      forKey:@"b"];

  [self testPrivateIvars:prvt];

  SubLibPrint( ModularSubLibrary.new );
  SubLibPrint( SubLibRunCLITest()    );
  SubLibPrint( SubUmbrella.new       );
}

- (void) testPrivateIvars:(PrivateIvar*)i {

  SubLibPrint(@"%@ a = %@ b = %@", i, [i valueForKey:@"a"], [[i valueForKey:@"b"]boolValue] ? @"YES" : @"NO");
}

//  setDockIcon([NSImage imageNamed:@"LLVM.logo"]);

@end

int main(int c, const char * v[]) { return NSAPPMAIN(c,v); }



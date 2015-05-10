/* All Rights reserved */

#include <AppKit/AppKit.h>
#include <AppKit/NSDocument.h>

@class NSDocument; 
NSString * FZTextDocumentType = @"FZTextDocumentType";
@interface Document : NSDocument
{
  @protected
    id textView;
    NSString* fileContents;
}
- (BOOL) readFromData:(NSData*) representation ofType:(NSString*)type error: (NSError**)error;
- (NSData*) dataOfType:(NSString*)type error:(NSError**)error;
- (NSString*) windowNibName;
@end

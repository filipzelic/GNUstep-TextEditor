/* All Rights reserved */

#include <AppKit/AppKit.h>
#include <AppKit/NSDocument.h>

@class NSDocument; 
NSString * GSTextDocumentType = @"GSTextDocumentType";
@interface Document : NSDocument
{
	@protected
    id textView;
    NSString* fileContents;
}
- (BOOL) loadDataRepresentation:(NSData*)representation ofType:(NSString*)type;
- (NSData*) dataRepresentationOfType: (NSString*)type; 
- (NSString*) windowNibName;
@end

/* All Rights reserved */

#include <AppKit/AppKit.h>
#include "Document.h"

@implementation Document
- (BOOL) loadDataRepresentation:(NSData*) representation ofType:(NSString*)type
{
   if (![type isEqual:GSTextDocumentType])
       return NO;

   if (self->fileContents) RELEASE(self->fileContents); 

   self->fileContents = [NSString alloc];
   self->fileContents = [self->fileContents initWithBytes: [representation bytes]
                                                   length: [representation length]
                                                 encoding: NSASCIIStringEncoding]; 

   if (!self->fileContents)
       return NO; 

   [self->textView setString: fileContents];
   return YES;
}

- (NSData*) dataRepresentationOfType:(NSString*)type
{
    if (![type isEqual:GSTextDocumentType])
        return nil; 

    NSData * stringData =  [[textView string] dataUsingEncoding:NSASCIIStringEncoding];  
    return stringData; 
}

- (NSString *) windowNibName
{
   return @"Document.gorm";
}
@end

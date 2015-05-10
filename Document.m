/* All Rights reserved */

#include <AppKit/AppKit.h>
#include "Document.h"

@implementation Document
- (BOOL) readFromData:(NSData*) representation ofType:(NSString*)type error: (NSError**)error
{
   NSLog(@"reading from type %@", type);
   if (![type isEqualToString:FZTextDocumentType])
     {
       NSLog(@"Wrong document type; should be %@", FZTextDocumentType);
       return NO;
     }

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

- (NSData*) dataOfType:(NSString*)type error:(NSError**)error
{
    if (![type isEqual:FZTextDocumentType])
        return nil; 

    NSData * stringData =  [[textView string] dataUsingEncoding:NSASCIIStringEncoding];  
    return stringData; 
}

- (NSString *) windowNibName
{
   return @"Document.gorm";
}
@end

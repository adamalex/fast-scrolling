//
//  FirstLastExampleTableViewCell.m
//  FastScrolling
//
//  Created by Loren Brichter on 12/9/08.
//  Copyright 2008 atebits. All rights reserved.
//

#import "FirstLastExampleTableViewCell.h"

@implementation FirstLastExampleTableViewCell

@synthesize firstText;
@synthesize lastText;

static UIFont *firstTextFont = nil;
static UIFont *lastTextFont = nil;

+ (void)initialize
{
	if(self == [FirstLastExampleTableViewCell class])
	{
		firstTextFont = [[UIFont systemFontOfSize:20] retain];
		lastTextFont = [[UIFont boldSystemFontOfSize:20] retain];
		// this is a good spot to load any graphics you might be drawing in -drawContentView:
		// just load them and retain them here (ONLY if they're small enough that you don't care about them wasting memory)
		// the idea is to do as LITTLE work (e.g. allocations) in -drawContentView: as possible
	}
}

- (void)dealloc
{
	[firstText release];
	[lastText release];
    [super dealloc];
}

// the reason I don't synthesize setters for 'firstText' and 'lastText' is because I need to 
// call -setNeedsDisplay when they change

- (void)setFirstText:(NSString *)s
{
	[firstText release];
	firstText = [s copy];
	[self setNeedsDisplay]; 
}

- (void)setLastText:(NSString *)s
{
	[lastText release];
	lastText = [s copy];
	[self setNeedsDisplay]; 
}

- (void)layoutSubviews
{
	CGRect b = [self bounds];
	b.size.height -= 1; // leave room for the separator line
	b.size.width += 30; // allow extra width to slide for editing
	b.origin.x -= (self.editing) ? 0 : 30; // start 30px left unless editing
	[contentView setFrame:b];
    [super layoutSubviews];
}

- (void)drawContentView:(CGRect)r
{
	CGContextRef context = UIGraphicsGetCurrentContext();

	UIColor *backgroundColor = [UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
	UIColor *textColor = [UIColor blackColor];
	
	if(self.selected)
	{
		backgroundColor = [UIColor clearColor];
		textColor = [UIColor whiteColor];
	}
	
	[backgroundColor set];
	CGContextFillRect(context, r);
	
	CGPoint p;
	p.x = 42;
	p.y = 9;
	
	[textColor set];
	CGSize s = [firstText drawAtPoint:p withFont:firstTextFont];
	
	p.x += s.width + 6; // space between words
	[lastText drawAtPoint:p withFont:lastTextFont];
}

@end

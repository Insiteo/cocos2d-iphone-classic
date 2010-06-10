//
//  ES1Renderer.m
//
// File autogenerated with Xcode
// Adapted to cocos2d
//

#import "ES1Renderer.h"
#import "OpenGL_Internal.h"
#import "ccMacros.h"

@implementation ES1Renderer

@synthesize context=context_;

// Create an OpenGL ES 1.1 context
- (id)initWithDepthFormat:(GLuint)depthFormat
{
    if ((self = [super init]))
    {
        context_ = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES1];

        if (!context_ || ![EAGLContext setCurrentContext:context_])
        {
            [self release];
            return nil;
        }

        // Create default framebuffer object. The backing will be allocated for the current layer in -resizeFromLayer
        glGenFramebuffersOES(1, &defaultFramebuffer_);
		NSAssert( defaultFramebuffer_, @"Can't create default frame buffer");
        glGenRenderbuffersOES(1, &colorRenderbuffer_);
		NSAssert( colorRenderbuffer_, @"Can't create default render buffer");
				 
        glBindFramebufferOES(GL_FRAMEBUFFER_OES, defaultFramebuffer_);
        glBindRenderbufferOES(GL_RENDERBUFFER_OES, colorRenderbuffer_);
        glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_COLOR_ATTACHMENT0_OES, GL_RENDERBUFFER_OES, colorRenderbuffer_);

		depthFormat_ = depthFormat;

		if( depthFormat_ ) {
//			glGenRenderbuffersOES(1, &depthBuffer_);
//			glBindRenderbufferOES(GL_RENDERBUFFER_OES, depthBuffer_);
//			glRenderbufferStorageOES(GL_RENDERBUFFER_OES, depthFormat_, 100, 100);
//			glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_DEPTH_ATTACHMENT_OES, GL_RENDERBUFFER_OES, depthBuffer_);
			
			// default buffer
//			glBindRenderbufferOES(GL_RENDERBUFFER_OES, colorRenderbuffer_);
		}

		CHECK_GL_ERROR();
    }

    return self;
}

- (BOOL)resizeFromLayer:(CAEAGLLayer *)layer
{	
    // Allocate color buffer backing based on the current layer size
    glBindRenderbufferOES(GL_RENDERBUFFER_OES, colorRenderbuffer_);
    [context_ renderbufferStorage:GL_RENDERBUFFER_OES fromDrawable:layer];
    glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_WIDTH_OES, &backingWidth_);
    glGetRenderbufferParameterivOES(GL_RENDERBUFFER_OES, GL_RENDERBUFFER_HEIGHT_OES, &backingHeight_);

    if (glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES) != GL_FRAMEBUFFER_COMPLETE_OES)
    {
        NSLog(@"Failed to make complete framebuffer object %x", glCheckFramebufferStatusOES(GL_FRAMEBUFFER_OES));
        return NO;
    }

	if (depthFormat_) {
		if( ! depthBuffer_ )
			glGenRenderbuffersOES(1, &depthBuffer_);
		
		glBindRenderbufferOES(GL_RENDERBUFFER_OES, depthBuffer_);
		glRenderbufferStorageOES(GL_RENDERBUFFER_OES, depthFormat_, backingWidth_, backingHeight_);
		glFramebufferRenderbufferOES(GL_FRAMEBUFFER_OES, GL_DEPTH_ATTACHMENT_OES, GL_RENDERBUFFER_OES, depthBuffer_);

		// bind color buffer
		glBindRenderbufferOES(GL_RENDERBUFFER_OES, colorRenderbuffer_);

	}
    return YES;
}

-(CGSize) backingSize
{
	return CGSizeMake( backingWidth_, backingHeight_);
}

- (NSString*) description
{
	return [NSString stringWithFormat:@"<%@ = %08X | size = %ix%i>", [self class], self, backingWidth_, backingHeight_];
}

- (void)dealloc
{
	CCLOGINFO(@"cocos2d: deallocing %@", self);

    // Tear down GL
    if(defaultFramebuffer_)
    {
        glDeleteFramebuffersOES(1, &defaultFramebuffer_);
        defaultFramebuffer_ = 0;
    }

    if(colorRenderbuffer_)
    {
        glDeleteRenderbuffersOES(1, &colorRenderbuffer_);
        colorRenderbuffer_ = 0;
    }

	if( depthBuffer_ )
	{
		glDeleteRenderbuffersOES(1, &depthBuffer_);
		depthBuffer_ = 0;
	}
	
    // Tear down context
    if ([EAGLContext currentContext] == context_)
        [EAGLContext setCurrentContext:nil];

    [context_ release];
    context_ = nil;

    [super dealloc];
}

@end

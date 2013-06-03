/*
 * Copyright (c) 2013, Creeaaakk Ware
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of Creeaaakk Ware nor the
 *       names of its contributors may be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL <COPYRIGHT HOLDER> BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

#import "CWLinkedList.h"

@implementation CWLinkedList

+ (id)list
{
    return [[self alloc] init];
}

// designated
- (id)init
{
    if (self = [super init])
    {
        head = nil;
        tail = nil;
        size = 0;
    }
    
    return self;
}

- (BOOL)add:(id)item
{
    CWLinkedNode *node = [CWLinkedNode nodeWithData:item];
    
    if (self.isEmpty)
    {
        head = node;
        tail = node;
    }
    else if (!self.isFull)
    {
        tail.next = node;
        node.prev = tail;
        tail = node;
    }
    else
    {
        return NO;
    }
    
    size++;
    return YES;
}

- (BOOL)addFirst:(id)item
{
    CWLinkedNode *node = [CWLinkedNode nodeWithData:item];
    
    if (self.isEmpty)
    {
        head = node;
        tail = node;
    }
    else if (!self.isFull)
    {
        head.prev = node;
        node.next = head;
        head = node;
    }
    else
    {
        return NO;
    }
    
    size++;
    return YES;
}

- (id)remove
{
    if (self.isEmpty)
    {
        return nil;
    }
    else
    {
        id data = head.data;
        
        if (head == tail)
        {
            head = nil;
            tail = nil;
        }
        else
        {
            head.next.prev = nil;
            head = head.next;
        }
        
        size--;
        return data;
    }
}

- (id)removeLast
{
    if (self.isEmpty)
    {
        return nil;
    }
    else
    {
        id data = tail.data;
        
        if (head == tail)
        {
            head = nil;
            tail = nil;
        }
        else
        {
            tail.prev.next = nil;
            tail = tail.prev;
        }
        
        size--;
        return data;
    }
}

- (NSUInteger)size
{
    return size;
}

- (BOOL)isEmpty
{
    return size == 0;
}

- (BOOL)isFull
{
    return size == NSUIntegerMax;
}

@end

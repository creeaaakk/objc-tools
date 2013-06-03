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

#import "CWLinkedListTests.h"

@implementation CWLinkedList (Test)

- (CWLinkedNode *)head
{
    return head;
}

- (CWLinkedNode *)tail
{
    return tail;
}

@end

@implementation CWLinkedListTests

- (void)testAdd
{
    CWLinkedList *list = [CWLinkedList list];
    NSString *one = @"1";
    NSString *two = @"2";
    STAssertNil(list.head, nil);
    STAssertNil(list.tail, nil);
    STAssertTrue([list isEmpty], nil);
    
    [list add:one];
    STAssertNotNil(list.head, nil);
    STAssertNotNil(list.tail, nil);
    STAssertEquals(list.head, list.tail, nil);
    STAssertFalse([list isEmpty], nil);
    STAssertEquals((NSUInteger) 1, list.size, nil);
    STAssertEquals(one, list.head.data, nil);
    
    [list add:two];
    STAssertNotNil(list.head, nil);
    STAssertNotNil(list.tail, nil);
    STAssertTrue(list.head != list.tail, nil);
    STAssertFalse([list isEmpty], nil);
    STAssertEquals((NSUInteger) 2, list.size, nil);
    STAssertEquals(one, list.head.data, nil);
    STAssertEquals(two, list.tail.data, nil);
}

- (void)testAddFirst
{
    CWLinkedList *list = [CWLinkedList list];
    NSString *one = @"1";
    NSString *two = @"2";
    STAssertNil(list.head, nil);
    STAssertNil(list.tail, nil);
    STAssertTrue([list isEmpty], nil);
    
    [list addFirst:one];
    STAssertNotNil(list.head, nil);
    STAssertNotNil(list.tail, nil);
    STAssertTrue(list.head == list.tail, nil);
    STAssertEquals((NSUInteger) 1, list.size, nil);
    STAssertEqualObjects(one, list.head.data, nil);
    
    [list addFirst:two];
    STAssertNotNil(list.head, nil);
    STAssertNotNil(list.tail, nil);
    STAssertTrue(list.head != list.tail, nil);
    STAssertEquals((NSUInteger) 2, list.size, nil);
    STAssertEquals(two, list.head.data, nil);
    STAssertEquals(one, list.tail.data, nil);
}

- (void)testRemove
{
    CWLinkedList *list = [CWLinkedList list];
    NSString *one = @"1";
    NSString *two = @"2";
    [list add:one];
    STAssertEquals(one, [list remove], nil);
    STAssertNil(list.head, nil);
    STAssertNil(list.tail, nil);
    STAssertTrue([list isEmpty], nil);
    
    STAssertTrue(nil == [list remove], nil);
    
    [list add:one];
    [list add:two];
    STAssertEquals(one, [list remove], nil);
    STAssertEquals(two, list.head.data, nil);
    STAssertEquals(two, list.tail.data, nil);
    STAssertEquals((NSUInteger) 1, list.size, nil);
}

- (void)testRemoveLast
{
    CWLinkedList *list = [CWLinkedList list];
    NSString *one = @"1";
    NSString *two = @"2";
    [list add:one];
    STAssertTrue([list removeLast] == one, nil);
    STAssertNil(list.head, nil);
    STAssertNil(list.tail, nil);
    STAssertTrue([list isEmpty], nil);
    
    STAssertTrue([list removeLast] == nil, nil);
    
    [list add:one];
    [list add:two];
    STAssertEquals(two, [list removeLast], nil);
    STAssertEquals(one, list.head.data, nil);
    STAssertEquals(one, list.tail.data, nil);
    STAssertEquals((NSUInteger) 1, list.size, nil);
}

@end

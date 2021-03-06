//
//  ResourceServiceType.swift
//  TABResourceLoader
//
//  Created by Luciano Marisi on 10/09/2016.
//
//  The MIT License (MIT)
//
//  Copyright (c) 2016 Luciano Marisi
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included
//  in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

import Foundation

/// Defines a type that can be cancelled
public protocol Cancellable: class {
  /// Cancels this task
  func cancel()
}

/// Defines a type that can fetch resources
public protocol ResourceServiceType {
  /// Defines the type of resource that this service fetches
  associatedtype Resource: ResourceType

  /// Defines the type of result that this service returns
  associatedtype ResultType

  /// Designated initialzer for constructing a ResourceServiceType
  init()

  /// Fetch a resource
  ///
  /// - Parameters:
  ///   - resource: The resource to fetch
  ///   - completion: A completion handler called with a Result type of the fetching computation
  /// - Returns: A cancellable type if it's possible to cancel the task created
  @discardableResult
  func fetch(resource: Resource, completion: @escaping (ResultType) -> Void) -> Cancellable?
}

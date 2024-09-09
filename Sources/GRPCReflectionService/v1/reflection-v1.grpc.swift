//
// DO NOT EDIT.
// swift-format-ignore-file
//
// Generated by the protocol buffer compiler.
// Source: reflection-v1.proto
//
import GRPC
import NIO
import NIOConcurrencyHelpers
import SwiftProtobuf


/// To build a server, implement a class that conforms to this protocol.
internal protocol Grpc_Reflection_V1_ServerReflectionProvider: CallHandlerProvider {
  var interceptors: Grpc_Reflection_V1_ServerReflectionServerInterceptorFactoryProtocol? { get }

  /// The reflection service is structured as a bidirectional stream, ensuring
  /// all related requests go to a single server.
  func serverReflectionInfo(context: StreamingResponseCallContext<Grpc_Reflection_V1_ServerReflectionResponse>) -> EventLoopFuture<(StreamEvent<Grpc_Reflection_V1_ServerReflectionRequest>) -> Void>
}

extension Grpc_Reflection_V1_ServerReflectionProvider {
  internal var serviceName: Substring {
    return Grpc_Reflection_V1_ServerReflectionServerMetadata.serviceDescriptor.fullName[...]
  }

  /// Determines, calls and returns the appropriate request handler, depending on the request's method.
  /// Returns nil for methods not handled by this service.
  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "ServerReflectionInfo":
      return BidirectionalStreamingServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Grpc_Reflection_V1_ServerReflectionRequest>(),
        responseSerializer: ProtobufSerializer<Grpc_Reflection_V1_ServerReflectionResponse>(),
        interceptors: self.interceptors?.makeServerReflectionInfoInterceptors() ?? [],
        observerFactory: self.serverReflectionInfo(context:)
      )

    default:
      return nil
    }
  }
}

/// To implement a server, implement an object which conforms to this protocol.
@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
internal protocol Grpc_Reflection_V1_ServerReflectionAsyncProvider: CallHandlerProvider, Sendable {
  static var serviceDescriptor: GRPCServiceDescriptor { get }
  var interceptors: Grpc_Reflection_V1_ServerReflectionServerInterceptorFactoryProtocol? { get }

  /// The reflection service is structured as a bidirectional stream, ensuring
  /// all related requests go to a single server.
  func serverReflectionInfo(
    requestStream: GRPCAsyncRequestStream<Grpc_Reflection_V1_ServerReflectionRequest>,
    responseStream: GRPCAsyncResponseStreamWriter<Grpc_Reflection_V1_ServerReflectionResponse>,
    context: GRPCAsyncServerCallContext
  ) async throws
}

@available(macOS 10.15, iOS 13, tvOS 13, watchOS 6, *)
extension Grpc_Reflection_V1_ServerReflectionAsyncProvider {
  internal static var serviceDescriptor: GRPCServiceDescriptor {
    return Grpc_Reflection_V1_ServerReflectionServerMetadata.serviceDescriptor
  }

  internal var serviceName: Substring {
    return Grpc_Reflection_V1_ServerReflectionServerMetadata.serviceDescriptor.fullName[...]
  }

  internal var interceptors: Grpc_Reflection_V1_ServerReflectionServerInterceptorFactoryProtocol? {
    return nil
  }

  internal func handle(
    method name: Substring,
    context: CallHandlerContext
  ) -> GRPCServerHandlerProtocol? {
    switch name {
    case "ServerReflectionInfo":
      return GRPCAsyncServerHandler(
        context: context,
        requestDeserializer: ProtobufDeserializer<Grpc_Reflection_V1_ServerReflectionRequest>(),
        responseSerializer: ProtobufSerializer<Grpc_Reflection_V1_ServerReflectionResponse>(),
        interceptors: self.interceptors?.makeServerReflectionInfoInterceptors() ?? [],
        wrapping: { try await self.serverReflectionInfo(requestStream: $0, responseStream: $1, context: $2) }
      )

    default:
      return nil
    }
  }
}

internal protocol Grpc_Reflection_V1_ServerReflectionServerInterceptorFactoryProtocol: Sendable {

  /// - Returns: Interceptors to use when handling 'serverReflectionInfo'.
  ///   Defaults to calling `self.makeInterceptors()`.
  func makeServerReflectionInfoInterceptors() -> [ServerInterceptor<Grpc_Reflection_V1_ServerReflectionRequest, Grpc_Reflection_V1_ServerReflectionResponse>]
}

internal enum Grpc_Reflection_V1_ServerReflectionServerMetadata {
  internal static let serviceDescriptor = GRPCServiceDescriptor(
    name: "ServerReflection",
    fullName: "grpc.reflection.v1.ServerReflection",
    methods: [
      Grpc_Reflection_V1_ServerReflectionServerMetadata.Methods.serverReflectionInfo,
    ]
  )

  internal enum Methods {
    internal static let serverReflectionInfo = GRPCMethodDescriptor(
      name: "ServerReflectionInfo",
      path: "/grpc.reflection.v1.ServerReflection/ServerReflectionInfo",
      type: GRPCCallType.bidirectionalStreaming
    )
  }
}

package com.atschx.summer.websocket;

import javax.websocket.OnMessage;
import javax.websocket.server.ServerEndpoint;

/**
 * 可以再简单些吗？
 */
@ServerEndpoint("/echo")
public class EchoServer {
	@OnMessage
	public String handleMessage(String message) {
		return "Got your message (" + message + "). Thanks !";
	}
}

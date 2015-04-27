package com.atschx.summer.websocket;

import javax.servlet.annotation.WebServlet;
import javax.websocket.OnMessage;
import javax.websocket.server.ServerEndpoint;


@WebServlet
@ServerEndpoint("/echo")
public class EchoServer {
	@OnMessage
	public String handleMessage(String message) {
		return "Got your message (" + message + "). Thanks !";
	}
}

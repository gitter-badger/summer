package com.atschx.summer.websocket;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.annotation.WebServlet;
import javax.websocket.OnMessage;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;
import javax.xml.bind.annotation.adapters.CollapsedStringAdapter;


@WebServlet
@ServerEndpoint("/echo")
public class EchoServer {
	
	Set<Session> persons =  Collections.synchronizedSet(new HashSet<Session>());
	
	@OnMessage
	public String handleMessage(String message) {
		return "Got your message (" + message + "). Thanks !";
	}
}

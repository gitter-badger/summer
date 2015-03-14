package com.atschx.summer.websocket;

import javax.websocket.OnMessage;
import javax.websocket.server.ServerEndpoint;

import org.apache.catalina.Session;


/**
 * 测试websocket.
 * 
 * @author albert
 *
 */
@ServerEndpoint(value="/echo",subprotocols={"",""})
public class EchoWebSocket {
	
	/**
	 * 处理websocket.
	 */
	@OnMessage
	public void process(String message, Session session) {
		
		

	}

}

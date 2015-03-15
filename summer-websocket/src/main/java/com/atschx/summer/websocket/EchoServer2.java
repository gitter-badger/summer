package com.atschx.summer.websocket;

import java.io.IOException;

import javax.websocket.Endpoint;
import javax.websocket.EndpointConfig;
import javax.websocket.MessageHandler;
import javax.websocket.RemoteEndpoint;
import javax.websocket.Session;

public class EchoServer2 extends Endpoint {

	@Override
	public void onOpen(Session session, EndpointConfig config) {
		final RemoteEndpoint.Basic remote = session.getBasicRemote();
		session.addMessageHandler(new MessageHandler.Whole<String>() {

			@Override
			public void onMessage(String message) {
				try {
					remote.sendText("Got your message (" + message
							+ "). Thanks !");
				} catch (IOException ioe) {
					ioe.printStackTrace();
				}
			}
		});
	}

}

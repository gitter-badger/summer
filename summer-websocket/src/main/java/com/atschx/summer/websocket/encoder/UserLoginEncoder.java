package com.atschx.summer.websocket.encoder;

import java.io.IOException;
import java.io.Writer;

import javax.json.Json;
import javax.json.JsonObject;
import javax.websocket.EncodeException;
import javax.websocket.Encoder;
import javax.websocket.EndpointConfig;

import com.atschx.summer.websocket.model.UserLogin;

/**
 * websocket 连接建立.
 * @author albert
 *
 */
public class UserLoginEncoder implements Encoder.TextStream<UserLogin> {
	
	@Override
	public void init(EndpointConfig config) {
		// TODO Auto-generated method stub
	}

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void encode(UserLogin object, Writer writer) throws EncodeException,
			IOException {
		
		JsonObject jsonObject = Json.createObjectBuilder().build();
		
		jsonObject.clear();
		
	}
}

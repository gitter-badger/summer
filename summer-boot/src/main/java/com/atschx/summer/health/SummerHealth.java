package com.atschx.summer.health;

import org.springframework.boot.actuate.health.Health;
import org.springframework.boot.actuate.health.HealthIndicator;
import org.springframework.stereotype.Component;

@Component
public class SummerHealth implements HealthIndicator {

	@Override
	public Health health() {
		return null;
	}

}

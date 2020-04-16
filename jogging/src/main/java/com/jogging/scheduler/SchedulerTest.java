package com.jogging.scheduler;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class SchedulerTest {
	

	// cron 표기법
	// @Scheduled(cron = "0 09 10 * * *")
	public void cronTest() {
		log.info("Welcome Scheduling:)");
	}
}

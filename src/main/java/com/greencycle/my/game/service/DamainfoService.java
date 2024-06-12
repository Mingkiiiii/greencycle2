package com.greencycle.my.game.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.greencycle.my.game.dao.DamainfoDAO;
import com.greencycle.my.game.vo.DamainfoVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@Service


public class DamainfoService {
	
	private static final Logger logger = LoggerFactory.getLogger(DamainfoService.class);
	
	@Autowired
	DamainfoDAO dao;

	public DamainfoVO getDamainfo(String userId) {
		return dao.getDamainfo(userId);
	}

	public void damainfoWrite(DamainfoVO dama) throws Exception {
		int result = dao.damainfoWrite(dama);
		if (result == 0) {
			throw new Exception();
		}
	}

	public DamainfoVO damainfoStatus(int damainfoNo) throws Exception {
		DamainfoVO result = dao.damainfoStatus(damainfoNo);
		if (result == null) {
			throw new Exception();
		}
		return result;
	}

	public boolean updateDamainfo(DamainfoVO damainfo) {
		int result = dao.updateDamainfo(damainfo);
		return result > 0;
	}

	public boolean decrementUserPoints(String userId, int points) {
		int result = dao.decrementUserPoints(userId, points);
		return result > 0;
	}

	public boolean incrementDamainfo(String userId, int hp, int happiness, int clean, int food, int ill) {
		int result = dao.incrementDamainfo(userId, hp, happiness, clean, food, ill);
		return result > 0;
	}

	public void increaseUserPoints(String userId, int points) throws Exception {
		int result = dao.increaseUserPoints(userId, points);
		if (result == 0) {
			throw new Exception("Failed to increase user points");
		}
	}
    
    @Transactional
    public void deleteTamagotchiByUserId(String userId) {
        logger.info("Deleting Tamagotchi for user: " + userId);
        dao.deleteTamagotchiByUserId(userId);
        logger.info("Deleted Tamagotchi for user: " + userId);
    }
}

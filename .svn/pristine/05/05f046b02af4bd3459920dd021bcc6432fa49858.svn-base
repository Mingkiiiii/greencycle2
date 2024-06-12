package com.greencycle.my.game.dao;

import com.greencycle.my.game.vo.DamainfoVO;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface DamainfoDAO {
    int damainfoWrite(DamainfoVO dama);
    DamainfoVO getDamainfo(String userId);
    DamainfoVO damainfoStatus(int vo);

    @Update("UPDATE damainfo SET damainfo_hp = #{damainfoHp}, damainfo_happniess = #{damainfoHappniess}, damainfo_clean = #{damainfoClean}, damainfo_food = #{damainfoFood}, damainfo_ill = #{damainfoIll} WHERE user_id = #{userId}")
    int updateDamainfo(DamainfoVO damainfo);

    @Update("UPDATE users SET user_point = user_point + #{points} WHERE user_id = #{userId}")
    int increaseUserPoints(@Param("userId") String userId, @Param("points") int points);

    @Update("UPDATE users SET user_point = user_point - #{points} WHERE user_id = #{userId}")
    int decrementUserPoints(@Param("userId") String userId, @Param("points") int points);

    @Update("UPDATE damainfo SET damainfo_hp = damainfo_hp + #{damainfoHp}, damainfo_happniess = damainfo_happniess + #{damainfoHappniess}, damainfo_clean = damainfo_clean + #{damainfoClean}, damainfo_food = damainfo_food + #{damainfoFood}, damainfo_ill = damainfo_ill + #{damainfoIll} WHERE user_id = #{userId}")
    int incrementDamainfo(@Param("userId") String userId, @Param("damainfoHp") int damainfoHp, @Param("damainfoHappniess") int damainfoHappniess, @Param("damainfoClean") int damainfoClean, @Param("damainfoFood") int damainfoFood, @Param("damainfoIll") int damainfoIll);
    
    @Update("UPDATE damainfo SET damainfo_hp = damainfo_hp - #{damainfoHp}, damainfo_happniess = damainfo_happniess - #{damainfoHappniess}, damainfo_clean = damainfo_clean - #{damainfoClean}, damainfo_food = damainfo_food - #{damainfoFood}, damainfo_ill = damainfo_ill - #{damainfoIll} WHERE user_id = #{userId}")
    int decrementDamainfo(@Param("userId") String userId, @Param("damainfoHp") int damainfoHp, @Param("damainfoHappniess") int damainfoHappniess, @Param("damainfoClean") int damainfoClean, @Param("damainfoFood") int damainfoFood, @Param("damainfoIll") int damainfoIll);
    
    @Delete("DELETE FROM damainfo WHERE user_id = #{userId}")
    void deleteTamagotchiByUserId(@Param("userId") String userId);
}

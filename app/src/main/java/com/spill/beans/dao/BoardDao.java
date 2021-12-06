package com.spill.beans.dao;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.spill.beans.dto.BoardDTO;

// 역할
// - 회원 데이터를 처리하는 객체 사용법을 정의한다.
public interface BoardDao {
  void insert(BoardDTO boardDTO) throws Exception;
  List<BoardDTO> findAll() throws Exception;
  BoardDTO findByNo(int no) throws Exception;
  BoardDTO findByName(String name) throws Exception;
  BoardDTO findByEmailAndPassword(@Param("email") String email, @Param("password") String password) throws Exception;
  void update(BoardDTO boardDTO) throws Exception;
  void delete(int no) throws Exception;
}
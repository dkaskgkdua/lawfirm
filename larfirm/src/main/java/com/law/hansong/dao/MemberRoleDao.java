package com.law.hansong.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.law.hansong.dto.MemberRole;

@Repository
public class MemberRoleDao {
   
   @Autowired
   private SqlSessionTemplate sqlSession;
   
   public List<MemberRole> getRolesByEmail(String email) {
      
      return sqlSession.selectList("Member.SELECT_ROLE_ALL_BY_EMAIL", email);
   }
   
   public int addMemberRole(Long member_id) {
	  return sqlSession.insert("Member.INSERT_MEMBER_ROLE", member_id);
   }
   /*
   //private NamedParameterJdbcTemplate jdbc;
   // BeanPropertyRowMapper는 Role클래스의 프로퍼티를 보고 자동으로 칼럼과 맵핑해주는 RowMapper객체를 생성한다.
   // roleId 프로퍼티는 role_id 칼럼과 맵핑이 된다.
   // 만약 프로퍼티와 칼럼의 규칙이 맞아 떨어지지 않는다면 직접 RowMapper객체를 생성해야 한다.
   // 생성하는 방법은 아래의 rowMapper2를 참고한다.
   private RowMapper<MemberRole> rowMapper = BeanPropertyRowMapper.newInstance(MemberRole.class);

   public MemberRoleDao(DataSource dataSource){
      this.jdbc = new NamedParameterJdbcTemplate(dataSource);
   }

   public List<MemberRole> getRolesByEmail(String email){
      Map<String, Object> map = new HashMap<>();
      map.put("email", email);

      return jdbc.query(MemberRoleDaoSqls.SELECT_ALL_BY_EMAIL, map, rowMapper);
   }*/
}
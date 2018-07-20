package com.ideaall.infinite.service;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.ideaall.infinite.dao.ShareDao;

public class CustomizeUserDetailService implements UserDetailsService {
	@Autowired
	private ShareDao dao;

	@Override
	public UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException {

		Map<String, Object> dataMap = new HashMap<String, Object>();
		String sqlMapId = "member.read";
		dataMap.put("MEMBER_ID", username);
		Map<String, String> resultMember = (Map<String, String>) dao.getObject(sqlMapId, dataMap);

		if (resultMember == null) {
			throw new UsernameNotFoundException("Not found username: " + username);
		}
		sqlMapId = "authorityRmember.list";
		dataMap.put("MEMBER_SEQ", resultMember.get("MEMBER_SEQ"));
		List<Object> resultAuthorities = (List<Object>) dao.getList(sqlMapId, resultMember);
		return new User(username, (String) resultMember.get("PASSWORD"), buildUserAuthority(resultAuthorities));

	}

	private Set<GrantedAuthority> buildUserAuthority(List<Object> resultAuthorities) {
		Set<GrantedAuthority> resultObject = new HashSet<GrantedAuthority>();
		Iterator iterator = resultAuthorities.iterator();
		while (iterator.hasNext()) {
			Map<String, String> element = (Map<String, String>) iterator.next();
			resultObject.add(new SimpleGrantedAuthority(element.get("AUTHORITY_ID")));
		}
		return resultObject;
	}
}

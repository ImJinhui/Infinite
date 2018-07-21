package com.ideaall.infinite.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomUserDetail implements UserDetails {
    
    private String user_id;
    private String user_pw;
    private String auth;
    private String name;
    
    public String getUser_id() {
          return user_id;
    }
    public void setUser_id(String user_id) {
          this.user_id = user_id;
    }
    public String getUser_pw() {
          return user_pw;
    }
    public void setUser_pw(String user_pw) {
          this.user_pw = user_pw;
    }
    public String getAuth() {
          return auth;
    }
    public void setAuth(String auth) {
          this.auth = auth;
    }
    public String getName() {
          return name;
    }
    public void setName(String name) {
          this.name = name;
    }
   
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
          // TODO Auto-generated method stub
          
          List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();   
          authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
          return authorities;
    }
    
    @Override
    public String getPassword() {
          // TODO Auto-generated method stub
          return null;
    }
    @Override
    public String getUsername() {
          // TODO Auto-generated method stub
          return null;
    }
    @Override
    public boolean isAccountNonExpired() {
          // TODO Auto-generated method stub
          return true;
    }
    @Override
    public boolean isAccountNonLocked() {
          // TODO Auto-generated method stub
          return true;
    }
    @Override
    public boolean isCredentialsNonExpired() {
          // TODO Auto-generated method stub
          return true;
    }
    @Override
    public boolean isEnabled() {
          // TODO Auto-generated method stub
          return true;
    }
}


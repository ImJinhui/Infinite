package com.ideaall.infinite.component;

import java.util.HashMap;
import java.util.Map;

public class MapParamCollector {

	Map<Object, Object> map= new HashMap<Object, Object>();
	
	public Map<Object, Object> getMap(){
		return this.map;
	}
	
	public void put(Object key, Object value) {
		map.put(key, value);	
	}

	public void setMap(Map<Object, Object> map) {
		this.map = map;
	}
	public String get(Object key){
		return (String) map.get(key);
		}



}


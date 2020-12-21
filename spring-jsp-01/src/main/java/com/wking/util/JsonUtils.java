/**
 * 
 */
package com.wking.util;

import java.util.List;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

/**
 * 
 * @author hb
 *
 *         2019-07-23 14:53:22
 */
public class JsonUtils {
	private static ObjectMapper mapper = new ObjectMapper().registerModule(new JavaTimeModule());

	/**
	 * ��һ��Java����ת�ɷ���json��ʽ���ַ���
	 * 
	 * @param obj
	 * @return
	 */
	public static String objectToJson(Object obj) {
		String result = null;
		try {
			result = mapper.writeValueAsString(obj);
		} catch (JsonProcessingException e) {
			throw new RuntimeException(e);
		}
		return result;
	}

	/**
	 * ������������json�ַ���ת��java����
	 * 
	 * @param json
	 * @param valueType
	 * @return
	 */
	public static <T> T jsonToObject(String json, Class<T> valueType) {
		T t = null;
		try {
			t = mapper.readValue(json, valueType);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
		return t;
	}

	/**
	 * ������json��ʽ���ַ���ת��List����
	 * 
	 * @param <T>
	 * @param json
	 * @param valueType
	 * @return
	 */
	public static <T> List<T> jsonToList(String json, Class<T> valueType) {
		List<T> lists = null;

		JavaType javaType = mapper.getTypeFactory().constructParametricType(List.class, valueType);
		try {
			lists = mapper.readValue(json, javaType);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

		return lists;
	}

}

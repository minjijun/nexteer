package kr.co.nexteer.domain;

import org.apache.poi.ss.formula.functions.T;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ResponseVO<T> {
	private Integer code;
	private String msg;
	private T data;
	
	public ResponseVO(Integer code, String msg, T data) {
		this.code = code;
		this.msg = msg;
		this.data = data;
	}
}
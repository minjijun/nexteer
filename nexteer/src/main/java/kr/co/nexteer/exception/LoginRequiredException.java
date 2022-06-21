package kr.co.nexteer.exception;

public class LoginRequiredException extends RuntimeException {
	public LoginRequiredException(String msg) {
		super(msg);
	}
}

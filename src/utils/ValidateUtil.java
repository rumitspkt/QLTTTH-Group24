package utils;

import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.log.Log;

import commons.ErrorCodes;

public class ValidateUtil {
	// lower case letter and number
	private boolean a_zN0_9(String candidate) {
		if(candidate.matches("[a-z0-9]*")) {
			return true;
		}
		return false;
	}
	
	private boolean isEmail(String candidate) {
		candidate = candidate.trim();

	    if(candidate == null || candidate.equals(""))
	        return false;

	    if(!candidate.matches("^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,6}$"))
	        return false;

	    return true;
	}
	
	private String candidate;
	private float candidateFloat;
	private String candidateName;
	private List<String> validationErrors;
	
	private String generateError(String errorCode) {
		return candidateName + "_" + errorCode;
	}
	
	public List<String> getResults(){
		if(validationErrors.size() > 0) {
			return validationErrors;
		}else {
			return null;
		}
	}
	
	public ValidateUtil() {
		validationErrors = new ArrayList<>();
	}
	
	public ValidateUtil candidate(String object, String objectName) {
		this.candidate = object;
		this.candidateName = objectName;
		return this;
	}
	
	public ValidateUtil validateEmail() {
		if(!isEmail(candidate)) {
			validationErrors.add(generateError(ErrorCodes.INVALID));
		}
		return this;
	}
	
	public ValidateUtil validateLowercaseLetterAndNumberOnly() {
		if(!a_zN0_9(candidate)) {
			validationErrors.add(generateError(ErrorCodes.CONTAINS_ONLY_LOWERCASE_LETTERS_AND_NUMBERS));
		}
		return this;
	}
	
	public ValidateUtil validateLength(int length) {
		if(candidate.length() < length) {
			validationErrors.add(generateError(ErrorCodes.IS_LESS_THAN + length));
		}
		return this;
	}
	
	// validate float number
	
	public ValidateUtil candidateFloat(float object, String objectName) {
		this.candidateFloat = object;
		this.candidateName = objectName;
		return this;
	}
	
	public ValidateUtil validateLessOrEqualThan(float number) {
		if(candidateFloat > number) {
			validationErrors.add(generateError(ErrorCodes.IS_GREATER_THAN + number));
		}
		return this;
	}
	
	public ValidateUtil validateGreaterOrEqualThan(float number) {
		if(candidateFloat < number) {
			validationErrors.add(generateError(ErrorCodes.IS_LESS_THAN + number));
		}
		return this;
	}
}

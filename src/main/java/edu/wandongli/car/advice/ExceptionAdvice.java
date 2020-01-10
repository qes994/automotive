package edu.wandongli.car.advice;

import com.fasterxml.jackson.databind.exc.InvalidFormatException;
import edu.wandongli.car.dto.BasicDto;
import edu.wandongli.car.exception.ServiceException;
import lombok.extern.slf4j.Slf4j;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import java.util.*;

@Slf4j
@RestControllerAdvice
public class ExceptionAdvice {
    @ExceptionHandler({MethodArgumentNotValidException.class})
    public BasicDto methodDtoNotValidException(Exception ex, HttpServletRequest request){
        MethodArgumentNotValidException c= (MethodArgumentNotValidException) ex;
        List<ObjectError> errors = c.getBindingResult().getAllErrors();
        log.error(errors.get(0).getDefaultMessage());
        return new BasicDto(0,errors.get(0).getDefaultMessage());
    }
    @ExceptionHandler({ConstraintViolationException.class})
    public BasicDto ConstraintViolationException(Exception ex,HttpServletRequest request){
        ConstraintViolationException cve= (ConstraintViolationException) ex;
        Set<ConstraintViolation<?>> set = cve.getConstraintViolations();
        ConstraintViolation<?> next = set.iterator().next();
        String msg = next.getMessage();
        return new BasicDto(0,msg);
    }
    @ExceptionHandler({ServiceException.class})
    public BasicDto handleException(Exception ex,HttpServletRequest request){

        return new BasicDto(0,ex.getMessage());
    }
    @ExceptionHandler({InvalidFormatException.class})
    public BasicDto InvalidFormatException(InvalidFormatException ex,HttpServletRequest request){
        return new BasicDto(0,ex.getMessage());
    }
}


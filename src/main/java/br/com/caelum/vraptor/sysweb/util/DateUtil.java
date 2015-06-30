package br.com.caelum.vraptor.sysweb.util;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @author Fidelis
 *
 */
public class DateUtil {
	
	public static String PADRAO_DD_MM_YYYY_HH_MM_SS = "dd-MM-yyyy-hh-mm-ss-SS-a"; 
	
	public DateUtil() {
		
	}
	
	/**
	 * @return
	 */
	public Date newDate(){
		return new Date();
	}
	
	/**
	 * Retorna Data Atual em formato String
	 * @param dataCadastro 
	 * @return
	 */
	public String getDateString(Date data, String padrao){
		SimpleDateFormat sdf = new SimpleDateFormat(padrao);
		return sdf.format(data);
	}
	
}

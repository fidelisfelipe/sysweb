package br.com.caelum.vraptor.sysweb.util;

/**
 * @author Fidelis
 *
 */
public class ControllerUtil {

	/**
	 * Recebe a classe controller e retorna seu contexto padrão lowerCase
	 * @param classeController
	 * @return
	 */
	public static String getContexto(Class<? extends Object> classeController) {
		return classeController.getSimpleName().substring(0,classeController.getSimpleName().length()-10).toLowerCase();
	}

}

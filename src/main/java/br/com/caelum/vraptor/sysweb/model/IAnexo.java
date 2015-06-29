package br.com.caelum.vraptor.sysweb.model;

import java.util.Date;

public interface IAnexo {

	String getNomeArquivo();
	String getNomeArquivoOriginal();
	String getCaminho();
	Long getTamanho();
	Date getDataCadastro();
	String getPasta();
	
}

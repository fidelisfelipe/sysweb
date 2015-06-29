package br.com.caelum.vraptor.sysweb.model;

import java.util.Date;

public class Anexo implements IAnexo{
	private Integer id;
	private String nomeArquivo;
	private String nomeArquivoOriginal;
	private String caminho;
	private Long tamanho;
	private Date dataCadastro;
	private String dataCadastroString;
	private String pasta;

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNomeArquivo() {
		return nomeArquivo;
	}
	public void setNomeArquivo(String nomeArquivo) {
		this.nomeArquivo = nomeArquivo;
	}
	public String getNomeArquivoOriginal() {
		return nomeArquivoOriginal;
	}
	public void setNomeArquivoOriginal(String nomeArquivoOriginal) {
		this.nomeArquivoOriginal = nomeArquivoOriginal;
	}
	public String getCaminho() {
		return caminho;
	}
	public void setCaminho(String caminho) {
		this.caminho = caminho;
	}
	public Long getTamanho() {
		return tamanho;
	}
	public void setTamanho(Long tamanho) {
		this.tamanho = tamanho;
	}
	public Date getDataCadastro() {
		return dataCadastro;
	}
	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}
	public void setDataCadastroString(String dataCadastro) {
		this.dataCadastroString = dataCadastro;
	}
	public String getDataCadastroString() {
		return dataCadastroString;
	}
	public String getPasta() {
		return pasta;
	}
	public void setPasta(String pasta) {
		this.pasta = pasta;
		
	}
	
}

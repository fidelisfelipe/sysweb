package br.com.caelum.vraptor.sysweb.model;

public enum TipoAnexoEnum {
	DOCUMENTO(0,"Documento"),
	IMAGEM(1,"Imagem"),
	AUDIO(2,"Audio"),
	VIDEO(3,"Video");
	
	private Integer id;
	private String nome;
	
	private TipoAnexoEnum(Integer id, String nome) {
		this.id = id;
		this.nome = nome;
	}
	private TipoAnexoEnum() {
	}
	
	public Integer getId() {
		return id;
	}
	public String getNome() {
		return nome;
	}
}

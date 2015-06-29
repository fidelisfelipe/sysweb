package br.com.caelum.vraptor.sysweb.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;

@Entity
@Table(name="tb_anexo_arquivo")
public class AnexoArquivo implements IAnexo{

	private Integer id;
	private String nomeArquivo;
	private String nomeArquivoOriginal;
	private String caminho;
	private Long tamanho;
	private Date dataCadastro;
	private String pasta;
	private Arquivo arquivo;
	private Boolean removida;
	private TipoAnexoEnum tipo;
	private boolean fotoPrincipal;
	private String descricao;

	@Id
	@SequenceGenerator(name = "seq_anexo_arquivo", sequenceName = "seq_anexo_arquivo", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seq_anexo_arquivo")
	@Column(name = "id_anexo", nullable = false)
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "nm_anexo")
	public String getNomeArquivo() {
		return nomeArquivo;
	}

	public void setNomeArquivo(String nomeArquivo) {
		this.nomeArquivo = nomeArquivo;
	}

	@Column(name = "nm_anexo_orig")
	public String getNomeArquivoOriginal() {
		return nomeArquivoOriginal;
	}

	public void setNomeArquivoOriginal(String nomeArquivoOriginal) {
		this.nomeArquivoOriginal = nomeArquivoOriginal;
	}
	@Column(name = "ds_caminho_anexo")
	public String getCaminho() {
		return caminho;
	}

	public void setCaminho(String caminho) {
		this.caminho = caminho;
	}

	@Column(name = "ds_tamanho")
	public Long getTamanho() {
		return tamanho;
	}

	public void setTamanho(Long tamanho) {
		this.tamanho = tamanho;
	}
	
	@Column(name = "ds_anexo")
	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	@Column(name = "dt_cadastro")
	@Temporal(TemporalType.TIMESTAMP)
	public Date getDataCadastro() {
		return dataCadastro;
	}

	// Set por convenção da linguagem.
	public void setDataCadastro(Date dataCadastro) {
		this.dataCadastro = dataCadastro;
	}
	@Column(name = "ds_pasta")
	public String getPasta() {
		return pasta;
	}
	public void setPasta(String pasta) {
		this.pasta = pasta;
	}

	@ManyToOne
	@JoinColumn(name="id_arquivo", referencedColumnName="id_arquivo")
	public Arquivo getArquivo() {
		return arquivo;
	}

	public void setArquivo(Arquivo arquivo) {
		this.arquivo = arquivo;
	}
	@Column(name = "sn_removida")
	public Boolean getRemovida() {
		return removida;
	}

	public void setRemovida(Boolean removida) {
		this.removida = removida;
	}

	@Enumerated(EnumType.STRING)
	public TipoAnexoEnum getTipo() {
		return tipo;
	}
	
	@Column(name = "sn_foto_principal", columnDefinition = "default FALSE")
	public boolean isFotoPrincipal() {
		return fotoPrincipal;
	}

	public void setFotoPrincipal(boolean fotoPrincipal) {
		this.fotoPrincipal = fotoPrincipal;
	}

	public void setTipo(TipoAnexoEnum tipo) {
		this.tipo = tipo;
	}
	@Transient
	public String getExtensao(){
		if(this.nomeArquivo.lastIndexOf(".") != -1)
		return this.nomeArquivo.substring(this.nomeArquivo.lastIndexOf(".")+1,this.nomeArquivo.length()).toUpperCase();
		
		return ""; 
	}

}
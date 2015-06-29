package br.com.caelum.vraptor.sysweb.model;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "tb_arquivo")
public class Arquivo {

	private Long id;
	private String nome;
	private String descricao;
	private String caminho;

	private boolean remover;
	private List<AnexoArquivo> anexos;
	
	private Arquivo pai;
	private List<Arquivo> filhos;
	private List<Arquivo> paisSuperiores;
	
	@Id
	@SequenceGenerator(name = "seq_arquivo", sequenceName = "seq_arquivo", allocationSize = 1)
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator = "seq_arquivo")
	@Column(name = "id_arquivo", nullable = false)
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	@Column(name = "nm_arquivo", length = 255)
	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	@Column(name = "ds_arquivo")
	public String getDescricao() {
		return descricao;
	}

	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}

	@OneToMany(mappedBy = "arquivo", cascade = CascadeType.ALL)
	public List<AnexoArquivo> getAnexos() {
		return anexos;
	}

	public void setAnexos(List<AnexoArquivo> anexos) {
		this.anexos = anexos;
	}

	public void adicionaAnexo(AnexoArquivo anexo) {
		if (anexos == null) {
			anexos = new ArrayList<AnexoArquivo>();
		}
		anexos.add(anexo);
	}

	@Column(name = "ds_caminho")
	public String getCaminho() {
		return caminho;
	}

	public void setCaminho(String caminho) {
		this.caminho = caminho;
	}

	@ManyToOne(cascade = CascadeType.PERSIST)
	@JoinColumn(name="id_pai", referencedColumnName="id_arquivo")
	public Arquivo getPai() {
		return pai;
	}

	public void setPai(Arquivo pai) {
		this.pai = pai;
	}

	@OneToMany(mappedBy = "pai", cascade = CascadeType.PERSIST)
	public List<Arquivo> getFilhos() {
		return filhos;
	}

	public void setFilhos(List<Arquivo> filhos) {
		this.filhos = filhos;
	}

	@Transient
	public List<Arquivo> getPaisSuperiores() {
		return paisSuperiores;
	}
	
	public void setPaisSuperiores(List<Arquivo> paisSuperiores) {
		this.paisSuperiores = paisSuperiores;
	}
	@Transient
	public boolean isRemover() {
		return remover;
	}

	public void setRemover(boolean isRemover) {
		this.remover = isRemover;
	}
	

}
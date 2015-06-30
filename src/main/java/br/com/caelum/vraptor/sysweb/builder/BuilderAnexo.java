package br.com.caelum.vraptor.sysweb.builder;

import java.util.Date;

import br.com.caelum.vraptor.sysweb.model.Anexo;

/**
 * @author Fidelis
 *
 */
public class BuilderAnexo {

	/**
	 * Cria um anexo
	 * @param caminho
	 * @param pasta
	 * @param data
	 * @param nomeAtual
	 * @param nomeOriginal
	 * @param tamanho
	 * @return
	 */
	public static Anexo newAnexo(String caminho, String pasta, Date data,
			String nomeAtual, String nomeOriginal, long tamanho) {
		Anexo anexo = new Anexo();
		anexo.setCaminho(caminho);
		anexo.setPasta(pasta);
		anexo.setDataCadastro(data);
		anexo.setNomeArquivo(nomeAtual);
		anexo.setNomeArquivoOriginal(nomeOriginal);
		anexo.setTamanho(tamanho);
		return anexo;
	}

}

package br.com.caelum.vraptor.sysweb.business;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.sysweb.business.exception.NegocioException;
import br.com.caelum.vraptor.sysweb.dao.impl.DefaultUploadDao;
import br.com.caelum.vraptor.sysweb.model.Anexo;
import br.com.caelum.vraptor.sysweb.model.AnexoArquivo;
import br.com.caelum.vraptor.sysweb.model.Arquivo;
import br.com.caelum.vraptor.sysweb.util.MsgNegocio;

public class UploadLogic {

	private DefaultUploadDao arquivoDao;
	
	protected UploadLogic() {
	}
	@Inject
	public UploadLogic(Result result, DefaultUploadDao arquivoDao){
		this.arquivoDao = arquivoDao;
	}
	
	public Arquivo load(long id) {
		return arquivoDao.load(id);
	}
	
	public void update(Arquivo arquivo) {
		arquivoDao.update(arquivo);
	}

	public void persist(Arquivo arquivo) {
		arquivoDao.persist(arquivo);
	}

	public void delete(Arquivo arquivo) {
		arquivoDao.delete(arquivo);
	}

	public List<Arquivo> listAll() {
		return arquivoDao.listAll();
	}
	
	public Arquivo existe(Arquivo arquivo){
		return arquivoDao.existe(arquivo);
	}
	
	public void remove(Arquivo arquivo) {
		arquivoDao.delete(arquivo);
	}
	public void refresh(Arquivo arquivo) {
		arquivoDao.refresh(arquivo);
	}
	public void verificarDadosOrigatoriosDefault(Arquivo arquivo) throws NegocioException {
		if(arquivo.getNome() == null){
			throw new NegocioException(MsgNegocio.INFORME_O_CAMPO_OBRIGATORIO);
		}
		if(arquivo.getCaminho() == null){
			throw new NegocioException(MsgNegocio.INFORME_O_CAMPO_OBRIGATORIO);
		}
	}
	
	/**
	 * @param arquivo
	 * @param anexo
	 * @return
	 */
	public Arquivo atualizaObjetoComAnexo(Arquivo arquivo, Anexo anexo) {
		Arquivo objetoComAnexo = load(arquivo.getId());

		List<AnexoArquivo> anexos = new ArrayList<AnexoArquivo>();
		AnexoArquivo anexoArquivo = new AnexoArquivo();

		anexoArquivo.setDataCadastro(anexo.getDataCadastro());
		anexoArquivo.setNomeArquivo(anexo.getNomeArquivo());
		anexoArquivo.setNomeArquivoOriginal(anexo.getNomeArquivoOriginal());
		anexoArquivo.setCaminho(anexo.getCaminho());
		anexoArquivo.setTamanho(anexo.getTamanho());
		anexoArquivo.setPasta(anexo.getPasta());
		anexoArquivo.setArquivo(objetoComAnexo);

		anexos.add(anexoArquivo);
		objetoComAnexo.setAnexos(anexos);
		
		update(objetoComAnexo);
		
		return objetoComAnexo;
	}
	
	
}

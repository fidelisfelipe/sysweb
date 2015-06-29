package br.com.caelum.vraptor.sysweb.busines;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.sysweb.busines.exception.NegocioException;
import br.com.caelum.vraptor.sysweb.dao.impl.DefaultUploadDao;
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
	
	
}

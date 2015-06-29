package br.com.caelum.vraptor.sysweb.dao.impl;

import javax.inject.Inject;

import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;

import br.com.caelum.vraptor.sysweb.dao.UsuarioDao;
import br.com.caelum.vraptor.sysweb.model.Arquivo;
import br.com.caelum.vraptor.sysweb.util.PreconditionUtil;

/**
 * @author fidelis.guimaraes
 *
 */
public class DefaultUploadDao extends DefaultGenericDao<Arquivo> implements
		UsuarioDao {
	
	public DefaultUploadDao() {
		this(null);
	}
	
	@Inject
	protected DefaultUploadDao(Session session) {
		super(session);
	}

	/**
	 * Verifica se existe o arquivo informado e ativo
	 * 
	 * @param arquivo
	 * @return
	 */
	public Arquivo existe(Arquivo arquivo) {
		PreconditionUtil.isNotNullDoThrowsIllegalArgumentException(arquivo);
		return (Arquivo) getSession().createCriteria(Arquivo.class)
				.add(Restrictions.eq("nome", arquivo.getNome()))
				.add(Restrictions.eq("caminho", arquivo.getCaminho())
				).uniqueResult();
	}
}
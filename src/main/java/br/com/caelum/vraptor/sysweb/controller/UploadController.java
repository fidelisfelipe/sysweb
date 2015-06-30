package br.com.caelum.vraptor.sysweb.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.Normalizer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.apache.commons.io.IOUtils;
import org.hibernate.HibernateException;
import org.slf4j.Logger;
import org.slf4j.impl.Log4jLoggerFactory;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.com.caelum.vraptor.sysweb.busines.UploadLogic;
import br.com.caelum.vraptor.sysweb.busines.exception.NegocioException;
import br.com.caelum.vraptor.sysweb.model.Anexo;
import br.com.caelum.vraptor.sysweb.model.AnexoArquivo;
import br.com.caelum.vraptor.sysweb.model.Arquivo;
import br.com.caelum.vraptor.sysweb.model.Usuario;
import br.com.caelum.vraptor.sysweb.util.ControllerUtil;
import br.com.caelum.vraptor.sysweb.util.MsgNegocio;
import br.com.caelum.vraptor.sysweb.util.UploadUtil;
import br.com.caelum.vraptor.view.Results;

@Controller
@Path("/upload")
public class UploadController {

	private static Logger logger = new Log4jLoggerFactory().getLogger("br.com caelum.vraptor.sysweb");
	private final Result result;
	private final UploadLogic logic;
	private final UploadUtil upload;
	/**
	 * @deprecated CDI eyes only
	 */
	protected UploadController() {
		this(null, null, null);
	}
	
	@Inject
	public UploadController(Result result, UploadLogic logic, UploadUtil upload) {
		this.result = result;
		this.logic = logic;
		this.upload = upload;
	}
	
	@Get
	@Path({"","/"})
	public void upload() {
		Usuario usuario = new Usuario();
		usuario.setId(20l);
		
		result.include("object", usuario);
		result.include("caminho", upload.getFolderUpload());
		result.include("contexto", ControllerUtil.getContexto(this.getClass()));
		result.include("tipoArquivoString","*.pdf;*.doc;*.docx;*.zip;*.rar;");
		result.include("uploadLimit",5);
		result.include("tamanho",2785702);
	}
	
	@Get
	@Path("/{id}")
	public void upload(Integer id) {
		Usuario usuario = new Usuario();
		usuario.setId(20l);
		
		result.include("object", usuario);
		result.include("caminho", upload.getFolderUpload());
		result.include("contexto", ControllerUtil.getContexto(this.getClass()));
		result.include("tipoArquivoString","*.pdf;*.doc;*.docx;*.zip;*.rar;");
		result.include("uploadLimit",5);
		result.include("tamanho",2785702);
	}

	@Post
	@Path({ "/{arquivo.id}" })
	public void upload(Arquivo arquivo, UploadedFile arquivos)
			throws NegocioException {
		result.on(HibernateException.class).forwardTo(this).upload(null);

		if (arquivos != null) {

			Anexo anexo = upload
					.salvarAnexo(arquivos, upload.getFolderUpload());

			result.use(Results.json()).from(arquivos).serialize();

			Arquivo objetoComAnexo = logic.atualizaObjetoComAnexo(arquivo,
					anexo);

			result.include("msg", MsgNegocio.ARQUIVO_ENVIADO);
			result.redirectTo(this).upload(objetoComAnexo.getId().intValue());

		}else{
			logger.error("Nenhum arquivo foi enviado!");
		}
	}

}
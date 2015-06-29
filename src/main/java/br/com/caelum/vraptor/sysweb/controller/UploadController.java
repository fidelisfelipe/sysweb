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
import br.com.caelum.vraptor.view.Results;

@Controller
@Path("/upload")
public class UploadController {

	private static Logger logger = new Log4jLoggerFactory().getLogger("br.com caelum.vraptor.sysweb");
	private final Result result;
	private ServletContext context;
	private UploadLogic logic;
	/**
	 * @deprecated CDI eyes only
	 */
	protected UploadController() {
		this(null, null, null);
	}
	
	@Inject
	public UploadController(Result result, ServletContext context, UploadLogic logic) {
		this.result = result;
		this.context = context;
		this.logic = logic;
	}
	
	@Get
	@Path({"","/"})
	public void upload() {
		Usuario usuario = new Usuario();
		usuario.setId(20l);
		
		result.include("object", usuario);
		result.include("caminho", context.getRealPath("/upload"));
		result.include("contexto", ControllerUtil.getContexto(this.getClass()));
		result.include("tipoArquivoString","*.pdf;*.doc;*.docx;*.zip;*.rar;");
		result.include("uploadLimit",5);
		result.include("tamanho",201024);
	}
	
	@Get
	@Path("/{id}")
	public void upload(Integer id) {
		Usuario usuario = new Usuario();
		usuario.setId(20l);
		
		result.include("object", usuario);
		result.include("caminho", context.getRealPath("/upload"));
		result.include("contexto", ControllerUtil.getContexto(this.getClass()));
		result.include("tipoArquivoString","*.pdf;*.doc;*.docx;*.zip;*.rar;");
		result.include("uploadLimit",5);
		result.include("tamanho",201024);
	}

	@Post 
	@Path({"/{arquivo.id}"})
	public void upload(Arquivo arquivo, UploadedFile arquivos) {
		result.on(HibernateException.class).forwardTo(this).upload(null);
		
		if(arquivos == null){
			throw new RuntimeException("Nenhum arquivo foi enviado!");
		}
		
		try
		{
			Anexo anexo = getFileSaveFolder(arquivos,"upload");
			Arquivo p = null;
			if(anexo != null){
				result.use(Results.json()).from(arquivos).serialize();
				
				p = logic.load(arquivo.getId());
				
				List<AnexoArquivo> anexos = new ArrayList<AnexoArquivo>();
				AnexoArquivo anexoArquivo = new AnexoArquivo();
				
				anexoArquivo.setDataCadastro(anexo.getDataCadastro());
				anexoArquivo.setNomeArquivo(anexo.getNomeArquivo());
				anexoArquivo.setNomeArquivoOriginal(anexo.getNomeArquivoOriginal());
				anexoArquivo.setCaminho(anexo.getCaminho());
				anexoArquivo.setTamanho(anexo.getTamanho());
				anexoArquivo.setPasta(anexo.getPasta());
				anexoArquivo.setArquivo(p);
				
				anexos.add(anexoArquivo);
				p.setAnexos(anexos);
				
				logic.update(p);
			}
			result.include("msg",MsgNegocio.ARQUIVO_ENVIADO);
			result.redirectTo(this).upload(p.getId().intValue());
		} catch (IOException e) {
			logger.error("Erro ao copiar imagem",e);
			throw new RuntimeException("Erro ao copiar imagem", e);
		} catch (Exception e) {
			logger.error("Falha ao realizar o Upload.",e);
			System.out.println("Falha ao realizar o Upload.");
		}	
		
	}
	
	/**
	 * Auxiliares ao Upload 
	 */
	
	private Anexo getFileSaveFolder(UploadedFile files, String folderName)
			throws IOException, FileNotFoundException {
		String caminho = context.getRealPath(File.separator + folderName);
		File destino = new File(caminho);

		// verifica existencia do diret�rio
		if (!destino.exists()) {
			if (!destino.mkdir())
				System.out.println("Falha ao criar diretório...");
		} else {
			System.out.println("Diretório:" + destino + "  existe!");
		}

		// ajusta data
		SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy-hh-mm-ss-SS-a");
		Date dataCadastro = new Date();
		String dataAtual = sdf.format(dataCadastro);
		String nomeSemCaracteresInvalidos = ajustaNomeDaImagem(files
				.getFileName());

		// ajusta arquivo novo
		File fileNovo = new File(caminho + File.separator + dataAtual + "-"
				+ nomeSemCaracteresInvalidos);
		
		String nomeAnexo = caminho + File.separator + dataAtual + "-"
				+ nomeSemCaracteresInvalidos;
		
		// verifica existencia do arquivo para n�o duplicidade
		if (fileNovo.isFile() && fileNovo.exists()) {
			return null;
		} else {
			FileOutputStream novoFile = new FileOutputStream(nomeAnexo);
			IOUtils.copyLarge(files.getFile(), novoFile);
			
			Anexo anexo = new Anexo();
			anexo.setCaminho(caminho);
			anexo.setPasta(folderName);
			anexo.setDataCadastroString(dataAtual);
			anexo.setDataCadastro(dataCadastro);
			anexo.setNomeArquivo(dataAtual + "-"+ nomeSemCaracteresInvalidos);
			anexo.setNomeArquivoOriginal(files.getFileName());
			anexo.setTamanho(novoFile.getChannel().size());
			
			novoFile.flush();
			novoFile.close();
			
			return anexo;
		}
	}

	private String ajustaNomeDaImagem(String string) {
//		aki o ajuste deve ser feito
//		ajustar com flyweyght em uma classe util
		return removeParaASCII(removerEspacos(removeAcentos(string)));
	}
	private String removeAcentos(String string){
		CharSequence cs = new StringBuilder(string); 
		return Normalizer.normalize(cs, Normalizer.Form.NFKD).replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
	}
	private String removerEspacos(String string){
		return string.replaceAll(" ", "");
	}
	private String removeParaASCII(String string) { 
		return Normalizer.normalize(string, java.text.Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]",""); 
	}
	
}
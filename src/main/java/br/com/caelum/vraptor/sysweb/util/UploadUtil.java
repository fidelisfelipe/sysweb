package br.com.caelum.vraptor.sysweb.util;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.Normalizer;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.inject.Inject;
import javax.servlet.ServletContext;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.impl.Log4jLoggerFactory;

import br.com.caelum.vraptor.observer.upload.UploadedFile;
import br.com.caelum.vraptor.sysweb.builder.BuilderAnexo;
import br.com.caelum.vraptor.sysweb.business.exception.NegocioException;
import br.com.caelum.vraptor.sysweb.model.Anexo;

/**
 * @author Fidelis
 *
 */
public class UploadUtil {
	
	private static final String UPLOAD_FOLDER = "upload";
	private static Logger logger = new Log4jLoggerFactory().getLogger("br.com caelum.vraptor.sysweb");
	private final ServletContext context;
	private final DateUtil dateUtil;
	
	protected UploadUtil() {
		this(null, null);
	}
	
	@Inject
	public UploadUtil(ServletContext context, DateUtil dateUtil){
		this.context = context;
		this.dateUtil = dateUtil;
	}
	/**
	 * Auxiliares ao Upload 
	 */
	
	public Anexo salvarAnexo(UploadedFile arquivoUpload, String pasta)
			throws NegocioException {
		//data atual
		Date data = dateUtil.newDate();
		
		//caminho destino
		File destino = new File(pasta);

		if (!existeDiretorio(destino))
			criarDiretorio(destino);

		String novoNome = criarNomeArquivo(arquivoUpload, data);
		File arquivoNovo = new File(criarCamihoCompleto(pasta, novoNome));
		
		if (!existeArquivo(arquivoNovo)) {
				
			gravarArquivo(arquivoUpload, arquivoNovo);
			
			return BuilderAnexo.newAnexo(destino.getAbsolutePath(), pasta,
					data, novoNome, arquivoUpload.getFileName(),
					arquivoUpload.getSize());
			
		}
		throw new NegocioException(MsgNegocio.ARQUIVO_NAO_PODE_SER_ENVIADO);
	}

	/**
	 * Cria nome do Arquivo
	 * @param arquivoUpload
	 * @param data
	 * @return
	 */
	private String criarNomeArquivo(UploadedFile arquivoUpload, Date data) {
		return dateUtil.getDateString(data, DateUtil.PADRAO_DD_MM_YYYY_HH_MM_SS) 
									+ "-" + removeCaracteres(arquivoUpload.getFileName());
	}

	/**
	 * Cria caminho completo para o arquivo
	 * @param pasta
	 * @param novoNome
	 * @return
	 */
	private String criarCamihoCompleto(String pasta, String novoNome) {
		return pasta + File.separator + novoNome;
	}

	/**
	 * Grava arquivo
	 * @param arquivoUpload
	 * @param arquivoNovo
	 * @return
	 * @throws NegocioException
	 */
	private void gravarArquivo(UploadedFile arquivoUpload, File arquivoNovo) throws NegocioException {

		try {
			FileOutputStream novoFile = new FileOutputStream(
					arquivoNovo.getAbsolutePath());
			IOUtils.copyLarge(arquivoUpload.getFile(), novoFile);

			novoFile.flush();
			novoFile.close();

		} catch (FileNotFoundException e) {
			logger.error("Falha ao salvar o arquivo!", e);
			throw new NegocioException(MsgNegocio.ARQUIVO_NAO_PODE_SER_SALVO);
		} catch (IOException e) {
			logger.error("Falha ao salvar o arquivo!", e);
			throw new NegocioException(MsgNegocio.ARQUIVO_NAO_PODE_SER_SALVO);
		}
	}

	

	/**
	 * Folder Upload
	 * @return
	 */
	public String getFolderUpload() {
		return context.getRealPath(File.separator + UPLOAD_FOLDER);
	}
	
	/**
	 * Cria nome completo do arquivo no padrão <br />
	 * <b>PASTA/dd-MM-yyyy-hh-mm-ss-SS-a-nomeDoArquivo.extensao</b>
	 * @param pasta
	 * @param dataAtual
	 * @param nomeSemCaracteresInvalidos
	 * @return
	 */
	public String criarNovoNomeArquivo(String pasta, String dataAtual,
			String nomeSemCaracteresInvalidos) {
		return pasta + File.separator + dataAtual + "-"	+ nomeSemCaracteresInvalidos;
	}
	
	/**
	 * Verifica se o arquivo já existe
	 * @param arquivo
	 * @return
	 */
	public boolean existeArquivo(File arquivo) {
		if(arquivo.isFile() && arquivo.exists()){
			logger.info("Arquivo encontrado:" + arquivo);
			return true;
		}
		logger.info("Arquivo não encontrado:" + arquivo);
		return false;
	}
	
	/**
	 * Cria Diretorio
	 * @param destino
	 * @return
	 */
	boolean criarDiretorio(File destino) {
		if(destino.mkdir()){
			logger.info("Diretório criado com sucesso:" + destino);
			return true;
		}
		logger.error("Diretório não pode ser criado:" + destino);
		return false;
	}

	/**
	 * Verifica se Diretorio Existe
	 * @param destino
	 * @return
	 */
	boolean existeDiretorio(File destino) {
		if(destino.exists()){
			logger.info("Diretório encontrado:" + destino);
			return true;
		}
		logger.info("Diretório não encontrado:" + destino );
		return false;
	}
	
	/**
	 * Remove Caracteres
	 * @param string
	 * @return
	 */
	String removeCaracteres(String string) {
		return removeParaASCII(removerEspacos(removeAcentos(string)));
	}
	
	/**
	 * Remove Acentos
	 * @param string
	 * @return
	 */
	String removeAcentos(String string){
		CharSequence cs = new StringBuilder(string); 
		return Normalizer.normalize(cs, Normalizer.Form.NFKD).replaceAll("\\p{InCombiningDiacriticalMarks}+", "");
	}
	
	/**
	 * Remove Espaços
	 * @param string
	 * @return
	 */
	String removerEspacos(String string){
		return string.replaceAll(" ", "");
	}
	
	String removeParaASCII(String string) { 
		return Normalizer.normalize(string, java.text.Normalizer.Form.NFD).replaceAll("[^\\p{ASCII}]",""); 
	}
}

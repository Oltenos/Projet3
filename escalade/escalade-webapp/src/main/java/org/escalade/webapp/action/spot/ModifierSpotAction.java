package org.escalade.webapp.action.spot;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolation;
import javax.validation.Validation;
import javax.validation.Validator;

import org.apache.commons.io.FileUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.escalade.business.contract.ManagerFactory;
import org.escalade.model.bean.spot.Departement;
import org.escalade.model.bean.spot.Spot;
import org.escalade.model.bean.spot.Ville;
import org.escalade.model.bean.texte.ZoneTexte;
import org.escalade.model.exception.FunctionalException;
import org.escalade.model.exception.NotFoundException;
import org.escalade.model.exception.TechnicalException;

import com.opensymphony.xwork2.ActionSupport;

/**
 * Classe action de modification et de création d'un spot
 * @author Oltenos
 *
 */
public class ModifierSpotAction extends ActionSupport implements ServletRequestAware {
	private static final long serialVersionUID = 1L;
	private static final Logger LOGGER = LogManager.getLogger(ModifierSpotAction.class);

	// ==================== Attributs ====================
	@Inject
	private ManagerFactory managerFactory;

	// ----- Paramètres en entrée
	private String nom;
	private Departement departement;
	private String villeNom;
	private String villeCP;
	private boolean ouvert;
	private String difficulteMin;
	private String difficulteMax;
	private String accessibleEnfants;
	private String hauteurMin;
	private String hauteurMax;
	private String nbSecteur;
	private String nbVoie;
	private String latitude;
	private String longitude;
	private String descriptionTitre;
	private String descriptionTexte;
	private String types;
	private String profils;
	private String orientations;
	
	private File myFile;
	@SuppressWarnings("unused")
	private String myFileContentType;
	private String myFileFileName;
	
	// ----- Eléments en entrée et sortie
	private int spotId;
	
	// ----- Eléments en sortie
	private Spot spot;
	private List<Departement> listDepartements;
	private List<String> listDifficultes;
	private List<String> listTypes;
	private List<String> listProfils;
	private List<String> listOrientations;

	// ==================== Getters/Setters ====================

	// ----- Paramètres en entrée (setters uniquement)
	public void setNom(String nom) {
		this.nom = nom;
	}

	public void setDepartement(Departement departement) {
		this.departement = departement;
	}

	public void setVilleNom(String villeNom) {
		this.villeNom = villeNom;
	}

	public void setVilleCP(String villeCP) {
		this.villeCP = villeCP;
	}

	public void setOuvert(boolean ouvert) {
		this.ouvert = ouvert;
	}

	public void setDifficulteMin(String difficulteMin) {
		this.difficulteMin = difficulteMin;
	}

	public void setDifficulteMax(String difficulteMax) {
		this.difficulteMax = difficulteMax;
	}

	public void setAccessibleEnfants(String accessibleEnfants) {
		this.accessibleEnfants = accessibleEnfants;
	}

	public void setHauteurMin(String hauteurMin) {
		this.hauteurMin = hauteurMin;
	}

	public void setHauteurMax(String hauteurMax) {
		this.hauteurMax = hauteurMax;
	}

	public void setNbSecteur(String nbSecteur) {
		this.nbSecteur = nbSecteur;
	}

	public void setNbVoie(String nbVoie) {
		this.nbVoie = nbVoie;
	}

	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}

	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}

	public void setDescriptionTitre(String decriptionTitre) {
		this.descriptionTitre = decriptionTitre;
	}

	public void setDescriptionTexte(String decriptionTexte) {
		this.descriptionTexte = decriptionTexte;
	}
	
	public void setTypes(String types) {
		this.types = types;
	}

	public void setProfils(String profils) {
		this.profils = profils;
	}

	public void setOrientations(String orientations) {
		this.orientations = orientations;
	}
	
	public void setMyFile(File myFile) {
		this.myFile = myFile;
	}

	public void setMyFileContentType(String myFileContentType) {
		this.myFileContentType = myFileContentType;
	}

	public void setMyFileFileName(String myFileFileName) {
		this.myFileFileName = myFileFileName;
	}

	// ----- Eléments en entrée et sortie (setters et getters)
	public void setSpotId(int spotId) {
		this.spotId = spotId;
	}
	public int getSpotId() {
		return spotId;
	}

	// ----- Eléments en sortie (getters uniquement)
	public Spot getSpot() {
		return spot;
	}
	
	public List<Departement> getListDepartements() {
		return listDepartements;
	}

	public List<String> getListDifficultes() {
		return listDifficultes;
	}
	
	public List<String> getListTypes() {
		return listTypes;
	}
	
	public List<String> getListProfils() {
		return listProfils;
	}

	public List<String> getListOrientations() {
		return listOrientations;
	}
	
	// ================= Eléments Struts =======================

	public HttpServletRequest request;

	@Override
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
	
	// ================= Méthodes d'action ====================


	/**
	 * Action de chargement de la page de modification d'un spot
	 * @return SUCCESS
	 * @throws NotFoundException 
	 */
	public String versModifier() throws NotFoundException {
		LOGGER.traceEntry();
		String result = ActionSupport.SUCCESS;
		LOGGER.trace("spotId = " + spotId);

		//Chargement du spot pour préremplir le formulaire avec les données actuelle
		spot = managerFactory.getSpotManager().getSpot(spotId);
		
		//Chargement des données nécéssaire pour le formulaire
		listDepartements = managerFactory.getSpotManager().getDepartements();
		listTypes = managerFactory.getSpotManager().getTypes();
		listProfils = managerFactory.getSpotManager().getProfils();
		listDifficultes = managerFactory.getSpotManager().getDifficultes();
		listOrientations = managerFactory.getSpotManager().getOrientations();

		LOGGER.trace("spot = " + spot);
		LOGGER.traceExit(result);
		return result;
	}

	/**
	 * Action de modification d'un spot
	 * @return SUCCESS ou INPUT en cas d'informations invalides dans le formulaire (méthode validate())
	 * @throws NotFoundException 
	 * @throws FunctionalException 
	 * @throws TechnicalException 
	 */
	public String modifier() throws NotFoundException, FunctionalException, TechnicalException {
		LOGGER.traceEntry();
		String result = ActionSupport.SUCCESS;
		LOGGER.trace("spotId = " + spotId);
		
		//récupération du spot dans la base données pour modification
		spot = managerFactory.getSpotManager().getSpot(spotId);
		
		//Changement du nom
		spot.setNom(nom);
		
		//Création de la ville si elle n'existe pas dans la base de données
		List<Ville> listVilles = managerFactory.getSpotManager().getVilles(departement.getNumero());
		for (Ville ville : listVilles) {
			if(ville.getNom().equalsIgnoreCase(villeNom)&&ville.getCP().equalsIgnoreCase(villeCP)) {
				spot.setVille(ville);
			}
		}
		if(spot.getVille()==null) {
			spot.setVille(new Ville(0,villeNom,villeCP,departement));
		}
		
		//Changement situation (ouvert/fermé) et difficultés
		spot.setOuvert(ouvert);
		spot.setDifficulteMin(difficulteMin);
		spot.setDifficulteMax(difficulteMax);
		
		//Changement adapteEnfants
		LOGGER.debug("accessibleEnfants = " + accessibleEnfants);
		if(accessibleEnfants.isEmpty()) {
			spot.setAdapteEnfants(null);
		}else {
			spot.setAdapteEnfants(Boolean.parseBoolean(accessibleEnfants));
		}
		
		//Changement hauteurMin et hauteurMax
		if(!hauteurMin.isEmpty()) {
			spot.setHauteurMin(Integer.parseInt(hauteurMin));
		}else {
			spot.setHauteurMin(0);
		}
		spot.setHauteurMax(Integer.parseInt(hauteurMax));
		
		//Changement nbSecteur
		if(!nbSecteur.isEmpty()) {
			spot.setNbSecteur(Integer.parseInt(nbSecteur));
		}else {
			spot.setNbSecteur(0);
		}
		
		//Changement nbVoie latitude et longitude
		spot.setNbVoie(nbVoie);
		spot.setLatitude(latitude);
		spot.setLongitude(longitude);
		
		//Création du Bean ZonteTexte "presentation" si remplis, laisse null sinon
		if(descriptionTitre.isEmpty()||descriptionTexte.isEmpty()) {
			spot.setPresentation(null);
		}else {
			ZoneTexte presentation = spot.getPresentation();
			if(presentation==null) {
				presentation = new ZoneTexte(0, descriptionTitre);
			}else {
				presentation.setTitre(descriptionTitre);
			}
			List<String> listParagraphes = new ArrayList<String>();
			String[] paragraphes = descriptionTexte.split("\n");
			for (int i = 0; i < paragraphes.length; i++) {
				listParagraphes.add(paragraphes[i]);
			}
			presentation.setListParagraphes(listParagraphes);
			spot.setPresentation(presentation);
		}

		//Création des listes Types, profils et orientations
		List<String> listTypesSpot = Arrays.asList(types.split(", "));
		List<String> listProfilsSpot = Arrays.asList(profils.split(", "));
		List<String> listOrientationsSpot = Arrays.asList(orientations.split(", "));
		spot.setTypes(listTypesSpot);
		spot.setProfils(listProfilsSpot);
		spot.setOrientations(listOrientationsSpot);
		
		
		// traitement upload fichier image
		String destPath = request.getServletContext().getRealPath("/img/spot");

		String fileName;
		if (myFileFileName != null) {
			String[] tab = myFileFileName.split("\\.");
			fileName = spot.getId() + "_0." + tab[tab.length - 1];
			try {
				File destFile = new File(destPath, fileName);
				FileUtils.copyFile(myFile, destFile);
			} catch (IOException e) {
				LOGGER.debug(e);
				return ERROR;
			}
			List<String> listPhotos = new ArrayList<String>();
			listPhotos.add(fileName);
			spot.setListPhotos(listPhotos);
		}
		
		//Mise à jout dans la base de donnés (appel du SpotManager)
		managerFactory.getSpotManager().updateSpot(spot);
		
		this.addActionMessage(this.getText("confirmationModificationSpot"));

		LOGGER.traceExit(result);
		return result;
	}

	/**
	 * Validation du formulaire de modification
	 */
	@Override
	public void validate() {
		LOGGER.traceEntry();
		if(nom!=null) {//si nom est null c'est la méthode versModifier qui est appeler (donc pas de validation), sinon n'est pas null mais au minimum vide
			Validator validator = Validation.byDefaultProvider().configure().buildValidatorFactory().getValidator(); 
			
			//Utilisation de la JSR 349 pour vérifié la validité des données pour chaque champ du formlaire
			Set<ConstraintViolation<Spot>> valueViolationsSpot = validator.validateValue(Spot.class, "nom", nom);
			if (!valueViolationsSpot.isEmpty())
				addFieldError("nom",getText("error.nom"));

			Set<ConstraintViolation<Ville>> valueViolationsVille = validator.validateValue(Ville.class, "nom", villeNom);
			if(!valueViolationsVille.isEmpty())
				addFieldError("villeNom",getText("error.ville.nom"));
			
			valueViolationsVille = validator.validateValue(Ville.class, "cp", villeCP);
			if(!valueViolationsVille.isEmpty())
				addFieldError("villeCP",getText("error.ville.cp"));

			valueViolationsVille = validator.validateValue(Ville.class, "departement", departement);
			if(!valueViolationsVille.isEmpty())
				addFieldError("departement",getText("error.departement"));
			
			valueViolationsSpot = validator.validateValue(Spot.class, "difficulteMin", difficulteMin);
			if (!valueViolationsSpot.isEmpty())
				addFieldError("difficulteMin",getText("error.difficulteMin"));
			
			valueViolationsSpot = validator.validateValue(Spot.class, "difficulteMax", difficulteMax);
			if (!valueViolationsSpot.isEmpty())
				addFieldError("difficulteMax",getText("error.difficulteMax"));
			
			if(difficulteMin.compareToIgnoreCase(difficulteMax)>0) {
				addFieldError("difficulteMax",getText("erreur.difficulte"));
			}
			
			int hMin=0;
			if(!hauteurMin.isEmpty()) {
				hMin=Integer.parseInt(hauteurMin);
			}
			valueViolationsSpot = validator.validateValue(Spot.class, "hauteurMin", hMin);
			if (!valueViolationsSpot.isEmpty())
				addFieldError("hauteurMin",getText("erreur.hauteurMin"));
			
			int hMax=0;
			if(!hauteurMax.isEmpty()) {
				hMax=Integer.parseInt(hauteurMax);
			}else {
				addFieldError("hauteurMax",getText("erreur.hauteurMax"));
			}
			valueViolationsSpot = validator.validateValue(Spot.class, "hauteurMax", hMax);
			if (!valueViolationsSpot.isEmpty())
				addFieldError("hauteurMax",getText("erreur.hauteurMax"));
			
			//vérification cohérence entre heuteur min et max
			if(hMax<hMin) {
				addFieldError("hauteurMax",getText("erreur.hauteur"));
			}

			int nSecteur=0;
			if(!nbSecteur.isEmpty()) {
				nSecteur=Integer.parseInt(nbSecteur);
			}
			valueViolationsSpot = validator.validateValue(Spot.class, "nbSecteur", nSecteur);
			if (!valueViolationsSpot.isEmpty())
				addFieldError("nbSecteur",getText("erreur.nbSecteur"));

			valueViolationsSpot = validator.validateValue(Spot.class, "nbVoie", nbVoie);
			if (!valueViolationsSpot.isEmpty())
				addFieldError("nbVoie",getText("erreur.nbVoie"));
			
			valueViolationsSpot = validator.validateValue(Spot.class, "latitude", latitude);
			if (!valueViolationsSpot.isEmpty())
				addFieldError("latitude",getText("erreur.latitude"));
			
			valueViolationsSpot = validator.validateValue(Spot.class, "longitude", longitude);
			if (!valueViolationsSpot.isEmpty())
				addFieldError("longitude",getText("erreur.longitude"));
			
			if(!descriptionTexte.isEmpty()) {
				Set<ConstraintViolation<ZoneTexte>> valueViolationsZoneTexte = validator.validateValue(ZoneTexte.class, "titre", descriptionTitre);
				if (!valueViolationsZoneTexte.isEmpty())
					addFieldError("descriptionTitre",getText("erreur.presentation.titre"));
			}
			
			if(!descriptionTitre.isEmpty()&&descriptionTexte.isEmpty()) {
				addFieldError("descriptionTitre",getText("erreur.presentation.texte"));
			}
			
			if(types.isEmpty())
				addFieldError("types",getText("erreur.types"));
			if(profils.isEmpty())
				addFieldError("profils",getText("erreur.profils"));
			if(orientations.isEmpty())
				addFieldError("orientations",getText("erreur.orientations"));
			
			//Vérification du format du fichier (png ou jpg)
			if(myFileFileName!=null) {
				String[] tab = myFileFileName.split("\\.");
				if(!tab[tab.length-1].equalsIgnoreCase("png")&&!tab[tab.length-1].equalsIgnoreCase("jpg")&&!tab[tab.length-1].equalsIgnoreCase("jpeg")) {
					addFieldError("myFile", getText("error.format"));
				}
			}
		}
		
		if(this.hasFieldErrors()) {//Si il y erreur, rechargement des données du formulaire (voir versModifier())
			try {
				spot = managerFactory.getSpotManager().getSpot(spotId);
			} catch (NotFoundException e) {
				LOGGER.error(e);
				this.addActionError(getText(e.getMessage()));
			}
			listDepartements = managerFactory.getSpotManager().getDepartements();
			listTypes = managerFactory.getSpotManager().getTypes();
			listProfils = managerFactory.getSpotManager().getProfils();
			listDifficultes = managerFactory.getSpotManager().getDifficultes();
			listOrientations = managerFactory.getSpotManager().getOrientations();
		}
		LOGGER.traceExit("hasFieldErrors ? : " + this.hasFieldErrors());
	}
}

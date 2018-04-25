package org.escalade.business.contract.manager;

import java.util.List;

import org.escalade.model.bean.spot.Departement;
import org.escalade.model.bean.spot.Spot;
import org.escalade.model.bean.texte.Commentaire;
import org.escalade.model.exception.FunctionalException;
import org.escalade.model.recherche.RechercheSpot;

/**
 * SpotManager
 * @author Oltenos
 *
 */
public interface SpotManager {
	
	/**
	 * Retourne le Spot correspondant à l'identifiant
	 * @param id
	 * @return Spot
	 */
	public Spot getSpot(int id);
	
	/**
	 * Enregistre le spot dans la base de données et le retourne modifié (avec son identifiant dans la base de données)
	 * @param spot
	 * @return Spot
	 * @throws FunctionalException levée en cas de non validation du bean
	 */
	public Spot createSpot(Spot spot) throws FunctionalException;
	
	/**
	 * Modifie le spot dans la base de données</br>
	 * ATTENTION : l'id doit correspondre à l'id dans la base de donnée</br>
	 * La modification sera en effet réalisée dans la ligne de la base de données correspondant à l'id
	 * @param spot
	 * @throws FunctionalException levée en cas de non validation du bean
	 */
	public void updateSpot(Spot spot) throws FunctionalException;
	
	/**
	 * Supprime de la base de données le spot correspondant à l'id 
	 * @param id
	 */
	public void deleteSpot(int id);
	
	/**
	 * Enregistre le commentaire dans la base de données et le retourne modifé (avec son identifiant dans la base de données)
	 * @param spotId
	 * @param commentaire
	 * @return Commentaire
	 * @throws FunctionalException levée en cas de non validation du bean
	 */
	public Commentaire createCommentaire(int spotId, Commentaire commentaire) throws FunctionalException;
	
	/**
	 * Supprime de la base de données le commentaire correspondant à l'identifiant
	 * @param id
	 */
	public void deleteCommentaire(int id);
	
	/**
	 * Recherche des spots à partir des critères en paramètre (contenues dans le bean RechercheSpot)
	 * @param criteres
	 * @return List<Spot>
	 * @throws FunctionalException levée en cas de non validation du bean
	 */
	public List<Spot> rechercheSpot(RechercheSpot criteres) throws FunctionalException;
	
	/**
	 * Retourne la liste des départements
	 * @return List<Departement>
	 */
	public List<Departement> getDepartements();
	
	/**
	 * Retourne la liste des types
	 * @return List<String>
	 */
	public List<String> getTypes();
	
	/**
	 * Retourne la liste des orientations
	 * @return List<String>
	 */
	public List<String> getOrientations();
	
	/**
	 * Retourne la liste des profils
	 * @return List<String>
	 */
	public List<String> getProfils();
	
	/**
	 * Retourne la liste des difficultés
	 * @return List<String>
	 */
	public List<String> getDifficultes();
	
}
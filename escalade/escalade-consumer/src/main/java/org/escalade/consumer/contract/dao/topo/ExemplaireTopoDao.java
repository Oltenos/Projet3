package org.escalade.consumer.contract.dao.topo;

import java.util.Date;
import java.util.List;

import org.escalade.model.bean.topo.ExemplaireTopo;

/**
 * ExemplaireTopoDao
 * 
 * @author Oltenos
 *
 */
public interface ExemplaireTopoDao {

	/**
	 * Retourne la liste des exemplaires de topo possédés par l'utilisateur
	 * 
	 * @param pseudoProprietaire
	 * @return List<ExemplaireTopo>
	 */
	public List<ExemplaireTopo> getListExemplaireTopo(String pseudoProprietaire);

	/**
	 * Retourne la liste des exemplaires existant d'un topo à partir de son titre et
	 * disponible entre les dates indiquées
	 * 
	 * @param titreTopo
	 * @param fin
	 * @param debut
	 * @return List<ExemplaireTopo>
	 */
	public List<ExemplaireTopo> getListExemplaireTitreTopo(String titreTopo, Date debut, Date fin);

	/**
	 * Retourne l'exemplaire de topo à partir de son identifiant
	 * 
	 * @param id
	 * @return ExemplaireTopo
	 */
	public ExemplaireTopo getExemplaireTopo(int id);

	/**
	 * Enregistre l'exemplaire de topo dans la base de données et le retourne
	 * modifié (avec son identifiant dans la base de données)
	 * 
	 * @param exTopo
	 * @return ExemplaireTopo
	 */
	public ExemplaireTopo createExemplaireTopo(ExemplaireTopo exemplaireTopo);

	/**
	 * Supprime de la base données un exemplaire de topo à partir de son identifiant
	 * 
	 * @param id
	 */
	public void deleteExemplaireTopo(int id);

}

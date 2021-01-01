/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.asset;



import com.bytes.hrm.dao.entity.AstAsset;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.asset.AstAssetDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class AstAssetServiceImpl implements AstAssetService {

     
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    AstAssetDao dao = factory.getAstAssetDao();
    
    
    @Override
    public AstAsset create(AstAsset t) {
        return dao.create(t);
    }

    @Override
    public AstAsset read(Integer id) {
        
         return dao.read(id);
    }

    @Override
    public AstAsset update(AstAsset t) {
     
      return dao.update(t);
    
    }

    @Override
    public void delete(Integer id) {
        
          dao.delete(id);
    }

    @Override
    public List<AstAsset> findAll() {
      return dao.findAll();
    }
    


   
    

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.asset;



import com.bytes.hrm.dao.entity.AstBrand;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.asset.AstBrandDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class AstBrandServiceImpl implements AstBrandService {

     
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    AstBrandDao dao = factory.getAstBrandDao();
    
    
    @Override
    public AstBrand create(AstBrand t) {
        return dao.create(t);
    }

    @Override
    public AstBrand read(Integer id) {
        
         return dao.read(id);
    }

    @Override
    public AstBrand update(AstBrand t) {
     
      return dao.update(t);
    
    }

    @Override
    public void delete(Integer id) {
        
          dao.delete(id);
    }

    @Override
    public List<AstBrand> findAll() {
      return dao.findAll();
    }
    


   
    

}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.asset;



import com.bytes.hrm.dao.entity.AstCategory;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.asset.AstCategoryDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class AstCategoryServiceImpl implements AstCategoryService {

     
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    AstCategoryDao dao = factory.getAstCategoryDao();
    
    
    @Override
    public AstCategory create(AstCategory t) {
        return dao.create(t);
    }

    @Override
    public AstCategory read(Integer id) {
        
         return dao.read(id);
    }

    @Override
    public AstCategory update(AstCategory t) {
     
      return dao.update(t);
    
    }

    @Override
    public void delete(Integer id) {
        
          dao.delete(id);
    }

    @Override
    public List<AstCategory> findAll() {
      return dao.findAll();
    }
    


   
    

}

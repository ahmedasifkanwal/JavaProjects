/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.asset;



import com.bytes.hrm.dao.entity.AstVendor;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.asset.AstVendorDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class AstVendorServiceImpl implements AstVendorService {

     
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    AstVendorDao dao = factory.getAstVendorDao();
    
    
    @Override
    public AstVendor create(AstVendor t) {
        return dao.create(t);
    }

    @Override
    public AstVendor read(Integer id) {
        
         return dao.read(id);
    }

    @Override
    public AstVendor update(AstVendor t) {
     
      return dao.update(t);
    
    }

    @Override
    public void delete(Integer id) {
        
          dao.delete(id);
    }

    @Override
    public List<AstVendor> findAll() {
      return dao.findAll();
    }
    


   
    

}

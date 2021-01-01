/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.asset;



import com.bytes.hrm.dao.entity.AstStatus;
import com.bytes.hrm.dao.factory.DAOFactory;
import com.bytes.hrm.dao.factory.asset.AstStatusDao;
import java.util.List;

/**
 *
 * @author Shahid
 */
public class AstStatusServiceImpl implements AstStatusService {

     
// create the required DAO Factory
    DAOFactory factory = DAOFactory.getDAOFactory();
    AstStatusDao dao = factory.getAstStatusDao();
    
    
    @Override
    public AstStatus create(AstStatus t) {
        return dao.create(t);
    }

    @Override
    public AstStatus read(Integer id) {
        
         return dao.read(id);
    }

    @Override
    public AstStatus update(AstStatus t) {
     
      return dao.update(t);
    
    }

    @Override
    public void delete(Integer id) {
        
          dao.delete(id);
    }

    @Override
    public List<AstStatus> findAll() {
      return dao.findAll();
    }
    


   
    

}

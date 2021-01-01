/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.qualification;

import com.bytes.hrm.service.job.*;
import com.bytes.hrm.dao.entity.Language;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface LanguageService {
  
    Language create(Language t);

    Language read(Integer id);

    Language update(Language t);

    void delete(Integer id);

    List<Language> findAll();

}

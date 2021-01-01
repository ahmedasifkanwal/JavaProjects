/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.service.common;

import com.bytes.hrm.dao.entity.CurrencyType;
import java.util.List;

/**
 *
 * @author Shahid
 */
public interface CurrencyTypeService {

    CurrencyType create(CurrencyType t);

    CurrencyType read(String id);

    CurrencyType update(CurrencyType t);

    void delete(String id);

    List<CurrencyType> findAll();

}

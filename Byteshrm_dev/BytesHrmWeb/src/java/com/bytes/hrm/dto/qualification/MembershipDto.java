/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bytes.hrm.dto.qualification;

import com.bytes.hrm.dto.job.*;
import com.bytes.hrm.dto.common.*;
import com.bytes.hrm.dao.entity.Membership;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Saleem
 */
public class MembershipDto  implements  Serializable{

    /**
     * @return the membership
     */
    public  Membership getMembership() {
        return membership;
    }

    /**
     * @param membership the membership to set
     */
    public void setMembership( Membership membership) {
        this.membership = membership;
    }

    /**
     * @return the membershipList
     */
    public List< Membership> getMembershipList() {
        return membershipList;
    }

    /**
     * @param membershipList the membershipList to set
     */
    public void setMembershipList(List< Membership> membershipList) {
        this.membershipList = membershipList;
    }
    
   private  Membership membership=new  Membership();   
   private List< Membership> membershipList=new ArrayList<>();
    
}

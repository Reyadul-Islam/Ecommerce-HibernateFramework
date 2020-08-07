
package com.learn.mycart.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class LikeOption {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(length=3000, name="l_id")
    private int lid;
    @Column(length=3000, name="p_id")
   
    private int pid;
    @Column(length=3000, name="u_id")
   
    private int uid;

    public LikeOption() {
    }

    
    
    
    
    public LikeOption(int lid, int pid, int uid) {
        this.lid = lid;
        this.pid = pid;
        this.uid = uid;
    }

    public LikeOption(int pid, int uid) {
        this.pid = pid;
        this.uid = uid;
    }
    

    public int getLid() {
        return lid;
    }

    public void setLid(int lid) {
        this.lid = lid;
    }

    public int getPid() {
        return pid;
    }

    public void setPid(int pid) {
        this.pid = pid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    @Override
    public String toString() {
        return "LikeOption{" + "lid=" + lid + ", pid=" + pid + ", uid=" + uid + '}';
    }
    
    
    
}

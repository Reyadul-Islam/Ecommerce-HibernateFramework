
package com.learn.mycart.entities;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class PStore {
    @Id
    private int Pid;
    @Column(length=100, name="user_name")
    private String uName;
    @Column(length=100,name="user_email")
    private String uEmail;
    @Column(length=3000, name="user_address")
    private String uAddress;
    @Column(length=12, name="user_phone")
    private String uPhone;

    public PStore(int Pid, String uName, String uEmail, String uAddress, String uPhone) {
        this.Pid = Pid;
        this.uName = uName;
        this.uEmail = uEmail;
        this.uAddress = uAddress;
        this.uPhone = uPhone;
    }

    public int getPid() {
        return Pid;
    }

    public void setPid(int Pid) {
        this.Pid = Pid;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName;
    }

    public String getuEmail() {
        return uEmail;
    }

    public void setuEmail(String uEmail) {
        this.uEmail = uEmail;
    }

    public String getuAddress() {
        return uAddress;
    }

    public void setuAddress(String uAddress) {
        this.uAddress = uAddress;
    }

    public String getuPhone() {
        return uPhone;
    }

    public void setuPhone(String uPhone) {
        this.uPhone = uPhone;
    }

    @Override
    public String toString() {
        return "ProductStore{" + "Pid=" + Pid + ", uName=" + uName + ", uEmail=" + uEmail + ", uAddress=" + uAddress + ", uPhone=" + uPhone + '}';
    }
    
    
}


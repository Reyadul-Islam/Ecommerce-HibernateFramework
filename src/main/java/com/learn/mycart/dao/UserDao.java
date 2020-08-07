
package com.learn.mycart.dao;

import com.learn.mycart.entities.User;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class UserDao {
    
    private SessionFactory factory;

    public UserDao(SessionFactory factory) {
        this.factory = factory;
    }
    //get user by email and password
    public User getUserByEmailAndPassword(String email,String password)
    {
        User user=null;
        try
        {
            String query="from User where userEmail=:e and userPassword=:p";
            Session session=this.factory.openSession();
            Query q=session.createQuery(query);
            q.setParameter("e",email);
            q.setParameter("p",password);
            
            user=(User) q.uniqueResult();
            
            session.close();
        }
        catch(Exception e)
        {
           e.printStackTrace();
        }
        
      
        return user;
    }
    
    public boolean updateUser(User user)
    {
        boolean f=false;
        try{
            String query="update User set userName=:n,userEmail=:e,userPassword=:p,userPhone=:o,userPic=:c,userAddress=:a,userType=:t where userId=:i";
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            Query q=session.createQuery(query);
            
            q.setParameter("n",user.getUserName());
            q.setParameter("e",user.getUserEmail());
            q.setParameter("p",user.getUserPassword());
            q.setParameter("o",user.getUserPhone() );
            q.setParameter("c",user.getUserPic());
            q.setParameter("a",user.getUserAddress());
            q.setParameter("t",user.getUserType());
            q.setParameter("i",user.getUserId());
            
            q.executeUpdate();
            tx.commit();
            session.close();
            f=true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return f;
    }
   
    public List<Integer> getUserCount()
    {
        
            String query="select count(userId) from User";
            Session session=this.factory.openSession();
           
            Query q=session.createQuery(query);
            List<Integer> list=q.list(); 
            
            session.close();
            return list;
            
        
    }
    
    
}

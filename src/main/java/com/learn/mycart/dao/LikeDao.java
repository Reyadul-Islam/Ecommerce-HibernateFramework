
package com.learn.mycart.dao;
import com.learn.mycart.entities.LikeOption;
import java.sql.*;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class LikeDao {
    private SessionFactory factory;

    public LikeDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    
    public boolean insertLike(int pid,int uid)
    {
       Boolean f=false;
        try
        {
          /*  String q="insert into lik(pid,uid) values(?,?)";
            PreparedStatement p=this.con.prepareStatement(q);
            //values set
            p.setInt(1,pid);
            p.setInt(2,uid);
            
            p.executeUpdate();*/
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
             //Add new Employee object
            LikeOption emp = new LikeOption();
            emp.setPid(pid);
            emp.setUid(uid);
          
         
            //Save the employee in database
            session.save(emp);
             
            
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
    
    public List<Integer> countLikeOnPost(int pid)
    {
       
         List<Integer>list=null;
         String q="select count(lid) from LikeOption where pid=:c";
         Session s=this.factory.openSession();
         Query query=s.createQuery(q);
         query.setParameter("c",pid);
         list=query.list(); 
         s.close();
         return list;
    }
    
    public List<Integer> isLikedByUser(int pid,int uid)
    {
       boolean f=false;
       List<Integer>list=null;
       try
       {
           String q="from LikeOption where pid=:p and uid=:u";
           Session s=this.factory.openSession();
          // Transaction tx=s.beginTransaction();
           Query query=s.createQuery(q);
           query.setParameter("p",pid);
           query.setParameter("u",uid);
           list=query.list();
           if(list!=null)
           {
               f=true;
           }
           
           
           //tx.commit();
           s.close();
           
        
           
          
           
       }
        catch(Exception e)
        {
            e.printStackTrace();
          
        }
        return list; 
        
    }
    public boolean deleteLike(int pid,int uid)
    {
        boolean f=false;
        
        try
        {
           String q="delete from LikeOption where pid=:p and uid=:u";
           
           Session s=this.factory.openSession();
           Transaction tx=s.beginTransaction();
           Query query=s.createQuery(q);
           query.setParameter("p",pid);
           query.setParameter("u",pid);
        
           query.executeUpdate();
           tx.commit();
           s.close();
           f=true;
            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        return f;
    }
    
    
}

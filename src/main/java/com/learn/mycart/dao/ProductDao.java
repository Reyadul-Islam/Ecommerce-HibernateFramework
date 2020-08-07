
package com.learn.mycart.dao;

import com.learn.mycart.entities.PStore;
import com.learn.mycart.entities.Product;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class ProductDao {
    
     private SessionFactory factory;

    public ProductDao(SessionFactory factory) {
        this.factory = factory;
    }
    //save product to db
     public boolean saveProduct(Product product)
    {
       boolean f=false;
        try{
            Session session=this.factory.openSession();
            Transaction tx=session.beginTransaction();
            
            session.save(product);
            
            tx.commit();
            session.close();
            f=true;
        }
        catch(Exception e)
        {
            e.printStackTrace();
            f=false;
        }
        
        return f;
        
        
    }
    
    //get all products
     public List<Product>getAllProducts()
     {
         
         
         Session s=this.factory.openSession();
         Query query=s.createQuery("from Product");
         
         List<Product>list=query.list();
         s.close();
         return list;
         
         
         
         
     
     }
     
    public Product getProductByProductId(int productId)
    {
        
        Product p=null;
        
        try
        {
        String q="from Product where Pid=:p";
        Session s=this.factory.openSession();
        Query query=s.createQuery(q);
       
        Transaction tx=s.beginTransaction();
            
        query.setParameter("p",productId);
       
         p=(Product) query.uniqueResult();
            
         tx.commit();
         s.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
        
      return p;  
        
    }
     public List<Product>getAllProductsById(int cid)
     {
         List<Product>list=null;
         try
         {
         Session s=this.factory.openSession();
         Query query=s.createQuery("from Product as p where p.category.categoryId=:id ");
         
         query.setParameter("id",cid);
         
         list=query.list();
         s.close();
        
         }
         catch(Exception e)
         {
             e.printStackTrace();
         }
         
        return list; 
         
     
     }
    
     public List<Integer> getProductCount()
    {
        
            String query="select count(Pid) from Product";
            Session session=this.factory.openSession();
           
            Query q=session.createQuery(query);
            List<Integer> list=q.list(); 
            
            session.close();
            return list;
            
        
    }
     public List<Product> getAllProductsBy()
    {
        Session s=this.factory.openSession();
        Query query=s.createQuery("from Product");
        
        List<Product> list=query.list();
        
        
        return list;
    }
      public List getAllPhone(String phone)
      {
         
            String query="select Pid from PStore where uPhone=:e";
            Session session=this.factory.openSession();
            Query q=session.createQuery(query);
            q.setParameter("e",phone);
            List li=q.list();
            
            session.close();
            return li;
          
      }
    public List<Product> getProduct(List<Integer> productId)
    {
        
        List<Product> listResult1=null;
       
        try
        {
        String q="from Product where Pid in (:c)";
        Session s=this.factory.openSession();
        Query query=s.createQuery(q);
         
        query.setParameterList("c",productId);
        
        listResult1= query.list();
      
            
         
         s.close();
          
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        
        
        return listResult1;
        
      
        
    }
    public boolean deleteProduct(int pid)
    {
        boolean f=false;
        try
        {
        String q="delete from PStore where Pid=:c";
        Session s=this.factory.openSession();
        Query query=s.createQuery(q);
        query.setParameter("c",pid);
        query.executeUpdate();
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
